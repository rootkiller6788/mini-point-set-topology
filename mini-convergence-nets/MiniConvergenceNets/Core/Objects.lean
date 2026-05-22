/-
# MiniConvergenceNets.Core.Objects

Mathematical objects for convergence theory: convergence space,
limit space, Kent convergence space, and their object instances.
-/

import MiniConvergenceNets.Core.Basic
import MiniObjectKernel.Core.Basic
import MiniObjectKernel.Core.Objects

namespace MiniConvergenceNets

universe u v

/-! ## Convergence Space -/

/-- A convergence space: a type X equipped with a relation between nets and points
    satisfying the convergence axioms. -/
structure ConvergenceSpace (X : Type u) where
  conv : ∀ {α : Type u} (φ : Net α X) (x : X), Prop
  constant_converges : ∀ (x : X), conv (Net.mk (dir := ℕdir) (f := λ _ => x)) x
  subnet_preserves : ∀ {α β : Type u} (σ : Subnet β α X) (x : X),
    conv σ.orig x → conv ({ dir := σ.newDir, f := λ a => σ.orig.f (σ.lift a) } : Net β X) x

/-- Object instance for ConvergenceSpace. -/
instance ConvergenceSpace.obj (X : Type u) : Object (ConvergenceSpace X) where
  theory := TheoryName.ofString "ConvergenceTheory.ConvergenceSpace"
  objName := toString (repr X)
  repr cs := s!"ConvergenceSpace({repr X})"

#eval "ConvergenceSpace object defined"

/-! ## Limit Space -/

/-- A limit space: convergence where limits are unique. -/
structure LimitSpace (X : Type u) extends ConvergenceSpace X where
  limit_unique : ∀ {α : Type u} (φ : Net α X) (x y : X),
    conv φ x → conv φ y → x = y

instance LimitSpace.obj (X : Type u) : Object (LimitSpace X) where
  theory := TheoryName.ofString "ConvergenceTheory.LimitSpace"
  objName := toString (repr X)
  repr ls := s!"LimitSpace({repr X})"

#eval "LimitSpace object defined"

/-! ## Kent Convergence Space -/

/-- A Kent convergence space: convergence compatible with the Kent axioms. -/
structure KentConvergenceSpace (X : Type u) extends ConvergenceSpace X where
  kent_axiom : ∀ {α β : Type u} (φ : Net α X) (ψ : Net β X),
    (∀ A : Set X, φ.eventually A → ψ.eventually A) → (∀ x : X, conv φ x → conv ψ x)

instance KentConvergenceSpace.obj (X : Type u) : Object (KentConvergenceSpace X) where
  theory := TheoryName.ofString "ConvergenceTheory.KentSpace"
  objName := toString (repr X)
  repr kc := s!"KentConvergenceSpace({repr X})"

/-! ## Topological Convergence Space -/

/-- A convergence space derived from a topology. -/
def topologicalConvergence {X : Type u} (td : TopologyData X) : ConvergenceSpace X where
  conv φ x := NetLimit φ x td.opens
  constant_converges x := by
    intro U hU hxU
    refine ⟨Classical.choice (by infer_instance), λ j _ => ?_⟩
    show (λ _ => x) j ∈ U
    exact hxU
  subnet_preserves σ x h := by
    intro U hU hxU
    rcases h U hU hxU with ⟨i, hi⟩
    rcases σ.cofinal i with ⟨b, hb⟩
    refine ⟨b, λ j hbj => ?_⟩
    apply hi (σ.lift j)
    exact σ.orig.dir.le_trans hb (σ.monotone hbj)

#eval "Topological convergence space constructed"

/-! ## Net Convergence Structure Object -/

/-- A net convergence structure on X is given by a set of convergent net-point pairs. -/
structure NetConvergenceStructure (X : Type u) where
  limits : ∀ {α : Type u} (φ : Net α X), Set X
  isConstantLimit : ∀ {α : Type u} (φ : Net α X),
    (∀ i j, φ.f i = φ.f j) → ∀ i, φ.f i ∈ limits φ
  isSubnetClosed : ∀ {α β : Type u} (σ : Subnet β α X),
    limits σ.orig ⊆ limits ({ dir := σ.newDir, f := λ a => σ.orig.f (σ.lift a) } : Net β X)

end MiniConvergenceNets
