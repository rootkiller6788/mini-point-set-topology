# mini-compactness

Compactness concepts: compact, sequentially compact, limit point compact,
countably compact, locally compact, sigma-compact, paracompact, Lindelof,
compactifications (one-point, Stone-Cech), and proper maps.

## Dependencies
- mini-object-kernel
- mini-topological-spaces

## Module Map

```
MiniCompactness/
├── Core/
│   ├── Basic.lean              — Compact, SequentiallyCompact, LimitPointCompact, etc.
│   ├── Laws.lean               — Closed subset of compact, continuous image, Tychonoff
│   └── Objects.lean            — Object instances, theory registration
├── Morphisms/
│   ├── Hom.lean                — ProperMap, perfect map, compact-covering map
│   ├── Iso.lean                — Equivalence of compactifications
│   └── Equiv.lean              — Compactness equivalences
├── Constructions/
│   ├── Products.lean           — Tychonoff product, compact-open topology
│   ├── Quotients.lean          — Quotient of compact is compact
│   ├── Subobjects.lean         — Compact subspace, relatively compact
│   └── Universal.lean          — Universal properties
├── Properties/
│   ├── Invariants.lean         — Compactness number, extent, spread, weight
│   ├── Preservation.lean       — Preservation under maps
│   └── ClassificationData.lean — Classification data
├── Theorems/
│   ├── Basic.lean              — Tychonoff, Heine-Borel, tube lemma
│   ├── Classification.lean     — Characterization of compact metric spaces
│   ├── Main.lean               — Tychonoff, Stone-Cech, Wallman
│   └── UniversalProperties.lean — Universal property theorems
├── Examples/
│   ├── Standard.lean           — [0,1] compact, finite spaces, Cantor set
│   └── Counterexamples.lean    — Z not compact, odd-even topology
└── Bridges/
    ├── ToAlgebra.lean          — Bohr compactification, compact groups
    ├── ToTopology.lean         — Compactifications, remainders
    ├── ToGeometry.lean         — Compact manifolds
    └── ToComputation.lean      — Finite topological spaces
```
