/-
# MiniTopologicalConstructions.Core.Objects

Object instance for topological constructions, registering each
construction as a mathematical object in the Object typeclass hierarchy.
-/

import MiniObjectKernel.Core.Basic
import MiniTopologicalConstructions.Core.Basic

namespace MiniTopologicalConstructions

open MiniObjectKernel

/-! ## Object Instance for Topological Constructions -/

/-- Register TopSpace as an Object. -/
instance {α : Type u} : Object (TopSpace α) where
  theory := TheoryName.ofString "Topology.Constructions"
  objName := s!"TopSpace◆"
  repr _ := "TopSpace(...)"

/-- Register ProductTopology as an Object. -/
instance {I : Type u} {spaces : I → TopSpace (Type u)} : Object (ProductTopology spaces) where
  theory := TheoryName.ofString "Topology.Constructions.Product"
  objName := "ProductTopology"
  repr _ := "∏_i X_i"

/-- Register WedgeSum as an Object. -/
instance {X Y : Type u} {sX : TopSpace X} {sY : TopSpace Y} {bx : X} {by : Y} :
  Object (WedgeSum sX sY bx by) where
  theory := TheoryName.ofString "Topology.Constructions.Wedge"
  objName := "WedgeSum"
  repr _ := "X ∨ Y"

/-- Register SmashProduct as an Object. -/
instance {X Y : Type u} {sX : TopSpace X} {sY : TopSpace Y} {bx : X} {by : Y} :
  Object (SmashProduct sX sY bx by) where
  theory := TheoryName.ofString "Topology.Constructions.Smash"
  objName := "SmashProduct"
  repr _ := "X ∧ Y"

/-- Register Join as an Object. -/
instance {X Y : Type u} {sX : TopSpace X} {sY : TopSpace Y} : Object (Join sX sY) where
  theory := TheoryName.ofString "Topology.Constructions.Join"
  objName := "Join"
  repr _ := "X * Y"

/-- Register Cone as an Object. -/
instance {X : Type u} {sX : TopSpace X} : Object (Cone sX) where
  theory := TheoryName.ofString "Topology.Constructions.Cone"
  objName := "Cone"
  repr _ := "CX"

/-- Register Suspension as an Object. -/
instance {X : Type u} {sX : TopSpace X} : Object (Suspension sX) where
  theory := TheoryName.ofString "Topology.Constructions.Suspension"
  objName := "Suspension"
  repr _ := "ΣX"

/-- Register ReducedSuspension as an Object. -/
instance {X : Type u} {sX : TopSpace X} {b : X} : Object (ReducedSuspension sX b) where
  theory := TheoryName.ofString "Topology.Constructions.RedSusp"
  objName := "ReducedSuspension"
  repr _ := "Σ^red X"

/-- Register MappingCylinder as an Object. -/
instance {X Y : Type u} {f : X → Y} {sX : TopSpace X} {sY : TopSpace Y} :
  Object (MappingCylinder f sX sY) where
  theory := TheoryName.ofString "Topology.Constructions.MappingCylinder"
  objName := "MappingCylinder"
  repr _ := "M_f"

/-- Register MappingCone as an Object. -/
instance {X Y : Type u} {f : X → Y} {sX : TopSpace X} {sY : TopSpace Y} :
  Object (MappingCone f sX sY) where
  theory := TheoryName.ofString "Topology.Constructions.MappingCone"
  objName := "MappingCone"
  repr _ := "C_f"

/-- Register DirectLimit as an Object. -/
instance {ι : Type u} [Preorder ι] {spaces : ι → TopSpace (Type u)}
  {maps : {i j : ι} → (i ≤ j) → (spaces i).carrier → (spaces j).carrier} :
  Object (DirectLimit spaces maps) where
  theory := TheoryName.ofString "Topology.Constructions.DirectLimit"
  objName := "DirectLimit"
  repr _ := "colim X_i"

/-- Register InverseLimit as an Object. -/
instance {ι : Type u} [Preorder ι] {spaces : ι → TopSpace (Type u)}
  {maps : {i j : ι} → (i ≤ j) → (spaces j).carrier → (spaces i).carrier} :
  Object (InverseLimit spaces maps) where
  theory := TheoryName.ofString "Topology.Constructions.InverseLimit"
  objName := "InverseLimit"
  repr _ := "lim X_i"

/-- Register SequentialColimit as an Object. -/
instance {spaces : Nat → TopSpace (Type u)} {maps : (n : Nat) → (spaces n).carrier → (spaces (n+1)).carrier} :
  Object (SequentialColimit spaces maps) where
  theory := TheoryName.ofString "Topology.Constructions.SeqColimit"
  objName := "SequentialColimit"
  repr _ := "colim_n X_n"

/-- Register AdjunctionSpace as an Object. -/
instance {X Y A : Type u} {sX : TopSpace X} {sY : TopSpace Y}
  {sub : A → X} {f : A → Y} : Object (AdjunctionSpace sX sY sub f) where
  theory := TheoryName.ofString "Topology.Constructions.Adjunction"
  objName := "AdjunctionSpace"
  repr _ := "X ∪_f Y"

/-- Register QuotientTopology as an Object. -/
instance {X : Type u} {s : TopSpace X} {rel : X → X → Prop} : Object (QuotientTopology s rel) where
  theory := TheoryName.ofString "Topology.Constructions.Quotient"
  objName := "QuotientTopology"
  repr _ := "X/~"

/-! ## Construction Registration -/

/-- Register all topological construction theories. -/
def registerTopologicalConstructions : IO Unit := do
  IO.println "TopologicalConstructions registered as Object instances"

#eval "(Objects.lean) All topological constructions registered as Objects"
#eval describe (TopSpace (Type 0))
#eval describe (ProductTopology (fun (_ : Unit) => { carrier := Unit, topology := ⟨fun _ => True, sorry, sorry, sorry, sorry⟩ } : TopSpace (Type 0)))
