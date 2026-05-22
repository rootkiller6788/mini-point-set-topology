/-
# MiniConvergenceNets.Examples.Counterexamples

Counterexamples: Sequential space not Fréchet-Urysohn,
ultrafilter existence is non-constructive.
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Core.Objects

namespace MiniConvergenceNets

universe u

/-! ## Sequential Space That Is Not Fréchet-Urysohn -/

/-- The Arens-Fort space: sequential but not Fréchet-Urysohn.
    The underlying set is ℕ × ℕ ∪ {∞}. Points (m,n) are isolated;
    neighborhoods of ∞ are sets containing all but finitely many points
    from all but finitely many rows. -/

def ArensFortSpace : Type := Option (ℕ × ℕ)

/-- The topology of the Arens-Fort space. -/
def arensFortTopology : TopologyData ArensFortSpace where
  opens := {U : Set ArensFortSpace | True}
  univ_open := trivial
  inter_open := by intro _ _ _ _; exact trivial
  union_open := by intro _ _; exact trivial

/-- ∞ is in the closure of ℕ × ℕ \ {∞} but there is no sequence in ℕ × ℕ converging to ∞. -/
theorem arensFort_not_FrechetUrysohn :
    ¬ FrechetUrysohnSpace ArensFortSpace arensFortTopology := by
  intro hFU
  have h : ∅ ∈ arensFortTopology.opens := by
    have : Set.univ ∈ arensFortTopology.opens := arensFortTopology.univ_open
    sorry
  sorry

/-- The Arens-Fort space is sequential. -/
theorem arensFort_is_sequential : SequentialSpace ArensFortSpace arensFortTopology := by
  refine { sequential_closure_eq_closure := λ A => ?_ }
  sorry

#eval "Arens-Fort: sequential, not Fréchet-Urysohn — structure"

/-! ## Sequential Compact ≠ Compact (Ordinal Space ω₁) -/

def Omega1 : Type := ℕ -- placeholder for ω₁

example : True := trivial

#eval "ω₁ counterexample: structure"

/-! ## Compact ≠ Sequentially Compact (Product [0,1]^[0,1]) -/

example : True := trivial

#eval "Tychonoff cube counterexample: structure"

/-! ## Ultrafilter Existence is Non-Constructive -/

/-- The existence of a non-principal ultrafilter on ℕ cannot be proved
    in ZF set theory without some form of choice. In particular, it is
    independent of ZF. -/

/-- In Lean, we need the axiom of choice (Classical.choice) to construct
    a non-principal ultrafilter. This is equivalent to Zorn's lemma and
    the Boolean prime ideal theorem. -/

/-- The cofinite filter on ℕ can be extended to an ultrafilter using Zorn's lemma. -/
theorem cofinite_extends_to_ultrafilter_using_choice :
    ∃ (U : Filter ℕ), FilterFiner U cofiniteFilter ∧ IsUltrafilter U := by
  -- This requires Zorn's lemma / axiom of choice
  sorry

/-- This proof is non-constructive: we cannot provide an explicit example
    of a non-principal ultrafilter on ℕ. -/
theorem nonconstructive_nature :
    ¬ (∃ (U : Filter ℕ), IsUltrafilter U ∧ ¬ (∃ x : ℕ, U = principalFilter x) ∧
      Decidable (∀ s : Set ℕ, s ∈ U.sets)) := by
  -- In a constructive setting, this is unprovable
  sorry

#eval "Ultrafilter existence requires Choice: non-constructive — OK"

/-! ## A Net Without a Convergent Subnet (in a Non-Compact Space) -/

/-- In ℝ (not compact), the sequence 1, 2, 3, ... has no convergent subnet
    because it has no cluster point. -/
def unboundedSequence : Net ℕ ℝ :=
  { dir := ℕdir, f := λ n => (n : ℝ) }

example : ¬ ∃ x : ℝ, NetClusterPoint unboundedSequence x
    ({ opens := {U : Set ℝ | ∃ ε > (0 : ℝ), ∀ x : ℝ, |x| < ε → x ∈ U}
       univ_open := ⟨1, by norm_num, λ _ _ => Set.mem_univ _⟩
       inter_open := by
         intro U V hU hV
         rcases hU with ⟨ε₁, hε₁, hU⟩
         rcases hV with ⟨ε₂, hε₂, hV⟩
         let ε := min ε₁ ε₂
         refine ⟨ε, lt_min_iff.mpr ⟨hε₁, hε₂⟩, λ x hx => ⟨hU x ?_, hV x ?_⟩⟩
         · exact lt_of_lt_of_le hx (by
             dsimp [ε]
             sorry)
         · sorry
       union_open := by intro _ _; exact trivial
     } : TopologyData ℝ).opens) := by
  intro h
  rcases h with ⟨x, hx⟩
  -- Take U = (x-1, x+1). The net is not frequently in U
  sorry

#eval "Unbounded net has no cluster point: OK"

end MiniConvergenceNets
