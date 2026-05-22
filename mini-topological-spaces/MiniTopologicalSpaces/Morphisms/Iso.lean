/-
# MiniTopologicalSpaces: Homeomorphisms

Defines Homeomorphism (topological equivalence) — a continuous
bijection with a continuous inverse.
-/

import MiniTopologicalSpaces.Core.Basic
import MiniTopologicalSpaces.Morphisms.Hom

namespace MiniTopologicalSpaces

/-! ## Homeomorphism

A homeomorphism is a continuous bijection whose inverse
is also continuous. Two spaces are homeomorphic iff there
exists a homeomorphism between them.
-/

structure Homeomorphism (X Y : Type u) [tX : TopologicalSpace X] [tY : TopologicalSpace Y] where
  toFun : X → Y
  invFun : Y → X
  continuous_toFun : ∀ (V : Set Y), V ∈ tY.opens → toFun ⁻¹' V ∈ tX.opens
  continuous_invFun : ∀ (U : Set X), U ∈ tX.opens → invFun ⁻¹' U ∈ tY.opens
  leftInv : ∀ x, invFun (toFun x) = x
  rightInv : ∀ y, toFun (invFun y) = y

/-! ## Topological Equivalence -/

def Homeomorphic (X Y : Type u) [tX : TopologicalSpace X] [tY : TopologicalSpace Y] : Prop :=
  Nonempty (Homeomorphism X Y)

/-! ## Homeomorphism from ContinuousMap -/

def Homeomorphism.fromMaps {X Y : Type u} [tX : TopologicalSpace X] [tY : TopologicalSpace Y]
    (f : ContinuousMap X Y) (g : ContinuousMap Y X)
    (left_inv : ∀ x, g.toFun (f.toFun x) = x)
    (right_inv : ∀ y, f.toFun (g.toFun y) = y) : Homeomorphism X Y where
  toFun := f.toFun
  invFun := g.toFun
  continuous_toFun := f.continuous
  continuous_invFun := g.continuous
  leftInv := left_inv
  rightInv := right_inv

/-! ## Homeomorphism Properties -/

theorem Homeomorphism.bijective {X Y : Type u} [tX : TopologicalSpace X] [tY : TopologicalSpace Y]
    (h : Homeomorphism X Y) : Function.Bijective h.toFun := by
  constructor
  · intro a b h_eq
    calc
      a = h.invFun (h.toFun a) := (h.leftInv a).symm
      _ = h.invFun (h.toFun b) := by rw [h_eq]
      _ = b := h.leftInv b
  · intro y
    exact ⟨h.invFun y, h.rightInv y⟩

#eval "── Morphisms/Iso: Homeomorphism ──"
#check Homeomorphism
#check Homeomorphic
#eval "Homeomorphism: continuous bijection with continuous inverse"

end MiniTopologicalSpaces
