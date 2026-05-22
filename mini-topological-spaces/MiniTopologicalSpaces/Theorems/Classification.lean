/-
# MiniTopologicalSpaces: Classification Theorems

Classification of 1-manifolds: every connected 1-dimensional
topological manifold is homeomorphic to either the circle S¹
or the real line ℝ.
-/

import MiniTopologicalSpaces.Core.Basic
import MiniTopologicalSpaces.Morphisms.Iso

namespace MiniTopologicalSpaces

/-! ## 1-Manifold

A 1-manifold is a second-countable Hausdorff space where every
point has a neighborhood homeomorphic to ℝ.
-/

def OneManifold (X : Type u) [t : TopologicalSpace X] : Prop :=
  Hausdorff X ∧ SecondCountable X ∧
    ∀ x : X, ∃ (U : Set X), U ∈ t.opens ∧ x ∈ U ∧
      Homeomorphic U (Set.univ : Set ℝ)

/-! ## Classification Theorem for 1-Manifolds

Every connected 1-manifold is homeomorphic to either S¹ or ℝ.
S¹ is the unit circle in ℝ² with the subspace topology.
-/

def S1 : Set (ℝ × ℝ) := {p | p.1 * p.1 + p.2 * p.2 = 1}

theorem classification_one_manifolds (X : Type u) [t : TopologicalSpace X]
    (h_manifold : OneManifold X) (h_connected : Connected X) :
    Homeomorphic X (Subtype S1) ∨ Homeomorphic X ℝ := by
  sorry

/-! ## Classification of Compact 1-Manifolds

Every compact connected 1-manifold is homeomorphic to S¹.
-/

theorem classification_compact_one_manifolds (X : Type u) [t : TopologicalSpace X]
    (h_manifold : OneManifold X) (h_compact : Compact X) (h_connected : Connected X) :
    Homeomorphic X (Subtype S1) := by
  sorry

#eval "── Theorems/Classification: 1-manifolds ──"
#check OneManifold
#check S1
#check classification_one_manifolds
#eval "1-manifold classification: S¹ or ℝ"

end MiniTopologicalSpaces
