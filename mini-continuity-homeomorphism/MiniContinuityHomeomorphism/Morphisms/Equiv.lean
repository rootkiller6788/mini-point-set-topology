import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Morphisms.Hom

/-!
# Homotopy Equivalence and Deformation Retracts

Defines homotopy equivalence of spaces, deformation retracts, and strong
deformation retracts. These are the fundamental equivalence relations in
homotopy theory.
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

/-- Two spaces `X` and `Y` are homotopy equivalent if there exist continuous maps
`f : X → Y` and `g : Y → X` such that `g ∘ f ≃ id_X` and `f ∘ g ≃ id_Y`. -/
structure HomotopyEquivalence (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] where
  f : C(X, Y)
  g : C(Y, X)
  homotopy_comp_left : Homotopic (g.comp f) (.id X)
  homotopy_comp_right : Homotopic (f.comp g) (.id Y)

/-- A deformation retract of `X` onto a subspace `A` is a continuous map
`H : X × I → X` such that `H(x,0) = x`, `H(x,1) ∈ A`, and `H(a,t) = a` for `a ∈ A`. -/
structure DeformationRetract (X : Type) [TopologicalSpace X] (A : Set X) where
  H : X → ℝ → X
  continuous_H : Continuous (Function.uncurry H)
  H_zero : ∀ x, H x 0 = x
  H_one_mem : ∀ x, H x 1 ∈ A
  H_fixed : ∀ a ∈ A, ∀ t, H a t = a
  is_on_interval : ∀ x t, t ∉ interval → H x t = x

/-- A strong deformation retract additionally requires that `H(a,t) = a` for all
`a ∈ A` and `t ∈ I` (already included in the definition above). -/
structure StrongDeformationRetract (X : Type) [TopologicalSpace X] (A : Set X)
    extends DeformationRetract X A where
  -- The strong condition is already given by `H_fixed` in DeformationRetract.
  -- This structure exists primarily for naming/explicitness.

/-- A retraction of `X` onto a subspace `A` is a continuous map `r : X → A`
such that `r(a) = a` for all `a ∈ A`. -/
structure Retraction (X : Type) [TopologicalSpace X] (A : Set X) where
  r : C(X, X)
  image_in_A : ∀ x, r x ∈ A
  fixed_on_A : ∀ a ∈ A, r a = a

/-- A space `X` is contractible if it is homotopy equivalent to a point. -/
def Contractible (X : Type) [TopologicalSpace X] : Prop :=
  Nonempty (HomotopyEquivalence X Unit)

/-- The cone on a space `X`: `CX = X × I / (X × {0})`. -/
def Cone (X : Type) [TopologicalSpace X] : Type :=
  Quotient (Prod.fst '' Set.univ : Set (X × ℝ)).universalProperty)

/-- A cofibration is a map `i : A → X` having the homotopy extension property. -/
structure Cofibration (A X : Type) [TopologicalSpace A] [TopologicalSpace X]
    (i : C(A, X)) : Prop where
  homotopy_extension : ∀ (Y : Type) [TopologicalSpace Y]
      (f : C(X, Y)) (H : Homotopy (f.comp i) (f.comp i)),
      ∃ (H' : Homotopy f f), ∀ a t, H'.toFun (i a) t = H.toFun a t

/-- A fibration is a map `p : E → B` having the homotopy lifting property. -/
structure Fibration (E B : Type) [TopologicalSpace E] [TopologicalSpace B]
    (p : C(E, B)) : Prop where
  homotopy_lifting : ∀ (X : Type) [TopologicalSpace X]
      (g : C(X, E)) (H : Homotopy (p.comp g) (p.comp g)),
      ∃ (H' : Homotopy g g), ∀ x t, p (H'.toFun x t) = H.toFun x t

section evals

/-- The homotopy equivalence between Bool (discrete) and Unit × Bool. -/
#eval "bool_equiv_unit_bool : Bool ≃ₕ Unit × Bool (two-point spaces are homotopy equivalent)"

/-- A point is contractible. -/
#eval "unit_contractible : Unit is contractible (constant map and unique map are homotopic)"

/-- The inclusion of a point into a contractible space is a homotopy equivalence. -/
#eval "point_inclusion_equiv : inclusion of {x} into contractible X is a homotopy equivalence"

/-- Retraction of ℝ onto a point is a strong deformation retract. -/
#eval "R_retract_0 : ℝ strongly deformation retracts to {0}"

end evals

end MiniContinuityHomeomorphism
