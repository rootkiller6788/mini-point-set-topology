import MiniContinuityHomeomorphism.Core.Basic

/-!
# Constructions: Products of Continuous Maps

Product of continuous maps, the diagonal map, and the evaluation map. These are
essential building blocks in point-set topology and homotopy theory.
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

/-- The product of two continuous maps `f : X → Y` and `f' : X' → Y'` is the
continuous map `f × f' : X × X' → Y × Y'`. -/
def productMap {X Y X' Y' : Type} [TopologicalSpace X] [TopologicalSpace Y]
    [TopologicalSpace X'] [TopologicalSpace Y']
    (f : C(X, Y)) (f' : C(X', Y')) : C(X × X', Y × Y') where
  toFun p := (f p.1, f' p.2)
  continuous_toFun :=
    Continuous.prod_mk (f.continuous_toFun.comp continuous_fst)
      (f'.continuous_toFun.comp continuous_snd)

/-- The diagonal map `Δ : X → X × X`, `x ↦ (x, x)`. -/
def diagonalMap (X : Type) [TopologicalSpace X] : C(X, X × X) where
  toFun x := (x, x)
  continuous_toFun := continuous_diagonal

/-- The evaluation map `ev : C(X, Y) × X → Y`, `(f, x) ↦ f(x)`. (Requires
compact-open topology on C(X,Y) for continuity in general; we state it as a
function.) -/
def evaluationMap {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    : (C(X, Y) × X) → Y :=
  fun ⟨f, x⟩ => f x

/-- The product of two homeomorphisms is a homeomorphism. -/
def homeomorphismProduct {X Y X' Y' : Type} [TopologicalSpace X] [TopologicalSpace Y]
    [TopologicalSpace X'] [TopologicalSpace Y']
    (h : Homeomorphism X Y) (h' : Homeomorphism X' Y') :
    Homeomorphism (X × X') (Y × Y') where
  toFun p := (h.toFun p.1, h'.toFun p.2)
  continuous_toFun :=
    Continuous.prod_mk (h.continuous_toFun.comp continuous_fst)
      (h'.continuous_toFun.comp continuous_snd)
  invFun p := (h.invFun p.1, h'.invFun p.2)
  left_inv p := by
    simp [h.left_inv, h'.left_inv]
  right_inv p := by
    simp [h.right_inv, h'.right_inv]
  continuous_invFun :=
    Continuous.prod_mk (h.continuous_invFun.comp continuous_fst)
      (h'.continuous_invFun.comp continuous_snd)

/-- The swap map `X × Y → Y × X`. -/
def swapMap (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] :
    C(X × Y, Y × X) where
  toFun p := (p.2, p.1)
  continuous_toFun := Continuous.prod_mk continuous_snd continuous_fst

/-- The projection maps are continuous. -/
def proj1 (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] : C(X × Y, X) where
  toFun := Prod.fst
  continuous_toFun := continuous_fst

def proj2 (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] : C(X × Y, Y) where
  toFun := Prod.snd
  continuous_toFun := continuous_snd

section evals

/-- The diagonal map on Bool. -/
#eval diagonalMap Bool |>.toFun true

/-- Product of identity maps. -/
#eval
  let f : C(Bool, Bool) := .id _
  productMap f f |>.toFun (true, false)

/-- Swap map on Bool. -/
#eval swapMap Bool Bool |>.toFun (true, false)

/-- Evaluation map at a point. -/
#eval
  let f : C(Bool, Bool) := .const true
  evaluationMap (f, false)

end evals

end MiniContinuityHomeomorphism
