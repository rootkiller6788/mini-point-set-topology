# mini-topological-constructions -- Architecture

## Overview

Defines all fundamental topological constructions: product topology, quotient
topology, wedge sum, smash product, join, cone, suspension, mapping cylinder,
mapping cone, telescope, direct/inverse limits, and sequential colimits.

## Dependency Graph

```
mini-object-kernel (Object typeclass)
        ↓
mini-topological-spaces (TopSpace, continuity)
        ↓
mini-topological-constructions (this package)
```

## Module Map

```
MiniTopologicalConstructions/
├── Core/
│   ├── Basic.lean              -- 16 construction types (Product, Box, Quotient,
│   │                               Adjunction, Wedge, Smash, Join, Cone, Suspension,
│   │                               ReducedSuspension, MappingCylinder, MappingCone,
│   │                               Telescope, DirectLimit, InverseLimit, SequentialColimit)
│   ├── Objects.lean            -- Object instances for all constructions
│   └── Laws.lean               -- 15 axiom values (cone/suspension, join, smash, etc.)
├── Morphisms/
│   ├── Hom.lean                -- ConstructionMap, Cofibration (HEP), Fibration (HLP)
│   ├── Iso.lean                -- ConstructionHomeo, natural isomorphisms
│   └── Equiv.lean              -- Homotopy, HomotopyEquivalence
├── Constructions/
│   ├── Products.lean           -- Box vs product, equalizer, coequalizer
│   ├── Quotients.lean          -- Group actions, orbit spaces, homogeneous spaces
│   ├── Subobjects.lean         -- Colimits, pushout/pullback squares
│   └── Universal.lean          -- Limits/colimits, Top complete and cocomplete
├── Properties/
│   ├── Invariants.lean         -- Homology, cohomology, fundamental group
│   ├── Preservation.lean       -- Homotopy type, connectedness, compactness
│   └── ClassificationData.lean -- Cofibration/fibration classification, model structures
├── Theorems/
│   ├── Basic.lean              -- ΣS^n≅S^{n+1}, CX contractible, M_f≃Y, Puppe
│   ├── Classification.lean     -- Cofibration=NDR, Hurewicz/Serre, factorization
│   ├── Main.lean               -- Freudenthal, stable homotopy, Blakers-Massey
│   └── UniversalProperties.lean -- Pushout/pullback/limit/colimit universals
├── Examples/
│   ├── Standard.lean           -- ΣS¹≅S², C(S¹)≅D², wedge, smash, join
│   └── Counterexamples.lean    -- Box topology on R^ω, sequential colimits
└── Bridges/
    ├── ToAlgebra.lean          -- Free topological groups, group actions
    ├── ToTopology.lean         -- Homotopy theory, model categories, spectra
    ├── ToGeometry.lean         -- Surgery, cobordism, geometric realization
    └── ToComputation.lean      -- Finite spaces, simplicial complexes, Morse theory
```
