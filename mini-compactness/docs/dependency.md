# mini-compactness — Dependencies

## Internal Dependency Graph

```
MiniCompactness.lean (imports all below)
│
├── Core/Basic.lean          (self-contained, imports nothing)
│   └── defines TopologicalSpace, all compactness types
│
├── Core/Laws.lean           → Core/Basic.lean
│   └── declares fundamental axioms
│
├── Core/Objects.lean         → Core/Basic.lean, Core/Laws.lean
│   └── theory and object registration
│
├── Morphisms/Hom.lean        → Core/Basic.lean
│   ├── Morphisms/Iso.lean    → Core/Basic.lean
│   └── Morphisms/Equiv.lean  → Core/Basic.lean
│
├── Constructions/
│   ├── Products.lean         → Core/Basic.lean, Core/Laws.lean
│   ├── Quotients.lean        → Core/Basic.lean
│   ├── Subobjects.lean       → Core/Basic.lean
│   └── Universal.lean        → Core/Basic.lean
│
├── Properties/
│   ├── Invariants.lean       → Core/Basic.lean
│   ├── Preservation.lean     → Core/Basic.lean, Core/Laws.lean, Morphisms/Hom.lean
│   └── ClassificationData.lean → Core/Basic.lean
│
├── Theorems/
│   ├── Basic.lean            → Core/Basic.lean, Core/Laws.lean, Constructions/Products.lean
│   ├── Classification.lean   → Core/Basic.lean, Properties/ClassificationData.lean
│   ├── Main.lean             → Core/Basic.lean, Theorems/Basic.lean, Constructions/Universal.lean
│   └── UniversalProperties.lean → Core/Basic.lean, Constructions/Universal.lean
│
├── Examples/
│   ├── Standard.lean         → Core/Basic.lean
│   └── Counterexamples.lean  → Core/Basic.lean
│
└── Bridges/
    ├── ToAlgebra.lean        → Core/Basic.lean
    ├── ToTopology.lean       → Core/Basic.lean
    ├── ToGeometry.lean       → Core/Basic.lean
    └── ToComputation.lean    → Core/Basic.lean
```

## External Dependencies (via Lake)

```
mini-compactness
├── mini-object-kernel    → Object typeclass, theory registration
└── mini-topological-spaces → TopologicalSpace typeclass (future)
```

Note: Both external dependencies are currently stubs. The package is
self-contained via its own `TopologicalSpace` class in `Core/Basic.lean`.

## Test Dependencies

```
Test/Smoke.lean           → MiniCompactness
Test/Examples.lean        → MiniCompactness
Test/Regression.lean      → MiniCompactness
```

## Benchmark Dependencies

```
Benchmark/CoreCoverage.lean      → (documentation, no imports)
Benchmark/CambridgePartIII.lean  → (documentation)
Benchmark/Harvard.lean           → (documentation)
Benchmark/MIT.lean               → (documentation)
Benchmark/OxfordPartC.lean       → (documentation)
Benchmark/Princeton.lean         → (documentation)
```

## Computation Dependencies

```
Computation/CompactnessCheck.lean  → MiniCompactness
Computation/FiniteEnumeration.lean → MiniCompactness
Computation/CoverAlgorithm.lean    → MiniCompactness
```

## Build Order

1. Core/Basic.lean
2. Core/Laws.lean, Morphisms/*, Constructions/*, Properties/*, Examples/*, Bridges/*
3. Core/Objects.lean (depends on Laws)
4. Theorems/* (depends on Products, Laws, ClassificationData, Universal)
5. All test/computation files (depend on MiniCompactness)

All files within layers 2-4 are mutually independent unless noted above.
