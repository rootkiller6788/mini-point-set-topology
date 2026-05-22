/-
# MiniTopologicalSpaces: Continuous Maps and Other Morphisms

Defines ContinuousMap, OpenMap, ClosedMap, QuotientMap, and Embedding
between topological spaces.
-/

import MiniTopologicalSpaces.Core.Basic

namespace MiniTopologicalSpaces

/-! ## Continuous Map

A function f : X -> Y is continuous iff the preimage of every
open set in Y is open in X.
-/

structure ContinuousMap (X Y : Type u) [tX : TopologicalSpace X] [tY : TopologicalSpace Y] where
  toFun : X → Y
  continuous : ∀ (V : Set Y), V ∈ tY.opens → toFun ⁻¹' V ∈ tX.opens

/-! ## Identity and Composition -/

def ContinuousMap.id (X : Type u) [t : TopologicalSpace X] : ContinuousMap X X where
  toFun := id
  continuous V hV := by
    simpa using hV

def ContinuousMap.comp {X Y Z : Type u} [tX : TopologicalSpace X]
    [tY : TopologicalSpace Y] [tZ : TopologicalSpace Z]
    (g : ContinuousMap Y Z) (f : ContinuousMap X Y) : ContinuousMap X Z where
  toFun := g.toFun ∘ f.toFun
  continuous V hV := by
    have hgV : g.toFun ⁻¹' V ∈ tY.opens := g.continuous V hV
    have hfgV : f.toFun ⁻¹' (g.toFun ⁻¹' V) ∈ tX.opens := f.continuous _ hgV
    simpa [Set.preimage_comp] using hfgV

/-! ## Open Map

A function is open iff the image of every open set is open.
-/

structure OpenMap (X Y : Type u) [tX : TopologicalSpace X] [tY : TopologicalSpace Y] where
  toFun : X → Y
  open_map : ∀ (U : Set X), U ∈ tX.opens → toFun '' U ∈ tY.opens

/-! ## Closed Map

A function is closed iff the image of every closed set is closed.
-/

structure ClosedMap (X Y : Type u) [tX : TopologicalSpace X] [tY : TopologicalSpace Y] where
  toFun : X → Y
  closed_map : ∀ (F : Set X), Set.univ \ F ∈ tX.opens → Set.univ \ (toFun '' F) ∈ tY.opens

/-! ## Quotient Map

A surjective map f : X -> Y is a quotient map iff a set V in Y
is open exactly when its preimage f⁻¹(V) is open in X.
-/

structure QuotientMap (X Y : Type u) [tX : TopologicalSpace X] [tY : TopologicalSpace Y] where
  toFun : X → Y
  surjective : Function.Surjective toFun
  quotient_condition : ∀ (V : Set Y), V ∈ tY.opens ↔ toFun ⁻¹' V ∈ tX.opens

/-! ## Embedding

An embedding is an injective continuous map that induces
the subspace topology on its image.
-/

structure Embedding (X Y : Type u) [tX : TopologicalSpace X] [tY : TopologicalSpace Y] where
  toFun : X → Y
  injective : Function.Injective toFun
  continuous : ∀ (V : Set Y), V ∈ tY.opens → toFun ⁻¹' V ∈ tX.opens
  induces_topology : ∀ (U : Set X), U ∈ tX.opens → ∃ (V : Set Y), V ∈ tY.opens ∧ toFun ⁻¹' V = U

/-! ## #eval Tests -/

#eval "── Morphisms/Hom: types check ──"
#check ContinuousMap
#check OpenMap
#check ClosedMap
#check QuotientMap
#check Embedding

end MiniTopologicalSpaces
