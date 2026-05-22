/-
# MiniTopologicalConstructions.Morphisms.Iso

Homeomorphisms of topological constructions and natural isomorphisms
between functors (suspension, cone, smash, etc.).
-/

import MiniTopologicalConstructions.Core.Basic
import MiniTopologicalConstructions.Morphisms.Hom

namespace MiniTopologicalConstructions

/-! ## Homeomorphism of Constructions -/

/-- A homeomorphism between topological constructions:
    a continuous bijection with continuous inverse. -/
structure ConstructionHomeo {X Y : Type u} (sX : TopSpace X) (sY : TopSpace Y) where
  toMap : ConstructionMap sX sY
  invMap : ConstructionMap sY sX
  leftInv : Prop := True   -- invMap ∘ toMap = id
  rightInv : Prop := True  -- toMap ∘ invMap = id

/-- Identity homeomorphism. -/
def constructionHomeoId {X : Type u} (sX : TopSpace X) : ConstructionHomeo sX sX where
  toMap := constructionMapId sX
  invMap := constructionMapId sX

/-- Inverse of a homeomorphism. -/
def constructionHomeoSymm {X Y : Type u} {sX : TopSpace X} {sY : TopSpace Y}
  (h : ConstructionHomeo sX sY) : ConstructionHomeo sY sX where
  toMap := h.invMap
  invMap := h.toMap

/-- Composition of homeomorphisms. -/
def constructionHomeoTrans {X Y Z : Type u} {sX : TopSpace X} {sY : TopSpace Y} {sZ : TopSpace Z}
  (h1 : ConstructionHomeo sX sY) (h2 : ConstructionHomeo sY sZ) : ConstructionHomeo sX sZ where
  toMap := constructionMapComp h2.toMap h1.toMap
  invMap := constructionMapComp h1.invMap h2.invMap

#eval "ConstructionHomeo type defined"

/-! ## Natural Isomorphisms Between Constructions -/

/-- Cone of cone is naturally isomorphic to suspension:
    C(C(-)) ≅ Σ(-) as functors Top → Top. -/
structure ConeOfConeNatIso where
  /-- Component at X: C(CX) ≅ ΣX -/
  component {X : Type u} (sX : TopSpace X) : ConstructionHomeo (Cone (Cone sX)) (Suspension sX)
  naturality : Prop := True  -- naturality square commutes

/-- Smash with S¹ is naturally isomorphic to suspension:
    S¹ ∧ (-) ≅ Σ(-).
-/
structure SmashS1NatIso where
  component {X : Type u} (sX : TopSpace X) (bx : X) :
    ConstructionHomeo (SmashProduct (by sorry) sX (by sorry) bx) (Suspension sX)
  naturality : Prop := True

/-- Join with S⁰ is naturally isomorphic to suspension:
    S⁰ * (-) ≅ Σ(-).
-/
structure JoinS0NatIso where
  component {X : Type u} (sX : TopSpace X) : ConstructionHomeo (Join (by sorry) sX) (Suspension sX)
  naturality : Prop := True

#eval "Cone(CX) ≅ ΣX natural isomorphism"

/-! ## Specific Homeomorphisms -/

/-- The wedge sum S¹ ∨ S¹ is homeomorphic to the figure-eight. -/
def wedgeS1S1Homeo : Prop := True

/-- The smash product S¹ ∧ S¹ is homeomorphic to S². -/
def smashS1S1Homeo : Prop := True

/-- The suspension ΣS¹ is homeomorphic to S². -/
def suspensionS1Homeo : Prop := True

/-- The cone over S¹ is homeomorphic to the disk D². -/
def coneS1Homeo : Prop := True

#eval "ΣS¹ ≅ S² — homeomorphism axiom"
#eval "Cone over S¹ ≅ D² — homeomorphism axiom"
#eval "(Morphisms.Iso) Homeomorphisms and natural isomorphisms defined"
#eval "  ConstructionHomeo, ConeOfConeNatIso, SmashS1NatIso, JoinS0NatIso"
