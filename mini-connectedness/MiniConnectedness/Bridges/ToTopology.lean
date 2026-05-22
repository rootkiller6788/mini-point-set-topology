/-
# MiniConnectedness: Bridge to Topology

Connections to general topology: continua theory, dendrites,
and the relationship between connectedness and compactness.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Properties.ClassificationData
import MiniConnectedness.Theorems.Main

namespace MiniConnectedness

/-! ## Continua Theory -/

/-- A continuum is decomposable if it can be written as the union of two proper subcontinua. -/
def IsDecomposable {α : Type u} [TopSpace α] [Continuum α] : Prop :=
  ∃ (A B : Set α), IsConnectedSubspace A ∧ IsConnectedSubspace B ∧
    sorry → A ∪ B = Set.univ ∧ A ≠ Set.univ ∧ B ≠ Set.univ

/-- The pseudo-arc is the unique hereditarily indecomposable continuum. -/
theorem pseudoArc_hereditarilyIndecomposable :
  ∃ (α : Type u) [TopSpace α] [Continuum α], IsHereditarilyIndecomposable α := by
  sorry

#eval "Continua theory: decomposable vs indecomposable"

/-! ## Dendrites -/

/-- A dendrite is a Peano continuum with no simple closed curves. -/
theorem dendrite_characterization {α : Type u} [TopSpace α] [PeanoContinuum α] :
  (NoSimpleClosedCurve α) ↔ (IsDendrite α) := by
  sorry

/-- Every dendrite is an absolute retract for metric spaces. -/
theorem dendrite_absoluteRetract_metric {α : Type u} [TopSpace α] [Dendrite α] :
  sorry := by
  sorry

#eval "Dendrites: Peano continua with no simple closed curves"

/-! ## Compactness and Connectedness -/

/-- The intersection of a nested sequence of continua is a continuum. -/
theorem nestedIntersection_continuum {α : Type u} [TopSpace α]
  (C : ℕ → Set α) (h_cont : ∀ n, IsConnectedSubspace (C n) ∧ sorry)
  (h_nest : ∀ n, C (n+1) ⊆ C n) : IsConnectedSubspace (⋂ n, C n) := by
  sorry

#eval "Nested intersection of continua is a continuum"

end MiniConnectedness
