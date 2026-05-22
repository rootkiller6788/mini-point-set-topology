/-
# MiniTopologicalSpaces: Universal Properties

Universal properties of product, quotient, and subspace topologies
in the category Top of topological spaces and continuous maps.
-/

import MiniTopologicalSpaces.Core.Basic
import MiniTopologicalSpaces.Morphisms.Hom
import MiniTopologicalSpaces.Constructions.Products
import MiniTopologicalSpaces.Constructions.Quotients
import MiniTopologicalSpaces.Constructions.Subobjects

namespace MiniTopologicalSpaces

/-! ## Category Top

The category Top has topological spaces as objects and
continuous maps as morphisms. We define the universal
properties that characterize products, quotients, and
subspaces in this category.
-/

/-! ## Universal Property of Product Topology

The product topology is the coarsest topology on X × Y
making both projections continuous. It satisfies the
universal property: for any space Z with continuous maps
f : Z -> X and g : Z -> Y, there exists a unique continuous
map (f, g) : Z -> X × Y such that π₁ ∘ (f, g) = f and
π₂ ∘ (f, g) = g.
-/

def productUniversalProperty (X Y : Type u) [tX : TopologicalSpace X]
    [tY : TopologicalSpace Y] : Prop :=
  ∀ (Z : Type u) [tZ : TopologicalSpace Z] (f : ContinuousMap Z X) (g : ContinuousMap Z Y),
    ∃! h : ContinuousMap Z (X × Y),
      (pi1 X Y).toFun ∘ h.toFun = f.toFun ∧ (pi2 X Y).toFun ∘ h.toFun = g.toFun

/-! ## Universal Property of Quotient Topology

The quotient topology is the finest topology on Y making
the projection q : X -> Y continuous. It satisfies the
universal property: for any continuous map f : X -> Z that
is constant on fibers of q, there exists a unique continuous
map f̄ : Y -> Z with f̄ ∘ q = f.
-/

def quotientUniversalProperty {X Y : Type u} [tX : TopologicalSpace X]
    (q : X → Y) (h_surj : Function.Surjective q) : Prop :=
  ∀ (Z : Type u) [tZ : TopologicalSpace Z] (f : ContinuousMap X Z),
    (∀ a b, q a = q b → f.toFun a = f.toFun b) →
    ∃! f̄ : ContinuousMap Y Z, f̄.toFun ∘ q = f.toFun

/-! ## Universal Property of Subspace Topology

The subspace topology is the coarsest topology on A making
the inclusion i : A -> X continuous. It satisfies the
universal property: for any continuous map f : Z -> X whose
image lies in A, there exists a unique continuous map
f|ᴀ : Z -> A such that i ∘ f|ᴀ = f.
-/

def subspaceUniversalProperty {X : Type u} [tX : TopologicalSpace X]
    (A : Set X) : Prop :=
  ∀ (Z : Type u) [tZ : TopologicalSpace Z] (f : ContinuousMap Z X),
    (∀ z, f.toFun z ∈ A) →
    ∃! f_restrict : ContinuousMap Z (Subtype A),
      (fun (s : Subtype A) => s.val) ∘ f_restrict.toFun = f.toFun

#eval "── Constructions/Universal: category Top ──"
#check productUniversalProperty
#check quotientUniversalProperty
#check subspaceUniversalProperty
#eval "Universal properties for product, quotient, subspace defined"

end MiniTopologicalSpaces
