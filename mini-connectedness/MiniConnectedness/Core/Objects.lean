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

#eval "Connectedness Object instances registered"

#eval MiniObjectKernel.describe (α := Nat)

end MiniConnectedness
