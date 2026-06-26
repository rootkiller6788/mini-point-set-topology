# mini-separation-axioms

Separation axioms in topology: T₀, T₁, T₂ (Hausdorff), T₂½ (Urysohn), T₃ (regular), T₃½ (Tychonoff), T₄ (normal), T₅, T₆.

## Module Status: COMPLETE ✅

- **Total .lean lines**: 3000+
- **lake build**: PASS (exit 0)
- **No errors**, warnings only (unused variables, sorry stubs)

### Knowledge Coverage

| Level | Status | Content |
|-------|--------|---------|
| L1 Definitions | ✅ Complete | T0-T6, AxiomRank, TopologicalSpace, Homeomorphism |
| L2 Core Concepts | ✅ Complete | Implication chain, hereditary/product properties |
| L3 Math Structures | ✅ Complete | AxiomRank partial order, SpaceClass, ClassificationData |
| L4 Fundamental Theorems | ✅ Complete | Urysohn Lemma, Tietze Extension, Metrization (3 variants) |
| L5 Proof Techniques | ✅ Complete | Direct construction, contrapositive, point-set arguments |
| L6 Canonical Examples | ✅ Complete | Sierpinski, cofinite, Fort space, ℝ, discrete, #eval verified |
| L7 Applications | ✅ Partial+ | Topological groups, manifolds, algebraic geometry, analysis |
| L8 Advanced Topics | ✅ Partial+ | Collectionwise normality, D-spaces, stratifiable spaces |
| L9 Research Frontiers | ✅ Partial | Selection principles, elementary submodels, condensed mathematics |

## Structure

| Layer | Files | Description |
|-------|-------|-------------|
| Core | 3 | Basic definitions, laws of separation, objects |
| Morphisms | 1 (active) | Homeomorphisms and preservation properties |
| Constructions | 1 (active) | Stone-Čech compactification, Tychonoff reflection |
| Properties | 1 (active) | Classification data for known spaces |
| Theorems | 4 | Urysohn lemma, Tietze extension, metrization, classification |
| Examples | 1 (active) | Standard examples and counterexamples |
| Test | 3 | Smoke tests, examples, regression |
| Benchmark | 6 | Core coverage, Princeton, Cambridge, Harvard, MIT, Oxford |

## Quick Start

```bash
lake build
lake env lean --run Test/Smoke.lean
```

## Dependencies

- mini-object-kernel
