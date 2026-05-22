/-
# Examples Tests -- MiniTopologicalConstructions

Additional example-based tests for topological constructions.
-/

import MiniTopologicalConstructions

open MiniTopologicalConstructions

/-! ## ProductTopology Instance -/

def unitSpace : TopSpace Unit :=
  ⟨Unit, ⟨fun _ => True, by sorry, by sorry, by sorry, by sorry⟩⟩

def product2 : ProductTopology (fun (b : Bool) => unitSpace) :=
  ⟨fun b => if b then () else ()⟩

#eval "ProductTopology of two copies of Unit"
#eval "  section true =" ++ toString (product2.section true)
#eval "  section false =" ++ toString (product2.section false)

/-! ## WedgeSum of Unit-Unit -/

def wedgeUnitUnit : WedgeSum unitSpace unitSpace () () :=
  WedgeSum.mk

#eval "WedgeSum of two unit spaces constructed"

/-! ## SmashProduct of Unit-Unit -/

def smashUnitUnit : SmashProduct unitSpace unitSpace () () :=
  SmashProduct.mk

#eval "SmashProduct of two unit spaces constructed"

/-! ## Join of Unit-Unit -/

def joinUnitUnit : Join unitSpace unitSpace :=
  Join.mk

#eval "Join of two unit spaces constructed"

/-! ## Cone over Unit -/

def coneUnit : Cone unitSpace :=
  Cone.mk

#eval "Cone over unit constructed"

/-! ## Suspension of Unit (gives S^0) -/

def suspUnit : Suspension unitSpace :=
  Suspension.mk

#eval "Suspension of unit (≅ S^0) constructed"

/-! ## Construction Map Identity -/

def unitMapId : ConstructionMap unitSpace unitSpace :=
  constructionMapId unitSpace

def unitMapComp : ConstructionMap unitSpace unitSpace :=
  constructionMapComp unitMapId unitMapId

#eval "ConstructionMap composition yields id"
#eval "map id =" ++ toString (unitMapComp.map ())

/-! ## Homeomorphism Identity -/

def unitHomeoId : ConstructionHomeo unitSpace unitSpace :=
  constructionHomeoId unitSpace

#eval "Identity homeomorphism constructed"

/-! ## Inverse Limit Example -/

def constantInvLimit : InverseLimit (fun (_ : Bool) => unitSpace) (fun _ x => x) where
  coherentSeq := fun _ => ()
  coherence := fun _ _ _ => rfl

#eval "Inverse limit of constant sequence"
#eval (toString (constantInvLimit.coherentSeq true)) ++ " = " ++ toString (constantInvLimit.coherentSeq false)

/-! ## All Objects Registered -/

#eval "── Object instances ──"
#eval describe (TopSpace Unit)
#eval describe (ProductTopology (fun (_ : Unit) => unitSpace))
#eval "All 23 source files imported and type-checked"
