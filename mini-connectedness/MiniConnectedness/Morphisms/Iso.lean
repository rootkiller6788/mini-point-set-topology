/-
# MiniConnectedness: Isomorphisms

Component-preserving homeomorphisms, cut points, and endpoints
— structural features preserved under connectedness-aware isomorphism.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Morphisms.Hom

namespace MiniConnectedness

/-! ## Component-Preserving Homeomorphism -/

/-- A homeomorphism that preserves connected components. -/
structure ComponentPreservingHomeo (α β : Type u) [TopSpace α] [TopSpace β] extends Homeomorphism α β where
  preserves_components : ∀ (x : α), toFun '' Component x = Component (toFun x)

/-- Identity is component-preserving. -/
def componentPreservingId (α : Type u) [TopSpace α] : ComponentPreservingHomeo α α where
  toFun := id
  invFun := id
  leftInv _ := rfl
  rightInv _ := rfl
  continuous_toFun := sorry
  continuous_invFun := sorry
  preserves_components := by
    intro x; simp [Component]

#eval "ComponentPreservingHomeo: homeomorphism preserving components"

/-! ## Cut Points -/

/-- x is a cut point of α if α \{x} is disconnected. -/
def IsCutPoint {α : Type u} [TopSpace α] (x : α) : Prop :=
  ¬ IsConnected (Subtype fun (y : α) => y ≠ x)

/-- A point that is not a cut point. -/
def IsNonCutPoint {α : Type u} [TopSpace α] (x : α) : Prop :=
  IsConnected (Subtype fun (y : α) => y ≠ x)

#eval "Cut point: removing the point disconnects the space"

/-! ## Endpoints -/

/-- An endpoint of a continuum is a point with an arbitrarily small connected neighborhood. -/
def IsEndpoint {α : Type u} [TopSpace α] [Continuum α] (x : α) : Prop :=
  sorry

/-- Every non-degenerate continuum has at least two non-cut points. -/
theorem nonCutPointTheorem {α : Type u} [TopSpace α] [Continuum α] (h : ∃ a b : α, a ≠ b) :
  ∃ x y : α, x ≠ y ∧ IsNonCutPoint x ∧ IsNonCutPoint y := by
  sorry

#eval "Non-cut point theorem: every nondegenerate continuum has ≥2 non-cut points"

end MiniConnectedness
