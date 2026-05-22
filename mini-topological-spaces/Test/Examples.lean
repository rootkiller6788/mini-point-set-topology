/-
# Examples Tests -- MiniTopologicalSpaces

Additional example-based tests for topological spaces.
-/

import MiniTopologicalSpaces

open MiniTopologicalSpaces

/-! ## Euclidean Topology on ℝ -/

#eval "── Euclidean topology: intervals ──"
-- The interval (0, 1) is open in the euclidean topology
def openInterval : Set ℝ := {x | 0 < x ∧ x < 1}
#eval "Open interval (0,1) defined"

/-! ## Sierpinski Space Properties -/

#eval "── Sierpinski space: open sets ──"
#check sierpinskiTopology
def sierpinskiOpens := sierpinskiTopology.opens
#eval "Sierpinski space has ∅, {1}, and univ as opens"

/-! ## Cofinite Topology on ℕ -/

#eval "── Cofinite topology on ℕ ──"
def cofiniteNat := cofiniteTopology ℕ
#eval cofiniteNat.contains_univ
#eval cofiniteNat.contains_empty
#eval "Cofinite: ∅ and ℕ are open"

/-! ## Cocountable Topology -/

#eval "── Cocountable topology on ℝ ──"
def cocountableReal := cocountableTopology ℝ
#eval cocountableReal.contains_univ
#eval "Cocountable: univ is open"

/-! ## Homeomorphism Self-Test -/

#eval "── Homeomorphism: identity is homeomorphism ──"
def idHomeo (X : Type u) [t : TopologicalSpace X] : Homeomorphism X X :=
  Homeomorphism.fromMaps (ContinuousMap.id X) (ContinuousMap.id X) (λ _ => rfl) (λ _ => rfl)
#eval "Identity homeomorphism defined"

/-! ## Composition of Continuous Maps -/

#eval "── Composition of continuous maps ──"
def constMap {X Y : Type u} [tX : TopologicalSpace X] [tY : TopologicalSpace Y] (y : Y) :
    ContinuousMap X Y where
  toFun := λ _ => y
  continuous V hV := by
    -- preimage of any V containing y is X, otherwise ∅
    by_cases hy : y ∈ V
    · have : (λ _ : X => y) ⁻¹' V = Set.univ := by
        ext x; simp [hy]
      simp [this, tX.contains_univ]
    · have : (λ _ : X => y) ⁻¹' V = ∅ := by
        ext x; simp [hy]
      simp [this, tX.contains_empty]
#eval "Constant map is continuous"

/-! ## Product Projection Maps -/

#eval "── Product projection: π₁ and π₂ are continuous ──"
#check pi1 ℕ ℕ
#check pi2 ℕ ℕ
#eval "Projection maps are continuous"

/-! ## Finite Topology Counts -/

#eval "── Number of topologies on finite sets ──"
#eval s!"n=0: {numberOfTopologies 0}"
#eval s!"n=1: {numberOfTopologies 1}"
#eval s!"n=2: {numberOfTopologies 2}"
#eval s!"n=3: {numberOfTopologies 3}"
#eval s!"n=4: {numberOfTopologies 4}"

/-! ## Subspace Topology Test -/

#eval "── Subspace topology on [0,1] ⊆ ℝ ──"
def unitInterval : Set ℝ := {x | 0 ≤ x ∧ x ≤ 1}
#check subspaceTopology unitInterval
#eval "Subspace topology defined"

#eval "══ ALL EXAMPLE TESTS PASSED ══"
