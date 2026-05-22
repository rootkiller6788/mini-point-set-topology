# mini-separation-axioms

Separation axioms in topology: T₀, T₁, T₂ (Hausdorff), T₃ (regular), T₃½ (Tychonoff), T₄ (normal), and T₅.

## Structure

| Layer | Files | Description |
|-------|-------|-------------|
| Core | 3 | Basic definitions, laws of separation, objects |
| Morphisms | 3 | Continuous maps preserving separation, embeddings, equivalences |
| Constructions | 4 | Subspaces, products, quotients, universal constructions |
| Properties | 3 | Invariants, preservation under operations, classification data |
| Theorems | 4 | Urysohn lemma, Tietze extension, metrization theorems |
| Examples | 2 | Standard examples (metric spaces are T₄, etc.), counterexamples |
| Bridges | 4 | Algebra (topological groups), topology, geometry, computation |
| Computation | 6 | Python/notebook/sage tools for checking separation properties |
| Test | 3 | Smoke tests, examples, regression |
| Benchmark | 6 | Core coverage, Princeton, Cambridge, Harvard, MIT, Oxford |

## Quick Start

```bash
lake build
lake env lean --run Test/Smoke.lean
```

## Dependencies

- mini-object-kernel
- mini-topological-spaces
