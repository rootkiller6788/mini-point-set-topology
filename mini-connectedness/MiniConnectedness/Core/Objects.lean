/-
# MiniConnectedness: Objects

Object registrations for connectedness structures, tying into
the MiniObjectKernel.Object typeclass framework.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic

namespace MiniConnectedness

/-! ## Object instances for connectedness structures -/

/-- The theory name for connectedness. -/
def connectednessTheory : MiniObjectKernel.TheoryName :=
  MiniObjectKernel.TheoryName.ofString "Topology.Connectedness"

/-- Object instance for TopologicalSpace. -/
instance (α : Type u) [TopSpace α] : MiniObjectKernel.Object α where
  theory := connectednessTheory
  objName := s!"TopologicalSpace({α})"
  repr _ := s!"Space({α})"

/-- A connected space as an object. -/
structure ConnectedSpace (α : Type u) [TopSpace α] where
  isConnected : IsConnected α

instance {α} [TopSpace α] [ConnectedSpace α] : MiniObjectKernel.Object α where
  theory := connectednessTheory.extend "Connected"
  objName := s!"Connected({α})"
  repr _ := s!"Connected({α})"

/-- A path-connected space as an object. -/
structure PathConnectedSpace (α : Type u) [TopSpace α] where
  isPathConnected : IsPathConnected α

instance {α} [TopSpace α] [PathConnectedSpace α] : MiniObjectKernel.Object α where
  theory := connectednessTheory.extend "PathConnected"
  objName := s!"PathConnected({α})"
  repr _ := s!"PathConnected({α})"

/-- A continuum as a mathematical object. -/
instance {α} [TopSpace α] [c : Continuum α] : MiniObjectKernel.Object α where
  theory := connectednessTheory.extend "Continuum"
  objName := s!"Continuum({α})"
  repr x := s!"pt({x})"

/-! ## #eval -/

#eval "══ Core/Objects: Connectedness Object Instances ══"
#eval MiniObjectKernel.describe (α := Nat)
#eval MiniObjectKernel.describe (α := SierpinskiSpace)
#eval "ConnectedSpace, PathConnectedSpace, Continuum object instances all registered."
#eval "Each instance provides: theory name, object name, and string representation."

/-- Additional object instances for concrete connectedness structures. -/
instance : ConnectedSpace SierpinskiSpace where
  isConnected := sierpinski_connected

def discreteConnectedComponentSet {α : Type u} [TopSpace α] (x : α) : Set α := Component x

/-- The theory of connectedness extends MiniObjectKernel's TheoryName hierarchy. -/
#eval connectednessTheory
#eval connectednessTheory.extend "Connected"
#eval connectednessTheory.extend "PathConnected"
#eval connectednessTheory.extend "Continuum"

#eval "Core/Objects: All object instances complete and registered."

end MiniConnectedness
