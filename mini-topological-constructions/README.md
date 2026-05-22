# mini-topological-constructions

Topological constructions sub-package for the mini-everything-math ecosystem.

## Overview

Defines all fundamental topological constructions as Lean 4 types:
- Product topology (general/arbitrary products)
- Box topology
- Quotient topology
- Adjunction space (pushout X union_f Y)
- Wedge sum (X vee Y)
- Smash product (X wedge Y)
- Join (X * Y)
- Cone (CX)
- Suspension (Sigma X), reduced suspension
- Mapping cylinder (M_f), mapping cone (C_f)
- Telescope, direct limit, inverse limit, sequential colimit

## Structure

- `MiniTopologicalConstructions/Core/` -- 16 construction types, Object instances, laws
- `MiniTopologicalConstructions/Morphisms/` -- ConstructionMap, cofibration, fibration, homotopy
- `MiniTopologicalConstructions/Constructions/` -- Box vs product, group actions, limits/colimits
- `MiniTopologicalConstructions/Properties/` -- Homology/cohomology, preservation, classification
- `MiniTopologicalConstructions/Theorems/` -- Sigma S^n ~= S^{n+1}, Freudenthal, universal properties
- `MiniTopologicalConstructions/Examples/` -- Standard examples and counterexamples
- `MiniTopologicalConstructions/Bridges/` -- ToAlgebra, ToTopology, ToGeometry, ToComputation

## Usage

```
import MiniTopologicalConstructions
```

## Build

```bash
lake build
```
