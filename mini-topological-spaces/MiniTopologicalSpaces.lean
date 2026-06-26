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
