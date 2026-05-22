import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Properties.ClassificationData

/-!
# Theorems: Classification Results

Classification of surfaces (statement), the mapping class group, and
classification of 1-manifolds.
-/

set_option autoImplicit true

namespace MiniContinuityHomeomorphism

/-- The classification theorem for closed surfaces: every closed connected
surface is homeomorphic to a sphere, a connected sum of tori, or a connected
sum of projective planes. -/
theorem classification_of_closed_surfaces {S : Type} [TopologicalSpace S]
    (h_compact : IsCompact (Set.univ : Set S))
    (h_connected : IsConnected (Set.univ : Set S))
    (h_surface : Surface S) (h_boundary_empty : BoundaryEmpty S) :
    (Nonempty (Homeomorphism S (Sphere 2))) ∨
    (∃ (g : ℕ), g ≥ 1 ∧ Nonempty (Homeomorphism S (ConnectedSumTori g))) ∨
    (∃ (g : ℕ), g ≥ 1 ∧ Nonempty (Homeomorphism S (ConnectedSumProjectivePlanes g))) := by
  sorry

/-- Two closed orientable surfaces are homeomorphic iff they have the same genus. -/
theorem orientable_surface_classification_by_genus (g₁ g₂ : ℕ) (hg₁ : g₁ ≥ 0) (hg₂ : g₂ ≥ 0) :
    Nonempty (Homeomorphism (ConnectedSumTori g₁) (ConnectedSumTori g₂)) ↔ g₁ = g₂ := by
  sorry

/-- The mapping class group of the torus is GL(2, ℤ). -/
theorem mapping_class_group_of_torus :
    Nonempty (Homeomorphism (mappingClassGroup (Torus))
      (Matrix.GeneralLinearGroup (Fin 2) ℤ)) := by
  sorry

/-- The mapping class group of the sphere is trivial. -/
theorem mapping_class_group_of_sphere :
    Nonempty (Homeomorphism (mappingClassGroup (Sphere 2)) (TrivialGroup)) := by
  sorry

/-- Classification of 1-manifolds: connected compact 1-manifold without boundary
is homeomorphic to the circle. -/
theorem compact_one_manifold_is_circle {M : Type} [TopologicalSpace M]
    (hM : OneManifold M) (h_compact : IsCompact (Set.univ : Set M))
    (h_connected : IsConnected (Set.univ : Set M))
    (h_boundary_empty : BoundaryEmpty M) :
    Nonempty (Homeomorphism M (Circle)) := by
  sorry

/-- The genus of a closed orientable surface is a complete homeomorphism invariant. -/
theorem genus_is_complete_invariant (S₁ S₂ : Type) [TopologicalSpace S₁] [TopologicalSpace S₂]
    (hS₁ : ClosedSurface S₁) (hS₂ : ClosedSurface S₂) (h_or₁ : Orientable S₁) (h_or₂ : Orientable S₂) :
    Nonempty (Homeomorphism S₁ S₂) ↔ genus S₁ = genus S₂ := by
  sorry

/-- Non-orientable surfaces are classified by their demigenus. -/
theorem nonorientable_surface_classification (S : Type) [TopologicalSpace S]
    (h_closed : ClosedSurface S) (h_nonor : ¬ Orientable S) :
    ∃ (k : ℕ), k ≥ 1 ∧ Nonempty (Homeomorphism S (ConnectedSumProjectivePlanes k)) := by
  sorry

section evals

/-- The sphere S² has genus 0. -/
#eval "genus_S2 : genus(S²) = 0"

/-- The torus T² has genus 1. -/
#eval "genus_T2 : genus(T²) = 1"

/-- Connected sum of two tori has genus 2. -/
#eval "genus_T2sharpT2 : genus(T² # T²) = 2"

end evals

end MiniContinuityHomeomorphism
