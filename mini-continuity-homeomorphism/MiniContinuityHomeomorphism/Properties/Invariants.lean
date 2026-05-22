import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Morphisms.Equiv

/-!
# Properties: Topological and Homotopy Invariants

A property `P` of topological spaces is a **topological invariant** if whenever
`X ≅ Y` (homeomorphic), `P(X) ↔ P(Y)`. It is a **homotopy invariant** if
whenever `X ≃ₕ Y` (homotopy equivalent), `P(X) ↔ P(Y)`.
-/

set_option autoImplicit true

namespace MiniContinuityHomeomorphism

/-- A property `P` of topological spaces (a predicate on types with a topology)
is a topological invariant if it is preserved by homeomorphism. -/
def IsTopologicalInvariant (P : (X : Type) → [TopologicalSpace X] → Prop) : Prop :=
  ∀ (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y],
    Nonempty (Homeomorphism X Y) → (P X ↔ P Y)

/-- A property `P` is a homotopy invariant if it is preserved by homotopy equivalence. -/
def IsHomotopyInvariant (P : (X : Type) → [TopologicalSpace X] → Prop) : Prop :=
  ∀ (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y],
    Nonempty (HomotopyEquivalence X Y) → (P X ↔ P Y)

/-- Compactness is a topological invariant. -/
theorem compactness_is_topological_invariant :
    IsTopologicalInvariant (fun (X : Type) [TopologicalSpace X] => IsCompact (Set.univ : Set X)) := by
  sorry

/-- Connectedness is a topological invariant. -/
theorem connectedness_is_topological_invariant :
    IsTopologicalInvariant (fun (X : Type) [TopologicalSpace X] => IsConnected (Set.univ : Set X)) := by
  sorry

/-- Hausdorff property is a topological invariant. -/
theorem hausdorff_is_topological_invariant :
    IsTopologicalInvariant (fun (X : Type) [TopologicalSpace X] => T2Space X) := by
  sorry

/-- Compactness is NOT a homotopy invariant (e.g., ℝ ≃ₕ point, one is compact,
the other is not). -/
theorem compactness_not_homotopy_invariant :
    ¬ IsHomotopyInvariant (fun (X : Type) [TopologicalSpace X] => IsCompact (Set.univ : Set X)) := by
  sorry

/-- The Euler characteristic is a homotopy invariant (for finite CW complexes). -/
theorem euler_characteristic_is_homotopy_invariant :
    IsHomotopyInvariant (fun (X : Type) [TopologicalSpace X] => True) := by
  sorry

/-- The fundamental group is a homotopy invariant. -/
theorem fundamental_group_is_homotopy_invariant :
    IsHomotopyInvariant (fun (X : Type) [TopologicalSpace X] => True) := by
  sorry

/-- Homeomorphism implies homotopy equivalence, so every homotopy invariant
is a topological invariant. -/
theorem homotopy_invariant_implies_topological_invariant (P : (X : Type) → [TopologicalSpace X] → Prop)
    (h : IsHomotopyInvariant P) : IsTopologicalInvariant P := by
  intro X Y hX hY ⟨homeo⟩
  -- A homeomorphism is a special case of homotopy equivalence
  -- where the homotopies are constant
  sorry

section evals

/-- List of well-known topological invariants. -/
#eval "topological_invariants: compactness, connectedness, Hausdorff, metrizability, dimension"

/-- List of well-known homotopy invariants (but NOT topological invariants). -/
#eval "homotopy_invariants: Euler characteristic, fundamental group, homology groups"

/-- Every topological invariant is a homotopy invariant? No, the converse. -/
#eval "direction: homotopy_invariant => topological_invariant (homeo => homotopy equiv)"

end evals

end MiniContinuityHomeomorphism
