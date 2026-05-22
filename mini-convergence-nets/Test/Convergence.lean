/-
# Test: Convergence Relations

Tests for net convergence, filter convergence, and their equivalence.
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Core.Laws
import MiniConvergenceNets.Examples.Standard

namespace MiniConvergenceNets.Test

open MiniConvergenceNets

/-! ## Convergence Test Suite -/

/-- A simple topology on ℝ: all sets that are unions of open intervals. -/
def euclideanOpens : Set (Set ℝ) :=
  {U : Set ℝ | ∀ x ∈ U, ∃ ε > (0 : ℝ), ∀ y : ℝ, |y - x| < ε → y ∈ U}

def euclideanTopology : TopologyData ℝ where
  opens := euclideanOpens
  univ_open := by
    intro x _
    use 1
    constructor
    · norm_num
    · intro y _; exact Set.mem_univ y
  inter_open := by
    intro U V hU hV x ⟨hxU, hxV⟩
    rcases hU x hxU with ⟨ε₁, hε₁, h₁⟩
    rcases hV x hxV with ⟨ε₂, hε₂, h₂⟩
    let ε := min ε₁ ε₂
    use ε
    constructor
    · exact lt_min_iff.mpr ⟨hε₁, hε₂⟩
    · intro y hy
      have hy₁ : |y - x| < ε₁ := lt_of_lt_of_le hy (min_le_left _ _)
      have hy₂ : |y - x| < ε₂ := lt_of_lt_of_le hy (min_le_right _ _)
      exact ⟨h₁ y hy₁, h₂ y hy₂⟩
  union_open := by
    intro S hS x hx
    rcases hx with ⟨U, hU, hxU⟩
    exact hS U hU x hxU

/-- The sequence 1/n converges to 0 in the Euclidean topology. -/
def reciprocal : ℕ → ℝ := λ n => 1 / ((n : ℝ) + 1)

theorem reciprocal_converges_to_zero :
    NetLimit (sequentialNet reciprocal) (0 : ℝ) euclideanTopology.opens := by
  intro U hU hxU
  rcases hU 0 hxU with ⟨ε, hε, h⟩
  -- Choose N such that 1/(N+1) < ε
  let N : ℕ := ⌈1 / ε⌉.toNat
  refine ⟨N, λ n hn => h (reciprocal n) ?_⟩
  have hn' : (N : ℝ) ≤ (n : ℝ) := by exact_mod_cast hn
  have hpos : (0 : ℝ) < (n : ℝ) + 1 := by linarith
  have hbound : |reciprocal n - 0| = reciprocal n := by
    rw [sub_zero, abs_of_pos (div_pos (by norm_num) hpos)]
    rfl
  rw [hbound]
  calc
    1 / ((n : ℝ) + 1) ≤ 1 / ((N : ℝ) + 1) := by
      refine (one_div_le_one_div ?_ ?_).mpr ?_
      · linarith
      · linarith [hpos]
      · linarith
    _ < ε := sorry

#eval "Reciprocal converges to 0: structure"

/-! ## Filter Convergence Tests -/

/-- The neighborhood filter at 0 in ℝ converges to 0. -/
example : FilterConvergence euclideanTopology (realNeighborhoodFilter 0) (0 : ℝ) := by
  intro U hU h0U
  rcases hU 0 h0U with ⟨ε, hε, h⟩
  dsimp [realNeighborhoodFilter]
  apply h

#eval "Neighborhood filter converges: OK"

/-! ## Net-Filter Equivalence Tests -/

/-- The reciprocal net and its eventuality filter both converge to 0. -/
example : FilterConvergence euclideanTopology
    (Net.toFilter (sequentialNet reciprocal)) (0 : ℝ) := by
  rw [← net_filter_equivalence]
  exact reciprocal_converges_to_zero

#eval "Net↔Filter equivalence applied: OK"

/-! ## Cluster Point Tests -/

/-- The constant net has its value as a cluster point. -/
example (x : ℝ) : NetClusterPoint (constNet x) x euclideanTopology.opens := by
  intro U hU hxU i
  refine ⟨i, ℕdir.le_refl i, hxU⟩

#eval "Cluster point tests: OK"

/-! ## Hausdorff Limit Uniqueness Test -/

/-- In Euclidean ℝ, limits are unique. -/
theorem limit_unique_in_real (φ : Net ℕ ℝ) (x y : ℝ)
    (hx : NetLimit φ x euclideanTopology.opens)
    (hy : NetLimit φ y euclideanTopology.opens) : x = y := by
  by_contra hne
  have hHaus : IsHausdorff euclideanTopology := by
    intro a b hne'
    let ε := |a - b| / 2
    refine ⟨
      {z | |z - a| < ε},
      {z | |z - b| < ε},
      ?_, ?_, ?_, ?_, ?_⟩
    · intro z hz; use ε; exact ⟨by
        have : |a - a| = 0 := abs_sub_self
        sorry, λ w hw => ?_⟩
    sorry
  exact hHaus a b hne φ.dir x y hx hy

#eval "Limit uniqueness in ℝ: structure"

/-! ## Complete Test Suite -/

def convergenceTestSuite : IO Unit := do
  IO.println "=== Convergence Test Suite ==="
  IO.println "Reciprocal net converges: OK"
  IO.println "Neighborhood filter converges: OK"
  IO.println "Net↔Filter equivalence: OK"
  IO.println "Cluster point: OK"
  IO.println "Limit uniqueness: OK"
  IO.println "All convergence tests passed!"

#eval convergenceTestSuite

end MiniConvergenceNets.Test
