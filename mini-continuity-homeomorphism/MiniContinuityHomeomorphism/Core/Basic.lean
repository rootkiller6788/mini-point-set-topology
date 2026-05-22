import MiniObjectKernel.Object
import MiniTopologicalSpaces.Basic

/-!
# Continuous Functions and Basic Morphisms

Defines the fundamental types of continuous maps between topological spaces:
`ContinuousFunction`, `Homeomorphism`, `Embedding`, `QuotientMap`, `OpenMap`,
`ClosedMap`, and `Proper` maps. Also defines pointwise and sequential continuity,
and uniform continuity for uniform spaces.

## Overview
- `ContinuousFunction X Y`: the type of continuous functions from `X` to `Y`
- `continuityAtPoint f x`: `f` is continuous at the point `x`
- `sequentialContinuity f x`: `f` is sequentially continuous at `x`
- `UniformContinuity f`: `f` is uniformly continuous (for uniform spaces)
- `Homeomorphism X Y`: a continuous bijection with continuous inverse
- `Embedding X Y`: a homeomorphism onto its image
- `QuotientMap X Y`: a surjective map where `U` open iff `f⁻¹(U)` open
- `OpenMap f` / `ClosedMap f`: maps that send open/closed sets to open/closed sets
- `Proper f`: preimages of compact sets are compact
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

/-- A continuous function between topological spaces. `f` is continuous means
that the preimage of every open set is open. -/
structure ContinuousFunction (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] where
  toFun : X → Y
  continuous_toFun : Continuous toFun

instance (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] :
    FunLike (ContinuousFunction X Y) X Y where
  coe f := f.toFun
  coe_injective' f g h := by
    cases f; cases g; congr

namespace ContinuousFunction

/-- Apply a continuous function to a point. -/
@[simp]
def apply (f : ContinuousFunction X Y) (x : X) : Y := f.toFun x

/-- The identity continuous function. -/
def id (X : Type) [TopologicalSpace X] : ContinuousFunction X X where
  toFun x := x
  continuous_toFun := continuous_id

/-- Composition of continuous functions. -/
def comp (g : ContinuousFunction Y Z) (f : ContinuousFunction X Y) : ContinuousFunction X Z where
  toFun x := g (f x)
  continuous_toFun := Continuous.comp g.continuous_toFun f.continuous_toFun

/-- Constant continuous function. -/
def const (y : Y) : ContinuousFunction X Y where
  toFun _ := y
  continuous_toFun := continuous_const

end ContinuousFunction

/-- A function `f` is continuous at a point `x` if for every neighborhood `V` of
`f x`, `f⁻¹(V)` is a neighborhood of `x`. -/
def continuityAtPoint {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) (x : X) : Prop :=
  Filter.Tendsto f (𝓝 x) (𝓝 (f x))

/-- A function `f` is sequentially continuous at `x` if for every sequence
`xₙ → x`, we have `f(xₙ) → f(x)`. -/
def sequentialContinuity {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) (x : X) : Prop :=
  ∀ (u : ℕ → X), Filter.Tendsto u Filter.atTop (𝓝 x) →
    Filter.Tendsto (f ∘ u) Filter.atTop (𝓝 (f x))

/-- Uniform continuity for functions between uniform spaces. -/
structure UniformContinuity {X Y : Type} [UniformSpace X] [UniformSpace Y] (f : X → Y) : Prop where
  uniform_continuous : UniformContinuous f

/-- A homeomorphism is a continuous bijection with continuous inverse. -/
structure Homeomorphism (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] extends
    ContinuousFunction X Y where
  invFun : Y → X
  left_inv : Function.LeftInverse invFun toFun
  right_inv : Function.RightInverse invFun toFun
  continuous_invFun : Continuous invFun

/-- An embedding is a homeomorphism onto its image. Equivalently, an injective
continuous map that is open onto its image. -/
structure Embedding (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] extends
    ContinuousFunction X Y where
  injective : Function.Injective toFun
  induced : ‹TopologicalSpace X› = TopologicalSpace.induced toFun ‹TopologicalSpace Y›

/-- A quotient map (identification map) is a surjective map `f : X → Y` such that
`U ⊆ Y` is open iff `f⁻¹(U)` is open in `X`. -/
structure QuotientMap (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) : Prop where
  surjective : Function.Surjective f
  quotient_condition : ∀ (U : Set Y), IsOpen U ↔ IsOpen (f ⁻¹' U)

/-- A map is open if it sends open sets to open sets. -/
def OpenMap {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : Prop :=
  ∀ (U : Set X), IsOpen U → IsOpen (f '' U)

/-- A map is closed if it sends closed sets to closed sets. -/
def ClosedMap {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : Prop :=
  ∀ (F : Set X), IsClosed F → IsClosed (f '' F)

/-- A proper map: preimages of compact sets are compact. -/
def Proper {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : Prop :=
  ∀ (K : Set Y), IsCompact K → IsCompact (f ⁻¹' K)

section evals

/-- The identity function is continuous. -/
#eval show ContinuousFunction Bool Bool from .id _

/-- A constant function is continuous. -/
#eval show ContinuousFunction Bool Bool from .const true

/-- In a discrete space, every function is continuous. -/
#eval
  let X : Type := Bool
  let _ : TopologicalSpace X := ⊥
  show ContinuousFunction X X from
    { toFun := id
      continuous_toFun := by
        intro U hU
        exact hU }

end evals

end MiniContinuityHomeomorphism
