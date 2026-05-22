/-
# MiniCompactness

Compactness theory package covering:
- Core: Compact, SequentiallyCompact, LimitPointCompact, CountablyCompact,
  LocallyCompact, σCompact, Paracompact, Lindelöf, Compactification,
  OnePointCompactification, StoneCechCompactification
- Morphisms: ProperMap, PerfectMap, CompactCoveringMap, CompactIso
- Constructions: Products, Quotients, Subobjects, Universal properties
- Properties: Invariants, Preservation, ClassificationData
- Theorems: Tychonoff, Heine-Borel, tube lemma, Alexander subbase
- Examples: [0,1], (0,1], finite spaces, Cantor set, ℤ, ω₁
- Bridges: ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniCompactness.Core.Basic
import MiniCompactness.Core.Objects
import MiniCompactness.Core.Laws
import MiniCompactness.Morphisms.Hom
import MiniCompactness.Morphisms.Iso
import MiniCompactness.Morphisms.Equiv
import MiniCompactness.Constructions.Products
import MiniCompactness.Constructions.Quotients
import MiniCompactness.Constructions.Subobjects
import MiniCompactness.Constructions.Universal
import MiniCompactness.Properties.Invariants
import MiniCompactness.Properties.Preservation
import MiniCompactness.Properties.ClassificationData
import MiniCompactness.Theorems.Basic
import MiniCompactness.Theorems.Classification
import MiniCompactness.Theorems.Main
import MiniCompactness.Theorems.UniversalProperties
import MiniCompactness.Examples.Standard
import MiniCompactness.Examples.Counterexamples
import MiniCompactness.Bridges.ToAlgebra
import MiniCompactness.Bridges.ToTopology
import MiniCompactness.Bridges.ToGeometry
import MiniCompactness.Bridges.ToComputation
