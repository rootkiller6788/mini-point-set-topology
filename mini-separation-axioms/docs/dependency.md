# Dependency: mini-separation-axioms

## Internal Dependency Graph

```
Core/Basic
├── Core/Laws
├── Core/Objects
├── Morphisms/Hom
├── Morphisms/Iso
├── Morphisms/Equiv
├── Constructions/Products
├── Constructions/Quotients
├── Constructions/Subobjects
├── Constructions/Universal
├── Properties/Invariants
├── Properties/Preservation
├── Properties/ClassificationData
├── Theorems/Basic
│   ├── Core/Basic
│   └── Core/Laws
├── Theorems/Classification
│   ├── Core/Basic
│   └── Theorems/Basic
├── Theorems/Main
│   ├── Theorems/Basic
│   └── Theorems/Classification
├── Theorems/UniversalProperties
│   ├── Core/Basic
│   └── Constructions/Universal
├── Examples/Standard
│   └── Core/Basic
├── Examples/Counterexamples
│   └── Core/Basic
├── Bridges/ToAlgebra
├── Bridges/ToTopology
├── Bridges/ToGeometry
└── Bridges/ToComputation
```

## External Dependencies

- `mini-object-kernel`: For kernel Object typeclass and theory registration
- `mini-topological-spaces`: For basic topological definitions (TopologicalSpace, IsOpen, IsClosed, etc.)

## Package Size

- Source files: 23 (under MiniSeparationAxioms/)
- Test files: 3
- Benchmark files: 6
- Scripts: 2
- Docs: 3
- Total Lean files: 32
