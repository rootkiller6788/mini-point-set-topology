# Architecture: mini-separation-axioms

## Module Structure

```
MiniSeparationAxioms/
├── Core/              # Fundamental definitions
│   ├── Basic.lean     # T0, T1, T2, T2.5, T3, T3.5, T4, T5, T6
│   ├── Laws.lean      # Implication chain T6→T5→...→T0
│   └── Objects.lean   # Theory registration with mini-object-kernel
├── Morphisms/         # Structure-preserving maps
│   ├── Hom.lean       # Perfect maps, closed maps
│   ├── Iso.lean       # Homeomorphisms
│   └── Equiv.lean     # Equivalent definitions
├── Constructions/     # Building new spaces
│   ├── Products.lean   # Products preserve Ti (i≤3.5)
│   ├── Quotients.lean  # Quotient counterexamples
│   ├── Subobjects.lean # Subspaces
│   └── Universal.lean  # Stone-Cech, Tychonoff reflection
├── Properties/         # Invariance properties
│   ├── Invariants.lean        # Topological invariance
│   ├── Preservation.lean       # Map preservation table
│   └── ClassificationData.lean # Space database
├── Theorems/           # Main theorems
│   ├── Basic.lean             # Urysohn, Tietze, Metrization
│   ├── Classification.lean    # Ti characterizations
│   ├── Main.lean              # Theorem hub
│   └── UniversalProperties.lean # Tychonoff reflection
├── Examples/           # Standard and counterexamples
│   ├── Standard.lean          # R^n, Fort, cofinite
│   └── Counterexamples.lean   # Tychonoff plank, Moore plane
└── Bridges/            # Connections to other theories
    ├── ToAlgebra.lean        # Topological groups
    ├── ToTopology.lean       # Metrizability, uniform
    ├── ToGeometry.lean       # Manifolds
    └── ToComputation.lean    # Digital topology
```

## Dependencies

```
mini-separation-axioms
├── mini-object-kernel (0. mini-math-kernel)
└── mini-topological-spaces (10. mini-point-set-topology)
```

## Separation Hierarchy

```
T6 (Perfectly Normal) → T5 (Completely Normal) → T4 (Normal)
  → T3.5 (Tychonoff) → T3 (Regular) → T2.5 (Urysohn)
  → T2 (Hausdorff) → T1 (Frechet) → T0 (Kolmogorov)
```

## Key Theorems

1. **Urysohn Lemma**: T4 ⇒ functional separation of disjoint closed sets
2. **Tietze Extension**: T4 ⇒ continuous extension from closed subsets
3. **Urysohn Metrization**: T3 + second countable ⇒ metrizable
4. **Nagata-Smirnov**: T3 + σ-locally finite basis ⇒ metrizable
5. **Bing**: T3 + σ-discrete basis ⇒ metrizable
