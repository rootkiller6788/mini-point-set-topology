# MiniConnectedness: Architecture

## Package Overview

Connectedness theory in point-set topology. Defines 12 fundamental connectedness concepts,
components, continua, and structure theorems in Lean 4.

## Module Structure

```
MiniConnectedness/
├── Core/
│   ├── Basic.lean          -- 12 connectedness definitions + components + continua
│   ├── Objects.lean        -- Object registrations under MiniObjectKernel
│   └── Laws.lean           -- 6 axioms: continuous image, product, closure, IVP, components
├── Morphisms/
│   ├── Hom.lean            -- Monotone/light maps, monotone-light factorization
│   ├── Iso.lean            -- Component-preserving homeo, cut points, endpoints
│   └── Equiv.lean          -- Connectedness invariants, cut-point ordering
├── Constructions/
│   ├── Products.lean       -- Product topology, product preserves connected/path-connected
│   ├── Quotients.lean      -- Quotient topology preserves connectedness, wedge sums
│   ├── Subobjects.lean     -- Subspace topology, connected/locally connected/totally disconnected subspaces
│   └── Universal.lean      -- Totally disconnected reflection, Stone space
├── Properties/
│   ├── Invariants.lean     -- Component/endpoint/cut-point counts as invariants
│   ├── Preservation.lean   -- Which properties are preserved under homeo/continuous/perfect
│   └── ClassificationData.lean -- Indecomposable continua, pseudo-arc, 1-dim classification
├── Theorems/
│   ├── Basic.lean          -- IVT, components closed, locally connected iff components open
│   ├── Classification.lean -- Hahn-Mazurkiewicz, dendrites, 1-dim classification
│   ├── Main.lean           -- Non-cut point, Sierpinski theorems
│   └── UniversalProperties.lean -- Universal connected quotient, irreducible spaces
├── Examples/
│   ├── Standard.lean       -- R, S^n, topologist's sine curve, Cantor set
│   └── Counterexamples.lean -- Connected not path-connected, path components not closed
└── Bridges/
    ├── ToAlgebra.lean      -- Topological groups, Stone spaces, profinite groups
    ├── ToTopology.lean     -- Continua theory, dendrites, nested intersection
    ├── ToGeometry.lean     -- Connected sums, manifold components, Euclidean spaces
    └── ToComputation.lean  -- Graph algorithms, Union-Find, persistent homology
```

## Dependencies

- `mini-object-kernel` — Object typeclass and theory framework
- `mini-topological-spaces` — Topological space definitions (future)

## Key Concepts

| Concept | Status |
|---------|--------|
| Connected | Defined (axiom-based) |
| Path-Connected | Defined |
| Arc-Connected | Defined |
| Locally Connected | Defined |
| Locally Path-Connected | Defined |
| Totally Disconnected | Defined |
| Extremally Disconnected | Defined |
| Zero-Dimensional | Defined |
| Component | Defined |
| Path Component | Defined |
| Quasicomponent | Defined |
| Continuum | Defined (structure) |
