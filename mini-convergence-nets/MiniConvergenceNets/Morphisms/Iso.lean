/-
# MiniConvergenceNets.Morphisms.Iso

Isomorphisms of convergence structures: bijective maps preserving
and reflecting convergence in both directions.
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Core.Objects
import MiniConvergenceNets.Morphisms.Hom

namespace MiniConvergenceNets

universe u

/-! ## Convergence Isomorphism -/

/-- A convergence isomorphism is a bijection that preserves and reflects net convergence. -/
structure ConvergenceIso (X Y : Type u) where
  toMap : X → Y
  invMap : Y → X
  left_inv : ∀ x : X, invMap (toMap x) = x
  right_inv : ∀ y : Y, toMap (invMap y) = y
  preservesConvergence : ∀ {α : Type u} (φ : Net α X) (x : X),
    (∃ (tdX : TopologyData X), NetLimit φ x tdX.opens) →
    ∃ (tdY : TopologyData Y), NetLimit
      ({ dir := φ.dir, f := toMap ∘ φ.f } : Net α Y) (toMap x) tdY.opens
  reflectsConvergence : ∀ {α : Type u} (φ : Net α Y) (y : Y),
    (∃ (tdY : TopologyData Y), NetLimit φ y tdY.opens) →
    ∃ (tdX : TopologyData X), NetLimit
      ({ dir := φ.dir, f := invMap ∘ φ.f } : Net α X) (invMap y) tdX.opens

#eval "ConvergenceIso defined"

/-! ## Filter Isomorphism -/

/-- A filter isomorphism preserves filter convergence in both directions. -/
structure FilterIso (X Y : Type u) where
  toMap : X → Y
  invMap : Y → X
  left_inv : ∀ x : X, invMap (toMap x) = x
  right_inv : ∀ y : Y, toMap (invMap y) = y
  preservesFilterConvergence : ∀ (tdX : TopologyData X) (tdY : TopologyData Y)
    (F : Filter X) (x : X),
    FilterConvergence tdX F x → FilterConvergence tdY
      ({ sets := {s : Set Y | toMap ⁻¹' s ∈ F.sets}
         univ_mem := by simpa using F.univ_mem
         empty_not_mem := by
           intro h; apply F.empty_not_mem; simpa using h
         superset_mem := sorry
         inter_mem := sorry
       } : Filter Y) (toMap x)

#eval "FilterIso defined"

/-! ## Equivalence of Convergence Structures -/

/-- Two convergence structures on X are equivalent if the identity map is a convergence isomorphism. -/
def EquivalentConvergenceStructures (X : Type u) (cs1 cs2 : ConvergenceSpace X) : Prop :=
  ∀ {α : Type u} (φ : Net α X) (x : X), cs1.conv φ x ↔ cs2.conv φ x

/-- Equivalence is an equivalence relation. -/
theorem equivalenceConvergenceStructures_refl {X : Type u} (cs : ConvergenceSpace X) :
    EquivalentConvergenceStructures X cs cs := λ _ _ _ => ⟨λ h => h, λ h => h⟩

theorem equivalenceConvergenceStructures_symm {X : Type u} (cs1 cs2 : ConvergenceSpace X)
    (h : EquivalentConvergenceStructures X cs1 cs2) : EquivalentConvergenceStructures X cs2 cs1 :=
  λ _ _ _ => ⟨(h _ _ _).mpr, (h _ _ _).mp⟩

theorem equivalenceConvergenceStructures_trans {X : Type u} (cs1 cs2 cs3 : ConvergenceSpace X)
    (h12 : EquivalentConvergenceStructures X cs1 cs2)
    (h23 : EquivalentConvergenceStructures X cs2 cs3) : EquivalentConvergenceStructures X cs1 cs3 :=
  λ _ _ _ => ⟨λ h1 => (h23 _ _ _).mp ((h12 _ _ _).mp h1),
               λ h3 => (h12 _ _ _).mpr ((h23 _ _ _).mpr h3)⟩

#eval "Equivalence of convergence structures is an equivalence relation: OK"

end MiniConvergenceNets
