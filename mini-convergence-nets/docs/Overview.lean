/-
# MiniConvergenceNets: Documentation Overview

## Package Structure

```
MiniConvergenceNets/
├── Core/
│   ├── Basic.lean          — DirectedSet, Net, Filter, Ultrafilter, convergence
│   ├── Laws.lean           — Uniqueness of limits, compactness characterizations
│   └── Objects.lean        — ConvergenceSpace, LimitSpace, KentConvergenceSpace
├── Morphisms/
│   ├── Hom.lean            — Convergence-preserving maps
│   ├── Iso.lean            — Isomorphisms of convergence structures
│   └── Equiv.lean          — Net↔Filter equivalence
├── Constructions/
│   ├── Products.lean       — Product nets/filters, Tychonoff
│   ├── Quotients.lean      — Quotient convergence
│   ├── Subobjects.lean     — Subnet, subspace convergence
│   └── Universal.lean      — Universal nets, ultrafilters, Stone-Čech
├── Properties/
│   ├── Invariants.lean     — Cardinal invariants (sequentialOrder, tightness, character)
│   ├── Preservation.lean   — Preservation theorems
│   └── ClassificationData.lean — Classification hierarchy
├── Theorems/
│   ├── Basic.lean          — Compact ↔ ultrafilter, Tychonoff, sequential compactness
│   ├── Classification.lean — Classification of convergence spaces
│   ├── Main.lean           — Main theorems: Tychonoff, compactness, Hausdorff, continuity
│   └── UniversalProperties.lean — Stone duality, Wallman compactification
├── Examples/
│   ├── Standard.lean       — Sequences, neighborhood filter, Fréchet filter
│   └── Counterexamples.lean — Arens-Fort, ω₁, non-constructive ultrafilters
└── Bridges/
    ├── ToAlgebra.lean      — BPI, Stone duality
    ├── ToTopology.lean     — Convergence foundations
    ├── ToGeometry.lean     — Riemann sums as net limits
    └── ToComputation.lean  — Domain theory, computable convergence
```

## Key Concepts

1. **Net**: A function from a directed set to X—generalizes sequences to arbitrary index sets.
2. **Filter**: A nonempty collection of nonempty sets closed under supersets and finite intersections.
3. **Ultrafilter**: A maximal filter—for every set A, contains A or its complement.
4. **Convergence**: NetLimit (x_α → x) and FilterConvergence are equivalent descriptions.
5. **Compactness**: Equivalent to "every ultrafilter converges" — the key to Tychonoff's theorem.

## Main Theorems

- Net↔Filter equivalence (convergence is unified)
- Compact ↔ every net has a cluster point ↔ every ultrafilter converges
- Tychonoff's theorem via ultrafilters (elegant proof)
- Hausdorff ↔ unique net limits
- Continuous ↔ preserves net convergence
- Stone-Čech compactification via ultrafilters
-/

#eval "Documentation overview available"
