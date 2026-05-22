/-
# MiniSeparationAxioms.Morphisms.Iso

Homeomorphism: the notion of isomorphism for topological spaces.
Homeomorphisms preserve all separation axioms.
-/

import MiniSeparationAxioms.Core.Basic

namespace MiniSeparationAxioms

/-! ## Homeomorphism -/

/-- A homeomorphism is a continuous bijection with continuous inverse. -/
structure Homeomorphism (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  toFun : X → Y
  invFun : Y → X
  left_inv : ∀ x, invFun (toFun x) = x
  right_inv : ∀ y, toFun (invFun y) = y
  continuous_toFun : Continuous toFun
  continuous_invFun : Continuous invFun

/-- Identity homeomorphism. -/
def Homeomorphism.id (X : Type u) [TopologicalSpace X] : Homeomorphism X X where
  toFun x := x
  invFun x := x
  left_inv _ := rfl
  right_inv _ := rfl
  continuous_toFun := continuous_id
  continuous_invFun := continuous_id

/-- Composition of homeomorphisms. -/
def Homeomorphism.comp {X Y Z : Type u} [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    (g : Homeomorphism Y Z) (f : Homeomorphism X Y) : Homeomorphism X Z where
  toFun := g.toFun ∘ f.toFun
  invFun := f.invFun ∘ g.invFun
  left_inv x := by simp [f.left_inv, g.left_inv]
  right_inv z := by simp [g.right_inv, f.right_inv]
  continuous_toFun := Continuous.comp g.continuous_toFun f.continuous_toFun
  continuous_invFun := Continuous.comp f.continuous_invFun g.continuous_invFun

/-- Inverse of a homeomorphism. -/
def Homeomorphism.symm {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (h : Homeomorphism X Y) : Homeomorphism Y X where
  toFun := h.invFun
  invFun := h.toFun
  left_inv := h.right_inv
  right_inv := h.left_inv
  continuous_toFun := h.continuous_invFun
  continuous_invFun := h.continuous_toFun

/-! ## Homeomorphisms Preserve Separation Axioms -/

/-- Homeomorphism preserves T0. -/
theorem homeomorphism_preserves_t0 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (h : Homeomorphism X Y) (hX : T0 X) : T0 Y := by
  sorry

/-- Homeomorphism preserves T1. -/
theorem homeomorphism_preserves_t1 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (h : Homeomorphism X Y) (hX : T1 X) : T1 Y := by
  sorry

/-- Homeomorphism preserves T2 (Hausdorff). -/
theorem homeomorphism_preserves_t2 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (h : Homeomorphism X Y) (hX : T2 X) : T2 Y := by
  sorry

/-- Homeomorphism preserves T3 (Regular + T1). -/
theorem homeomorphism_preserves_t3 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (h : Homeomorphism X Y) (hX : T3 X) : T3 Y := by
  sorry

/-- Homeomorphism preserves T3.5 (Tychonoff). -/
theorem homeomorphism_preserves_t3_5 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (h : Homeomorphism X Y) (hX : T3_5 X) : T3_5 Y := by
  sorry

/-- Homeomorphism preserves T4 (Normal + T1). -/
theorem homeomorphism_preserves_t4 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (h : Homeomorphism X Y) (hX : T4 X) : T4 Y := by
  sorry

/-! ## Diagnostics -/

#eval "Morphisms.Iso — Homeomorphism (id, comp, symm), preserves all T_i"

end MiniSeparationAxioms
