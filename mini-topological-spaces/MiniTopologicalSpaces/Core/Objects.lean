/-
# MiniTopologicalSpaces: Objects

Object instance for TopologicalSpace, theory registration,
and derived concept objects.
-/

import MiniObjectKernel.Core.Basic
import MiniObjectKernel.Core.Objects
import MiniTopologicalSpaces.Core.Basic

namespace MiniTopologicalSpaces

open MiniObjectKernel

/-! ## Object Instance for TopologicalSpace -/

instance (X : Type u) [t : TopologicalSpace X] : Object (TopologicalSpace X) where
  theory := TheoryName.ofString "PointSetTopology"
  objName := s!"TopologicalSpace({typeName X})"
  repr _ := "TopologicalSpace(...)"
where
  typeName (_ : Type u) : String := "?"

/-! ## Subobject Instance for OpenSet -/

instance (X : Type u) [t : TopologicalSpace X] : Object (OpenSet X) where
  theory := TheoryName.ofString "PointSetTopology.OpenSet"
  objName := s!"OpenSet({typeName X})"
  repr _ := "OpenSet(...)"
where
  typeName (_ : Type u) : String := "?"

/-! ## Subobject Instance for ClosedSet -/

instance (X : Type u) [t : TopologicalSpace X] : Object (ClosedSet X) where
  theory := TheoryName.ofString "PointSetTopology.ClosedSet"
  objName := s!"ClosedSet({typeName X})"
  repr _ := "ClosedSet(...)"
where
  typeName (_ : Type u) : String := "?"

/-! ## Theory Registration -/

def registerTopologyTheory : IO Unit := do
  IO.println "PointSetTopology theory registered as Object instance"
  IO.println "  - TopologicalSpace: open sets axiomatization"
  IO.println "  - OpenSet, ClosedSet: derived subtypes"
  IO.println "  - Neighborhood, Interior, Closure, Boundary"
  IO.println "  - LimitPoint, IsolatedPoint, Dense, Separable"

#eval "── Core.Objects: Object instances ──"
open MiniObjectKernel
#check (inferInstance : Object (TopologicalSpace Nat))
#eval describe (TopologicalSpace Nat)
#eval "Theory registration available"

end MiniTopologicalSpaces
