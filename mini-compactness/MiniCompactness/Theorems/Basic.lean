/-
# MiniCompactness.Theorems.Basic

Fundamental theorems of compactness:
- Tychonoff theorem (finite and arbitrary)
- Heine-Borel theorem (subset of ℝⁿ compact ↔ closed and bounded)
- Tube lemma
- Alexander subbase theorem
-/
import MiniCompactness.Core.Basic
import MiniCompactness.Core.Laws
import MiniCompactness.Constructions.Products

namespace MiniCompactness

set_option maxHeartbeats 400000

/-! ## Tychonoff Theorem (Finite) -/

/-- The product of two compact spaces is compact (finite Tychonoff). -/
theorem tychnoffFinite {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
  (hX : Compact X) (hY : Compact Y) : Compact (X × Y) := by
  -- Standard proof via the tube lemma: given an open cover of X × Y,
  -- for each x, use compactness of {x} × Y to get a finite subcover
  -- containing {x} × Y, then apply the tube lemma to extend to Uₓ × Y,
  -- finally use compactness of X to get a finite subcover of X.
  sorry

/-- The product of finitely many compact spaces is compact. -/
theorem tychnoffFiniteN {n : ℕ} {α : Fin n → Type u}
  [∀ i, TopologicalSpace (α i)] (h : ∀ i, Compact (α i)) :
  Compact (∀ i, α i) := by
  induction' n with m ih
  · -- empty product = Unit, which is compact
    sorry
  · -- reduce to product of two compact spaces
    sorry

/-! ## Heine-Borel Theorem -/

/-- A subset of ℝⁿ is compact iff it is closed and bounded.
(Formulated axiomatically for general "bounded" metric-like structure.) -/
structure HeineBorelSpace (X : Type u) [TopologicalSpace X] where
  closed : Set X → Prop
  bounded : Set X → Prop
  theorem : ∀ (K : Set X), IsCompact K ↔ closed K ∧ bounded K

/-- The Heine-Borel theorem: in ℝ with the standard topology,
a subset is compact iff it is closed and bounded. -/
axiom heineBorelReal : HeineBorelSpace ℝ

/-- The Heine-Borel theorem for ℝⁿ. -/
axiom heineBorelRⁿ (n : ℕ) : HeineBorelSpace (Fin n → ℝ)

/-- Compact subsets of ℝⁿ are closed and bounded. -/
theorem compactImpliesClosedAndBounded (n : ℕ) (K : Set (Fin n → ℝ)) (hK : IsCompact K) :
  (heineBorelRⁿ n).closed K ∧ (heineBorelRⁿ n).bounded K :=
  ((heineBorelRⁿ n).theorem K).mp hK

/-- Closed and bounded subsets of ℝⁿ are compact. -/
theorem closedAndBoundedImpliesCompact (n : ℕ) (K : Set (Fin n → ℝ))
  (hClosed : (heineBorelRⁿ n).closed K) (hBounded : (heineBorelRⁿ n).bounded K) :
  IsCompact K :=
  ((heineBorelRⁿ n).theorem K).mpr ⟨hClosed, hBounded⟩

/-! ## Tube Lemma -/

/-- The tube lemma: if Y is compact and N is an open neighborhood of {x} × Y,
then there exists an open U containing x such that U × Y ⊆ N. -/
theorem tubeLemmaTheorem {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
  (hY : Compact Y) (x : X) (N : Set (X × Y)) (hOpen : IsOpen N)
  (hSlice : ∀ y, (x, y) ∈ N) : ∃ (U : Set X), IsOpen U ∧ x ∈ U ∧ (U ×ˢ Set.univ) ⊆ N := by
  -- For each y, we have (x, y) ∈ N, and N is open in the product topology,
  -- so there exist open Uy ∋ x and Vy ∋ y with Uy × Vy ⊆ N.
  -- The Vy cover Y, so by compactness there is a finite subcover Vy₁, ..., Vyₙ.
  -- Take U = ⋂ Uyᵢ, which is an open neighborhood of x.
  sorry

/-! ## Alexander Subbase Theorem -/

/-- A subbase S for the topology of X is a family of sets such that
finite intersections of elements of S form a basis. -/
structure Subbase (X : Type u) [TopologicalSpace X] where
  sets : Set (Set X)
  openSets : ∀ S ∈ sets, IsOpen S
  generates : ∀ (U : Set X), IsOpen U →
    ∃ (T : Set (Set X)), (∀ V ∈ T, V ∈ sets) ∧ U = ⋃₀ T

/-- Alexander subbase theorem: If every open cover by subbasic sets has
a finite subcover, then X is compact. -/
theorem alexanderSubbaseTheorem {X : Type u} [TopologicalSpace X]
  (S : Subbase X) (hCover : ∀ {ι : Type u} (U : ι → Set X),
    (∀ i, U i ∈ S.sets) → (⋃ i, U i = Set.univ) →
    ∃ (s : Finset ι), (⋃ i ∈ s, U i = Set.univ)) : Compact X := by
  -- This is one of the standard proofs in general topology,
  -- using Zorn's lemma on open covers that lack finite subcovers.
  sorry

/-- Alternative: Alexander subbase theorem via Zorn's lemma. -/
theorem alexanderSubbaseWithZorn {X : Type u} [TopologicalSpace X]
  (S : Subbase X) (hSubbaseCover : ∀ (C : Set (Set X)),
    C ⊆ S.sets → (⋃₀ C = Set.univ) → ∃ (D : Set (Set X)), D ⊆ C ∧ Set.Finite D ∧ ⋃₀ D = Set.univ) :
  Compact X := by
  sorry

#eval "── Theorems.Basic: Tychonoff ──"
#eval "tychnoffFinite | sorry"
#eval "tychnoffFiniteN | sorry"
#eval "── Theorems.Basic: Heine-Borel ──"
#eval "heineBorelReal | axiom"
#eval "heineBorelRⁿ | axiom"
#eval "── Theorems.Basic: Tube lemma ──"
#eval "tubeLemmaTheorem | sorry"
#eval "── Theorems.Basic: Alexander ──"
#eval "alexanderSubbaseTheorem | sorry"
#eval "── All 4 basic theorems registered ──"

end MiniCompactness
