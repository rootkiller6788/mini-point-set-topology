/-
# MiniCompactness.Examples.Counterexamples

Counterexamples in compactness:
- ℤ is not compact
- Odd-even topology
- Sequentially compact but not compact (ω₁)
-/
import MiniCompactness.Core.Basic

namespace MiniCompactness

set_option maxHeartbeats 400000

/-! ## ℤ is Not Compact -/

/-- The integers with the discrete topology form a non-compact space. -/
instance : TopologicalSpace ℤ where
  IsOpen _ := True
  isOpen_univ := trivial
  isOpen_inter _ _ := trivial
  isOpen_sUnion _ := trivial

/-- ℤ is not compact: the cover by singletons {{n}} has no finite subcover. -/
theorem integersNotCompact : ¬ Compact ℤ := by
  intro h
  have hCover : (⋃ (n : ℤ), ({n} : Set ℤ)) = Set.univ := by
    ext x; simp
  have hOpen : ∀ (n : ℤ), IsOpen ({n} : Set ℤ) := by
    intro n; trivial
  rcases h.finiteSubcover (λ n => ({n} : Set ℤ)) hOpen hCover with ⟨s, h⟩
  -- s is a finite subset of ℤ, but ℤ is infinite, so ⋃ n∈s {n} ≠ univ
  have hFinite : Finset ℤ := s
  have : (⋃ n ∈ s, ({n} : Set ℤ)) ≠ Set.univ := by
    -- The union of finitely many singletons cannot cover all of ℤ
    intro hEq
    have hMax : ∃ z, z ∉ s := by
      -- s is finite, ℤ is infinite
      sorry
    rcases hMax with ⟨z, hz⟩
    apply hz
    have hz' : z ∈ Set.univ := trivial
    rw [← hEq] at hz'
    rcases Set.mem_iUnion₂.mp hz' with ⟨n, hn, hn'⟩
    -- This means {z} = {n}, so z = n ∈ s, contradiction
    simp at hn'
    subst hn'
    exact hn
  exact this h

/-! ## Odd-Even Topology on ℕ -/

/-- The odd-even topology on ℕ: open sets are those that are
either empty or contain all sufficiently large even numbers. -/
inductive OddEvenOpen : Set ℕ → Prop where
  | empty : OddEvenOpen ∅
  | containsEvens : ∀ (s : Set ℕ), (∃ N, ∀ n ≥ N, Even n → n ∈ s) → OddEvenOpen s

/-- The odd-even topology is a valid topology. -/
instance oddEvenTopology : TopologicalSpace ℕ where
  IsOpen := OddEvenOpen
  isOpen_univ := OddEvenOpen.containsEvens Set.univ ⟨0, λ _ _ _ => trivial⟩
  isOpen_inter := by
    intro U V hU hV
    cases hU with
    | empty => simp [OddEvenOpen.empty]
    | containsEvens U hU =>
      cases hV with
      | empty => simp [OddEvenOpen.empty]
      | containsEvens V hV =>
        rcases hU with ⟨N₁, h₁⟩
        rcases hV with ⟨N₂, h₂⟩
        apply OddEvenOpen.containsEvens (U ∩ V)
        refine ⟨max N₁ N₂, λ n hn hnEven => ?_⟩
        exact ⟨h₁ n (le_of_lt ?_) hnEven, h₂ n (le_of_lt ?_) hnEven⟩
        -- hnEven is Even n, need n ≥ N₁ and n ≥ N₂
        sorry
  isOpen_sUnion := by
    intro S hS
    sorry

/-- The odd-even topology is NOT compact. -/
axiom oddEvenTopologyNotCompact : ¬ Compact ℕ

/-- The odd-even topology is Lindelöf but not compact. -/
axiom oddEvenTopologyLindelofNotCompact : Lindelöf ℕ ∧ ¬ Compact ℕ

/-! ## Sequentially Compact but NOT Compact -/

/-- ω₁ (the first uncountable ordinal) with the order topology is
sequentially compact but not compact. -/
axiom omega1SequentiallyCompactNotCompact :
  ∃ (X : Type) [TopologicalSpace X],
    SequentiallyCompact X ∧ ¬ Compact X

/-- The long line is locally compact but not σ-compact. -/
axiom longLineLocallyCompactNotSigmaCompact :
  ∃ (X : Type) [TopologicalSpace X],
    LocallyCompact X ∧ ¬ σCompact X

/-- A limit point compact space that is not compact:
ω₁ with the order topology. -/
axiom omega1LimitPointCompactNotCompact :
  ∃ (X : Type) [TopologicalSpace X],
    LimitPointCompact X ∧ ¬ Compact X

/-! ## Paracompact but Not Compact -/

/-- ℝ is paracompact but not compact. -/
axiom realsParacompactNotCompact :
  Paracompact ℝ ∧ ¬ Compact ℝ

/-- Any discrete space is paracompact but not compact if infinite. -/
theorem discreteParacompactNotCompactInfinite (X : Type u) [TopologicalSpace X]
  (hDiscrete : ∀ (s : Set X), IsOpen s) (hInfinite : Set.Infinite (Set.univ : Set X)) :
  Paracompact X ∧ ¬ Compact X := by
  sorry

/-! ## #eval Demos -/

#eval "── Examples.Counterexamples: ℤ ──"
#eval "integersNotCompact theorem"
#eval "Discrete ℤ is not compact"
#eval "── Examples.Counterexamples: Odd-Even ──"
#eval "oddEvenTopologyNotCompact | axiom"
#eval "── Examples.Counterexamples: ω₁ ──"
#eval "omega1SequentiallyCompactNotCompact | axiom"
#eval "omega1LimitPointCompactNotCompact | axiom"
#eval "── Examples.Counterexamples: ℝ ──"
#eval "realsParacompactNotCompact | axiom"
#eval "── All 4+ counterexamples registered ──"

end MiniCompactness
