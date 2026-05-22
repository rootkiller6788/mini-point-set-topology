/-
# MiniTopologicalSpaces

The point-set topology sub-package — defines `TopologicalSpace`
via open sets, continuous maps, homeomorphisms, product/quotient/subspace
topologies, separation axioms, compactness, connectedness, and bridges
to algebra, analysis, geometry, and computation.

## Sub-packages
- `Core`          — TopologicalSpace, OpenSet, ClosedSet, Neighborhood,
                    Interior, Closure, Boundary, LimitPoint, IsolatedPoint,
                    Dense, Separable, Object instance, Laws
- `Morphisms`     — ContinuousMap, OpenMap, ClosedMap, QuotientMap,
                    Embedding, Homeomorphism, HomotopyEquivalence, WeakHomotopyEquivalence
- `Constructions` — ProductTopology, QuotientTopology, SubspaceTopology,
                    Subbasis/Basis generation, Universal properties
- `Properties`    — Invariants, Preservation, ClassificationData
- `Theorems`      — Basic, UniversalProperties, Classification, Main
- `Examples`      — Standard, Counterexamples
- `Bridges`       — ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniTopologicalSpaces.Core.Basic
import MiniTopologicalSpaces.Core.Objects
import MiniTopologicalSpaces.Core.Laws
import MiniTopologicalSpaces.Morphisms.Hom
import MiniTopologicalSpaces.Morphisms.Iso
import MiniTopologicalSpaces.Morphisms.Equiv
import MiniTopologicalSpaces.Constructions.Products
import MiniTopologicalSpaces.Constructions.Quotients
import MiniTopologicalSpaces.Constructions.Subobjects
import MiniTopologicalSpaces.Constructions.Universal
import MiniTopologicalSpaces.Properties.Invariants
import MiniTopologicalSpaces.Properties.Preservation
import MiniTopologicalSpaces.Properties.ClassificationData
import MiniTopologicalSpaces.Theorems.Basic
import MiniTopologicalSpaces.Theorems.UniversalProperties
import MiniTopologicalSpaces.Theorems.Classification
import MiniTopologicalSpaces.Theorems.Main
import MiniTopologicalSpaces.Examples.Standard
import MiniTopologicalSpaces.Examples.Counterexamples
import MiniTopologicalSpaces.Bridges.ToAlgebra
import MiniTopologicalSpaces.Bridges.ToTopology
import MiniTopologicalSpaces.Bridges.ToGeometry
import MiniTopologicalSpaces.Bridges.ToComputation
