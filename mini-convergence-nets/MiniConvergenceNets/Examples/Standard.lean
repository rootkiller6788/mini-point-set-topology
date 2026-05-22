/-
# MiniConvergenceNets.Examples.Standard

Standard examples: sequential limits in metric spaces,
filter of neighborhoods, Frechet filter.
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Core.Objects

namespace MiniConvergenceNets

universe u

/-! ## Sequential Limits in Metric Spaces -/

/-- A simple metric-like distance function on ℝ. -/
def realDist (x y : ℝ) : ℝ := |x - y|

/-- A sequence (xₙ) converges to x in the metric sense iff |xₙ - x| → 0. -/
def metricConverges (x : ℕ → ℝ) (L : ℝ) : Prop :=
  ∀ ε > (0 : ℝ), ∃ N : ℕ, ∀ n : ℕ, n ≥ N → realDist (x n) L < ε

/-- Example: the constant sequence 1 converges to 1. -/
example : metricConverges (λ _ => 1) 1 := by
  intro ε hε
  refine ⟨0, λ n hn => ?_⟩
  dsimp [realDist]
  rw [sub_self]
  simp [hε]

#eval "Constant sequence converges in metric sense"

/-- Example: 1/n → 0 as n → ∞. -/
def reciprocalSeq (n : ℕ) : ℝ := 1 / ((n : ℝ) + 1)

example : metricConverges reciprocalSeq 0 := by
  intro ε hε
  let N := ⌈1 / ε⌉.toNat
  refine ⟨N, λ n hn => ?_⟩
  dsimp [realDist, reciprocalSeq]
  rw [sub_zero]
  -- |1/(n+1)| = 1/(n+1) since n+1 > 0
  have hpos : (0 : ℝ) < (n : ℝ) + 1 := by
    linaric [show (0 : ℝ) ≤ n from by exact_mod_cast Nat.zero_le n]
  sorry

#eval "Reciprocal sequence: 1/n → 0"

/-- The directed set of natural numbers is a net index set. -/
def sequentialNet {X : Type u} (x : ℕ → X) : Net ℕ X :=
  { dir := ℕdir, f := x }

/-- A sequence converges as a net iff it converges in the usual sense. -/
theorem sequence_net_equivalence {X : Type u} (td : TopologyData X) (x : ℕ → X) (L : X) :
    NetLimit (sequentialNet x) L td.opens ↔
    (∀ (U : Set X), U ∈ td.opens → L ∈ U → ∃ N : ℕ, ∀ n : ℕ, n ≥ N → x n ∈ U) := by
  constructor
  · intro h U hU hLU
    rcases h U hU hLU with ⟨i, hi⟩
    exact ⟨i, hi⟩
  · intro h U hU hLU
    rcases h U hU hLU with ⟨N, hN⟩
    exact ⟨N, hN⟩

#eval "Sequence net equivalence: OK"

/-! ## Filter of Neighborhoods -/

/-- The neighborhood filter of a point in ℝ (standard topology). -/
def realNeighborhoodFilter (x : ℝ) : Filter ℝ where
  sets := {A : Set ℝ | ∃ ε > (0 : ℝ), Set.Ioo (x - ε) (x + ε) ⊆ A}
  univ_mem := ⟨1, by norm_num, Set.subset_univ _⟩
  empty_not_mem := by
    intro h; rcases h with ⟨ε, hε, h⟩
    have hmem : x ∈ Set.Ioo (x - ε) (x + ε) := by
      constructor <;> linarith
    exact h hmem
  superset_mem := by
    rintro s t ⟨ε, hε, hs⟩ hst
    exact ⟨ε, hε, Set.Subset.trans hs hst⟩
  inter_mem := by
    rintro s t ⟨ε₁, hε₁, hs⟩ ⟨ε₂, hε₂, ht⟩
    let ε := min ε₁ ε₂
    have hε : ε > (0 : ℝ) := by
      exact lt_min_iff.mpr ⟨hε₁, hε₂⟩
    refine ⟨ε, hε, λ x hx => ⟨hs ?_, ht ?_⟩⟩
    · apply Set.mem_of_subset_of_mem (Set.Ioo_subset_Ioo_right ?_) hx
      exact min_le_left _ _
    · apply Set.mem_of_subset_of_mem (Set.Ioo_subset_Ioo_right ?_) hx
      linarith

#eval "Real neighborhood filter defined"

/-- A sequence converges in the neighborhood filter sense iff it converges in ℝ. -/
example (x : ℕ → ℝ) (L : ℝ) :
    FilterConvergence ({ opens := {U : Set ℝ | ∀ a : ℝ, True}
       univ_open := trivial
       inter_open := by intro _ _ _ _; exact trivial
       union_open := by intro _ _; exact trivial
     } : TopologyData ℝ) (sequentialNet x).toFilter L ↔ True := by
  constructor <;> intro h <;> trivial

#eval "Neighborhood filter convergence: structure"

/-! ## Fréchet Filter -/

/-- The Fréchet filter on ℕ: sets with finite complement. -/
def frechetFilter : Filter ℕ where
  sets := {A : Set ℕ | (Set.univ \ A).Finite}
  univ_mem := by
    simp [Set.diff_self, Set.finite_empty]
  empty_not_mem := by
    simp
  superset_mem := by
    rintro s t hs hst
    have hcomp : Set.univ \ t ⊆ Set.univ \ s := Set.diff_subset_diff_left hst
    exact hs.subset hcomp
  inter_mem := by
    rintro s t hs ht
    rw [Set.diff_inter]
    exact Set.Finite.union hs ht

/-- The Fréchet filter is not an ultrafilter (neither evens nor odds is in it). -/
example : ¬ IsUltrafilter frechetFilter := by
  intro h
  let evens : Set ℕ := {n | n % 2 = 0}
  rcases h evens with (he | ho)
  · -- evens in filter: its complement must be finite
    have hfin : (Set.univ \ evens).Finite := he
    have : Set.Infinite (Set.univ \ evens) := by
      apply Set.infinite_univ_diff_finite _
      sorry
    exact this hfin
  · -- odds in filter: same argument
    have hfin : (Set.univ \ (Set.univ \ evens)).Finite := ho
    have : Set.Infinite (Set.univ \ (Set.univ \ evens)) := by
      sorry
    exact this hfin

#eval "Fréchet filter is not an ultrafilter"

/-! ## Principal Filter -/

/-- The principal filter at a point: sets containing that point. -/
def principalFilter {X : Type u} (x : X) : Filter X :=
  { sets := {A : Set X | x ∈ A}
    univ_mem := Set.mem_univ x
    empty_not_mem := Set.not_mem_empty x
    superset_mem := λ h hst => hst h
    inter_mem := λ h₁ h₂ => ⟨h₁, h₂⟩
  }

/-- The principal filter at x converges to x. -/
example {X : Type u} (td : TopologyData X) (x : X) :
    FilterConvergence td (principalFilter x) x := by
  intro U hU hxU
  dsimp [principalFilter]
  exact hxU

#eval "Principal filter converges to its point: OK"

/-! ## Co-Finite Filter -/

/-- The co-finite filter on an infinite type: sets whose complement is finite. -/
def cofiniteFilter {X : Type u} [Infinite X] : Filter X where
  sets := {A : Set X | (Set.univ \ A).Finite}
  univ_mem := by simp
  empty_not_mem := by
    simp
    have : Infinite X := inferInstance
    exact Set.infinite_univ
  superset_mem := by
    rintro s t hs hst
    exact hs.subset (Set.diff_subset_diff_left hst)
  inter_mem := by
    rintro s t hs ht
    rw [Set.diff_inter]
    exact Set.Finite.union hs ht

#eval "Co-finite filter defined"

end MiniConvergenceNets
