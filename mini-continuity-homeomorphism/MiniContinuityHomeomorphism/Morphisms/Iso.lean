import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Morphisms.Hom

/-!
# Isomorphisms: Homeomorphism Group and Isotopy

Defines the homeomorphism group `Homeo(X)`, the notion of isotopy (a homotopy
through homeomorphisms), and ambient isotopy.
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

/-- The group of self-homeomorphisms of `X`. Composition is homeomorphism
composition, identity is the identity homeomorphism. -/
def HomeoGroup (X : Type) [TopologicalSpace X] : Type := Homeomorphism X X

namespace HomeoGroup

/-- Group multiplication: composition of homeomorphisms. -/
def mul {X : Type} [TopologicalSpace X] (h₁ h₂ : Homeomorphism X X) : Homeomorphism X X :=
  homeomorphismTrans h₁ h₂

/-- Group identity: the identity homeomorphism. -/
def one {X : Type} [TopologicalSpace X] : Homeomorphism X X :=
  homeomorphismRefl X

/-- Group inverse: the inverse homeomorphism. -/
def inv {X : Type} [TopologicalSpace X] (h : Homeomorphism X X) : Homeomorphism X X :=
  homeomorphismSymm h

/-- The homeomorphism group forms a group (proof deferred). -/
theorem mul_assoc {X : Type} [TopologicalSpace X] (h₁ h₂ h₃ : Homeomorphism X X) :
    mul (mul h₁ h₂) h₃ = mul h₁ (mul h₂ h₃) := by
  sorry

/-- Identity laws for the homeomorphism group. -/
theorem one_mul {X : Type} [TopologicalSpace X] (h : Homeomorphism X X) :
    mul one h = h := by
  sorry

theorem mul_one {X : Type} [TopologicalSpace X] (h : Homeomorphism X X) :
    mul h one = h := by
  sorry

theorem mul_left_inv {X : Type} [TopologicalSpace X] (h : Homeomorphism X X) :
    mul (inv h) h = one := by
  sorry

end HomeoGroup

/-- An isotopy between two homeomorphisms `h₀, h₁ : X → Y` is a homotopy
`H : X × I → Y` such that each `H(-, t)` is a homeomorphism. -/
structure Isotopy {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (h₀ h₁ : Homeomorphism X Y) where
  toFun : X → ℝ → Y
  continuous_toFun : Continuous (Function.uncurry toFun)
  map_zero : ∀ x, toFun x 0 = h₀.toFun x
  map_one : ∀ x, toFun x 1 = h₁.toFun x
  isHomeo : ∀ t, t ∈ interval → ∃ (h : Homeomorphism X Y), ∀ x, h.toFun x = toFun x t
  is_on_interval : ∀ x t, t ∉ interval → toFun x t = h₀.toFun x

/-- Two homeomorphisms are isotopic if there exists an isotopy between them. -/
def Isotopic {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (h₀ h₁ : Homeomorphism X Y) : Prop := Nonempty (Isotopy h₀ h₁)

/-- An ambient isotopy of `X` is an isotopy `H : X × I → X` of the ambient
space that carries a subspace `A` to `B`. -/
structure AmbientIsotopy {X : Type} [TopologicalSpace X] (A B : Set X) where
  H : X → ℝ → X
  continuous_H : Continuous (Function.uncurry H)
  H_zero : ∀ x, H x 0 = x
  isHomeo : ∀ t, t ∈ interval → ∃ (h : Homeomorphism X X), ∀ x, h.toFun x = H x t
  carries : H '' (A ×ˢ {1}) = B
  is_on_interval : ∀ x t, t ∉ interval → H x t = x

section evals

/-- The identity is a homeomorphism. -/
#eval
  let h : Homeomorphism Bool Bool := homeomorphismRefl _
  h.toFun true

/-- The inverse of a homeomorphism composed with itself is the identity. -/
#eval
  let h : Homeomorphism Bool Bool := homeomorphismRefl _
  let hinv := homeomorphismSymm h
  hinv.toFun (h.toFun false)

/-- HomeoGroup structure on Bool (trivial, as Bool homeomorphism is just swap or id). -/
#eval
  let swap : Homeomorphism Bool Bool := {
    toFun := not
    continuous_toFun := by
      intro U hU; exact isOpen_discrete _
    invFun := not
    left_inv := by intro x; cases x <;> rfl
    right_inv := by intro x; cases x <;> rfl
    continuous_invFun := by
      intro U hU; exact isOpen_discrete _
  }
  HomeoGroup.mul swap swap |>.toFun true

end evals

end MiniContinuityHomeomorphism
