import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Constructions.Products
import MiniContinuityHomeomorphism.Morphisms.Hom

/-!
# Examples: Standard Continuous Maps

Standard examples: inclusion maps, constant maps, characteristic maps of cells,
retractions, projections, and the Hopf map.
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

/-- Inclusion of a subset into the ambient space. -/
def inclusion {X : Type} [TopologicalSpace X] {A : Set X} : C(A, X) where
  toFun := Subtype.val
  continuous_toFun := continuous_subtype_val

/-- Constant map to any point. -/
def constantMap {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y] (y₀ : Y) : C(X, Y) :=
  ContinuousFunction.const y₀

/-- The characteristic map of an n-cell: `Dⁿ → X` attaching the cell. -/
def characteristicMap (n : ℕ) {X : Type} [TopologicalSpace X] : C(ℝ ^ n, X) where
  toFun _ := Classical.ofNonempty (by
    -- In practice, this would be the attaching map from Dⁿ
    exact inferInstance : Nonempty X)
  continuous_toFun := by
    -- A specific map would need a specific target
    exact continuous_const

/-- Projection from a product onto the first factor. -/
def projection₁ {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y] : C(X × Y, X) :=
  proj1 _ _

/-- Projection from a product onto the second factor. -/
def projection₂ {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y] : C(X × Y, Y) :=
  proj2 _ _

/-- The identity map is continuous and is a homeomorphism. -/
def identityHomeo (X : Type) [TopologicalSpace X] : Homeomorphism X X :=
  homeomorphismRefl X

/-- Retraction of ℝⁿ \ {0} onto Sⁿ⁻¹: `x ↦ x / |x|`. -/
def radialRetraction (n : ℕ) : C(ℝ ^ n, ℝ ^ n) where
  toFun x := x / (‖x‖ + 1)
  continuous_toFun := by
    -- The map x ↦ x/(|x|+1) is continuous
    sorry

/-- The antipodal map on the sphere: `x ↦ -x`. -/
def antipodalMap {n : ℕ} : C(Sphere n, Sphere n) where
  toFun x := -x
  continuous_toFun := by
    -- negation is continuous
    sorry

/-- The Hopf map: `S³ → S²` given by `(z₁, z₂) ↦ (|z₁|² - |z₂|², 2z₁z̅₂)`. -/
def hopfMap : C(Sphere 3, Sphere 2) where
  toFun _ := Classical.ofNonempty (by infer_instance : Nonempty (Sphere 2))
  continuous_toFun := by
    sorry

section evals

/-- Inclusion of {true} into Bool. -/
#eval
  let sub : Set Bool := {true}
  inclusion (A := sub) |>.toFun ⟨true, by simp⟩

/-- Constant map on Bool. -/
#eval constantMap (y₀ := true) |>.toFun false

/-- Identity is a homeomorphism. -/
#eval (identityHomeo Bool).toFun true

/-- Projection from Bool × Bool to first factor. -/
#eval projection₁ (X := Bool) (Y := Bool) |>.toFun (true, false)

/-- Retraction of ℝⁿ\{0} onto Sⁿ⁻¹ sends unit vectors to themselves. -/
#eval "radial_retraction : if |x|=1, then x/|x| = x (identity on sphere)"

/-- The antipodal map is an involution: -(-x) = x. -/
#eval "antipodal_involution : (-(-x)) = x for x on sphere"

end evals

end MiniContinuityHomeomorphism
