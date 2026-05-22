/-
# MiniSeparationAxioms.Core.Objects

Registers separation-axiom-theoretic types with the kernel's `Object` typeclass.
Provides theory name hierarchy and dependency graph entries.
-/

import MiniObjectKernel.Core.Basic
import MiniObjectKernel.Core.Objects
import MiniSeparationAxioms.Core.Basic

namespace MiniSeparationAxioms

open MiniObjectKernel

/-! ## Theory Names -/

def sepTheory : Objects.TheoryName := Objects.TheoryName.ofString "SeparationAxioms"

def sepTheoryCore : Objects.TheoryName := sepTheory.extend "Core"
def sepTheoryMorphisms : Objects.TheoryName := sepTheory.extend "Morphisms"
def sepTheoryConstructions : Objects.TheoryName := sepTheory.extend "Constructions"
def sepTheoryTheorems : Objects.TheoryName := sepTheory.extend "Theorems"

/-! ## Object Instances -/

/-- AxiomRank as an object in the kernel's typeclass system. -/
instance : Objects.Object AxiomRank where
  theory := sepTheoryCore
  objName := "AxiomRank"
  repr _ := "T_i"

/-! ## Space Tag -/

/-- Space classification by separation axiom satisfied. -/
inductive SpaceClass where
  | t0Space | t1Space | t2Space | t2_5Space
  | t3Space | t3_5Space | t4Space | t5Space | t6Space
  deriving Repr, DecidableEq

def SpaceClass.ofRank : AxiomRank → SpaceClass
  | .t0 => .t0Space | .t1 => .t1Space | .t2 => .t2Space | .t2_5 => .t2_5Space
  | .t3 => .t3Space | .t3_5 => .t3_5Space | .t4 => .t4Space | .t5 => .t5Space
  | .t6 => .t6Space

/-! ## Theory Registration -/

def theoryNode : Dependency.TheoryNode :=
  Dependency.TheoryNode.simple sepTheory
    "Separation Axioms" "0.1.0" "10. mini-point-set-topology"

def dependencyEdges : List Dependency.Edge := [
  { from := sepTheory, to := Objects.TheoryName.ofString "Topology", label := "imports" },
  { from := sepTheory, to := Objects.TheoryName.ofString "MiniMathKernel", label := "imports" }
]

/-! ## Diagnostics -/

#eval "Core.Objects — theory names + SpaceClass registered"

end MiniSeparationAxioms
