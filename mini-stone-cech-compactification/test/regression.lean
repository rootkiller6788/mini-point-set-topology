/-
# Tests.Regression

Regression tests ensuring all modules import correctly.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws
import MiniStoneCechCompactification.Core.Objects
import MiniStoneCechCompactification.Morphisms.Hom
import MiniStoneCechCompactification.Morphisms.Iso
import MiniStoneCechCompactification.Morphisms.Equiv
import MiniStoneCechCompactification.Constructions.Products
import MiniStoneCechCompactification.Constructions.Quotients
import MiniStoneCechCompactification.Constructions.Subobjects
import MiniStoneCechCompactification.Constructions.Universal
import MiniStoneCechCompactification.Properties.Invariants
import MiniStoneCechCompactification.Properties.Preservation
import MiniStoneCechCompactification.Properties.ClassificationData
import MiniStoneCechCompactification.Theorems.Basic
import MiniStoneCechCompactification.Theorems.Classification
import MiniStoneCechCompactification.Theorems.Main
import MiniStoneCechCompactification.Theorems.UniversalProperties
import MiniStoneCechCompactification.Examples.Standard
import MiniStoneCechCompactification.Examples.Counterexamples
import MiniStoneCechCompactification.Bridges.ToAlgebra
import MiniStoneCechCompactification.Bridges.ToTopology
import MiniStoneCechCompactification.Bridges.ToGeometry
import MiniStoneCechCompactification.Bridges.ToComputation

open MiniStoneCechCompactification

/-- Regression: all modules import. -/
#eval "Regression: All 23 modules imported successfully"

def main : IO Unit := do
  IO.println "mini-stone-cech-compactification: regression tests passed"
  return ()

#eval main
