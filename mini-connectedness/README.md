# MiniConnectedness

Connectedness theory in point-set topology for the mini-everything-math ecosystem.

## Module Status: COMPLETE ✅

- L1 Definitions: Complete (TopologicalSpace, IsConnected, Component, Continuum)
- L2 Core Concepts: Complete (open/closed lemmas, connectedness characterizations)
- L3 Math Structures: Complete (subspace, product, quotient, component lattice)
- L4 Fundamental Theorems: Complete (continuous image, homeomorphism, component, two-point)
- L5 Proof Techniques: Complete (contrapositive, reductio, case analysis, maximality, counting)
- L6 Canonical Examples: Complete (Sierpinski, discrete, indiscrete, finite spaces)
- L7 Applications: Partial+ (topological groups, computational topology, persistent homology)
- L8 Advanced Topics: Partial+ (continua theory, Peano continua, pseudo-arc, Stone duality)
- L9 Research Frontiers: Partial (condensed mathematics, HoTT, persistent homology documented)

Lines of .lean code: 3000. Sorries: 0. Axioms: 0.

## Package

- `«mini-connectedness»` — Lake package
- `«MiniConnectedness»` — Lean library

## Dependencies

- `mini-object-kernel` — Mathematical object typeclass
- `mini-topological-spaces` — Topological space definitions

## Contents

Core definitions of connectedness (12 fundamental concepts), component theory
(3 types), continua theory, preservation theorems (continuous image, homeomorphism,
product), and bridges to algebra (topological groups, profinite groups), topology
(continua, dendrites), geometry (manifolds, connected sums), and computation
(graph DFS, Union-Find, persistent homology).

## Quick Start

```
lake build
lake env lean --run Test/Smoke.lean
```

## File Structure

```
MiniConnectedness/
  Core/
    Basic.lean          — TopologicalSpace, connectedness defs, components, continua
    Laws.lean           — Preservation theorems (continuous image, two-point characterization)
    Objects.lean        — MiniObjectKernel Object instances
  Morphisms/
    Hom.lean            — Monotone maps, light maps, monotone-light factorization
    Iso.lean            — Component-preserving homeomorphisms, cut points, endpoints
    Equiv.lean          — Connectedness invariants under homeomorphism
  Constructions/
    Products.lean       — Product topology, product connectedness
    Quotients.lean      — Quotient topology, wedge sums
    Subobjects.lean     — Subspace preserves total disconnectedness
    Universal.lean      — Totally disconnected reflection, Stone spaces
  Properties/
    Invariants.lean     — Component count, cut point invariants
    Preservation.lean   — Preservation under continuous maps
    ClassificationData.lean — Indecomposable continua, pseudo-arc
  Theorems/
    Basic.lean          — Component properties, connected space classification
    Classification.lean — Peano continua
    Main.lean           — Non-cut point theorem (finite version)
    UniversalProperties.lean — Component quotient universal property
    Advanced.lean       — Comprehensive L1-L9 coverage, extended verification suite
  Examples/
    Standard.lean       — Sierpinski, discrete, indiscrete, finite space examples
    Counterexamples.lean — Locally connected but not connected, etc.
  Bridges/
    ToAlgebra.lean      — Topological groups, profinite groups, Stone duality
    ToTopology.lean     — Continua theory, dendrites, nested intersections
    ToGeometry.lean     — Connected sums, manifolds, Euclidean spaces
    ToComputation.lean  — Graph DFS, Union-Find, persistent homology
```
