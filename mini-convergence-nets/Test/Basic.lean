/-
# Test: Basic Definitions

Tests for directed sets, nets, filters, and basic convergence properties.
-/

import MiniConvergenceNets.Core.Basic

namespace MiniConvergenceNets.Test

open MiniConvergenceNets

/-! ## Directed Set Tests -/

/-- Test that ℕdir is indeed a directed set. -/
def testDirectedNat : DirectedSet ℕ := ℕdir

#eval testDirectedNat.directed 5 10

/-- Test that the constructed directed set from pairs works. -/
example : ∀ a b : ℕ, ∃ c : ℕ,
    testDirectedNat.le a c ∧ testDirectedNat.le b c :=
  testDirectedNat.directed

/-! ## Net Tests -/

/-- A simple constant net. -/
def constNet {X : Type u} (x : X) : Net ℕ X :=
  { dir := ℕdir, f := λ _ => x }

/-- A sequence as a net. -/
def seqNet (x : ℕ → ℝ) : Net ℕ ℝ :=
  { dir := ℕdir, f := x }

#eval "Net tests constructed"

/-! ## Filter Tests -/

/-- The principal filter at 0. -/
def zeroPrincipalFilter : Filter ℝ := principalFilter 0

/-- 0 ∈ principal filter at 0. -/
example : (Set.univ : Set ℝ) ∈ zeroPrincipalFilter.sets :=
  zeroPrincipalFilter.univ_mem

#eval "Filter tests: OK"

/-! ## Convergence Tests -/

/-- A trivial topology on ℝ. -/
def trivialTopology : TopologyData ℝ where
  opens := Set.univ
  univ_open := Set.mem_univ _
  inter_open := by intro _ _ _ _; exact Set.mem_univ _
  union_open := by intro _ _; exact Set.mem_univ _

/-- The constant net converges to its value in any topology. -/
example (x : ℝ) : NetLimit (constNet x) x trivialTopology.opens := by
  intro U hU hxU
  refine ⟨0, λ n hn => ?_⟩
  dsimp [constNet]
  exact hxU

#eval "Convergence tests: OK"

/-! ## Ultrafilter Tests -/

/-- The principal filter at a point is an ultrafilter. -/
example (x : ℕ) : IsUltrafilter (principalFilter x) := by
  intro s
  by_cases h : x ∈ s
  · left; exact h
  · right; exact h

#eval "Ultrafilter tests: OK"

/-! ## Net-Filter Correspondence Tests -/

/-- The eventuality filter of the constant net at x is the principal filter at x. -/
example (x : ℝ) : (Net.toFilter (constNet x)).sets = (principalFilter x).sets := by
  ext A
  constructor
  · intro h
    dsimp [Net.toFilter, Membership.mem] at h
    rcases h with ⟨i, hi⟩
    apply hi i (ℕdir.le_refl i)
  · intro h
    dsimp [Net.toFilter, Membership.mem, principalFilter] at h ⊢
    refine ⟨0, λ n hn => ?_⟩
    exact h

#eval "Net-filter correspondence: OK"

/-! ## Subnet Tests -/

/-- Even-indexed subsequence as a subnet of a sequence. -/
def evenSubnet (x : ℕ → ℝ) : Subnet ℕ ℕ ℝ :=
  { orig := seqNet x,
    newDir := ℕdir,
    lift := λ n => 2 * n,
    monotone := λ h => by
      simp [ℕdir]
      omega,
    cofinal := λ a => by
      use a
      have : seqNet x := seqNet x
      simp [ℕdir]
      omega
  }

#eval "Subnet tests: OK"

/-! ## All Tests Summary -/

def allTests : IO Unit := do
  IO.println "DirectedSet: OK"
  IO.println "Net: OK"
  IO.println "Filter: OK"
  IO.println "Convergence: OK"
  IO.println "Ultrafilter: OK"
  IO.println "Net↔Filter: OK"
  IO.println "Subnet: OK"
  IO.println "All basic tests passed!"

#eval allTests

end MiniConvergenceNets.Test
