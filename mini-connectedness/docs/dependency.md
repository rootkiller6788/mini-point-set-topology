# MiniConnectedness: Dependency Graph

## Upstream Dependencies

```
mini-object-kernel (version: matching)
  └── MiniObjectKernel.Core.Basic (TheoryName, Object typeclass)

mini-topological-spaces (future)
  └── (TopologicalSpace definitions — currently defined locally in MiniConnectedness.Core.Basic)
```

## Internal Dependency Graph

```
Core.Basic ─────────────────────┐
  ↓                             │
Core.Objects ← Core.Basic       │
  ↓                             │
Core.Laws ← Core.Basic + Objects│
  ↓                             │
Morphisms/Hom ← Core.Basic      │
Morphisms/Iso ← Core.Basic + Hom│
Morphisms/Equiv ← Core + Iso    │
  ↓                             │
Constructions/Products ← Core + Laws
Constructions/Quotients ← Core + Laws
Constructions/Subobjects ← Core.Basic
Constructions/Universal ← Core + Quotients
  ↓
Properties/Invariants ← Core + Equiv
Properties/Preservation ← Core + Laws
Properties/ClassificationData ← Core.Basic
  ↓
Theorems/Basic ← Core + Laws
Theorems/Classification ← Core + ClassificationData
Theorems/Main ← Core + Iso + Invariants
Theorems/UniversalProperties ← Core + Universal
  ↓
Examples/Standard ← Core + Laws + Theorems/Basic
Examples/Counterexamples ← Core + Standard
  ↓
Bridges/ToAlgebra ← Core + Universal
Bridges/ToTopology ← Core + ClassificationData + Theorems/Main
Bridges/ToGeometry ← Core + Products
Bridges/ToComputation ← Core.Basic
```

## Re-export (MiniConnectedness.lean)

All 23 modules are re-exported via the top-level `MiniConnectedness` import.
