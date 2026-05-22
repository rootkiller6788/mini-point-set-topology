# Dependency Graph: mini-stone-cech-compactification

## Direct Dependencies

```
mini-object-kernel ──────────────┐
mini-topological-spaces ────────┤
mini-compactness ───────────────┼── mini-stone-cech-compactification
mini-separation-axioms ─────────┘
```

## Import Hierarchy

```
MiniStoneCechCompactification (root)
├── Core.Basic (foundation)
│   ├── MiniObjectKernel.Core.Basic
│   ├── MiniTopologicalSpaces.Core.Basic
│   ├── MiniCompactness.Core.Basic
│   └── MiniSeparationAxioms.Core.Basic
├── Core.Laws (→ Core.Basic)
├── Core.Objects (→ Core.Basic)
├── Morphisms.Hom (→ Core.Basic, Core.Laws)
├── Morphisms.Iso (→ Core.Basic, Morphisms.Hom)
├── Morphisms.Equiv (→ Core.Basic, Morphisms.Iso)
├── Constructions.Products (→ Core.Basic, Core.Laws)
├── Constructions.Quotients (→ Core.Basic, Core.Laws)
├── Constructions.Subobjects (→ Core.Basic, Core.Laws)
├── Constructions.Universal (→ Core.Basic, Core.Laws, Morphisms.Hom)
├── Properties.Invariants (→ Core.Basic, Core.Laws)
├── Properties.Preservation (→ Core.Basic, Core.Laws)
├── Properties.ClassificationData (→ Core.Basic, Core.Laws, Morphisms.Equiv)
├── Theorems.Basic (→ Core, Constructions.Universal)
├── Theorems.Classification (→ Core, Properties.ClassificationData)
├── Theorems.Main (→ Core, Theorems.Basic, Properties.Preservation)
├── Theorems.UniversalProperties (→ Core, Constructions.Universal)
├── Examples.Standard (→ Core, Theorems.Basic)
├── Examples.Counterexamples (→ Core, Theorems.Basic)
├── Bridges.ToAlgebra (→ Core, Properties.Preservation)
├── Bridges.ToTopology (→ Core, Properties.Invariants)
├── Bridges.ToGeometry (→ Core, Theorems.Basic)
└── Bridges.ToComputation (→ Core, Properties.Invariants)
```

## Dependency Type

All dependencies are path dependencies referencing sibling or parent packages
in the mini-everything-math repository. No external (GitHub) dependencies.

## Minimal Required Versions

- lakefile: Lake DSL (Lean 4.7.0)
- All required packages use the same lean-toolchain (leanprover/lean4:v4.7.0)
