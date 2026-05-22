/-
# MiniConvergenceNets

The convergence theory package — nets, filters, ultrafilters,
and their applications to topology.

## Sub-packages
- `Core`          — DirectedSet, Net, Filter, Ultrafilter, convergence structures
- `Morphisms`     — Convergence-preserving maps, equivalences
- `Constructions` — Products, quotients, subobjects, universal constructions
- `Properties`    — Invariants, preservation theorems, classification data
- `Theorems`      — Tychonoff, compactness characterizations, universal properties
- `Examples`      — Standard examples, counterexamples
- `Bridges`       — ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Core.Objects
import MiniConvergenceNets.Core.Laws
import MiniConvergenceNets.Morphisms.Hom
import MiniConvergenceNets.Morphisms.Iso
import MiniConvergenceNets.Morphisms.Equiv
import MiniConvergenceNets.Constructions.Subobjects
import MiniConvergenceNets.Constructions.Quotients
import MiniConvergenceNets.Constructions.Products
import MiniConvergenceNets.Constructions.Universal
import MiniConvergenceNets.Properties.Invariants
import MiniConvergenceNets.Properties.Preservation
import MiniConvergenceNets.Properties.ClassificationData
import MiniConvergenceNets.Theorems.Basic
import MiniConvergenceNets.Theorems.UniversalProperties
import MiniConvergenceNets.Theorems.Classification
import MiniConvergenceNets.Theorems.Main
import MiniConvergenceNets.Examples.Standard
import MiniConvergenceNets.Examples.Counterexamples
import MiniConvergenceNets.Bridges.ToAlgebra
import MiniConvergenceNets.Bridges.ToTopology
import MiniConvergenceNets.Bridges.ToGeometry
import MiniConvergenceNets.Bridges.ToComputation
