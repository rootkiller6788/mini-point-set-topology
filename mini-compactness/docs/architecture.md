# mini-compactness — Architecture

## Overview

The compactness package defines all major compactness concepts:
compact, sequentially compact, limit point compact, countably compact,
locally compact, sigma-compact, paracompact, Lindelof,
compactifications (one-point, Stone-Cech, Wallman), and proper maps.

## Dependency Graph

```
mini-compactness
├── mini-object-kernel    (theory registration, object typeclass)
└── mini-topological-spaces (topological space typeclass)
```

Note: Since the dependencies are in stub form, this package defines its own
`TopologicalSpace` typeclass for self-contained operation. The Bridges files
connect to actual topology theories via axioms.

## Module Map

```
MiniCompactness/
├── Core/
│   ├── Basic.lean              — TopologicalSpace, Compact, SequentiallyCompact,
│   │                              LimitPointCompact, CountablyCompact, LocallyCompact,
│   │                              σCompact, Paracompact, Lindelöf, Compactification,
│   │                              OnePointCompactification, StoneCechCompactification,
│   │                              Hausdorff, ProperMap, Homeomorphism, Continuous
│   ├── Laws.lean               — 8 fundamental axioms of compactness theory
│   └── Objects.lean            — CompactnessTheory, CompactnessObject, Registry
├── Morphisms/
│   ├── Hom.lean                — ProperMap, PerfectMap, CompactCoveringMap
│   ├── Iso.lean                — CompactificationEquiv, CompactIso
│   └── Equiv.lean              — CompactnessEquivalence, equivalences of notions
├── Constructions/
│   ├── Products.lean           — Product topology, Tychonoff finite, compact-open
│   ├── Quotients.lean          — Quotient topology, quotients preserve compactness
│   ├── Subobjects.lean         — CompactSubspace, RelativelyCompact, CompactExhaustion
│   └── Universal.lean          — StoneCechUniversalProperty, OnePointUniversalProperty
├── Properties/
│   ├── Invariants.lean         — LindelofNumber, Extent, Spread, Weight
│   ├── Preservation.lean       — Preservation under continuous/perfect/closed maps
│   └── ClassificationData.lean — Compact metric spaces, compact surfaces
├── Theorems/
│   ├── Basic.lean              — Tychonoff (fin), Heine-Borel, tube lemma, Alexander
│   ├── Classification.lean     — Compact metric = complete + totally bounded
│   ├── Main.lean               — Tychonoff (arbitrary), Stone-Cech, Wallman
│   └── UniversalProperties.lean — βX universal, one-point universal, adjunction
├── Examples/
│   ├── Standard.lean           — [0,1], finite spaces, Cantor set, Sⁿ
│   └── Counterexamples.lean    — ℤ, odd-even topology, ω₁, long line
└── Bridges/
    ├── ToAlgebra.lean          — Compact groups, Bohr compactification, Lie groups
    ├── ToTopology.lean         — Remainders, Magill's theorem, lattice of compactifications
    ├── ToGeometry.lean         — Compact manifolds, Hopf-Rinow, Myers, Synge
    └── ToComputation.lean      — Finite topological spaces, computable compactness
```

## Layered Architecture

```
Layer 4: Bridges       (connects to other theories)
Layer 3: Theorems      (main results, all sorry-stated)
Layer 2: Properties    (invariants, preservation, classification data)
Layer 1: Constructions (products, quotients, subobjects, universal)
Layer 1: Morphisms     (proper maps, equivalences, isomorphisms)
Layer 0: Core          (definitions, axioms, objects)
```

## Status

- 135 total targets tracked in CoreCoverage
- 108 fully defined (80%)
- 27 partial (axiomatic / sorry-stated)
- Every file has >=1 #eval demo
