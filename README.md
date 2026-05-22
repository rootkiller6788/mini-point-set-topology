# Mini Point-Set Topology

A collection of **from-scratch Lean 4 implementations** of university-level point-set topology, separation axioms, and compactifications. Each sub-package maps to MIT and other top-tier university courses, building foundations from first principles using the Lean 4 proof assistant and kernel libraries.

## Sub-Packages

| Sub-Package | Topics | Key Courses |
|---|---|---|
| [mini-topological-spaces](mini-topological-spaces/) | Topological spaces, open/closed sets, interior, closure, boundary | MIT 18.901, Harvard Math 131 |
| [mini-continuity-homeomorphism](mini-continuity-homeomorphism/) | Continuous maps, homeomorphisms, quotient maps, embeddings | MIT 18.901, Berkeley Math 142 |
| [mini-compactness](mini-compactness/) | Compact spaces, Tychonoff theorem, locally compact, one-point compactification | MIT 18.901, Princeton MAT 335 |
| [mini-connectedness](mini-connectedness/) | Connected, path-connected, components, locally connected spaces | MIT 18.901, Cambridge Part II |
| [mini-separation-axioms](mini-separation-axioms/) | T0-T6 axioms, Urysohn lemma, Tietze extension, metrization | MIT 18.902, Harvard Math 131 |
| [mini-convergence-nets](mini-convergence-nets/) | Nets, filters, ultrafilters, convergence, compactness via nets | MIT 18.902, Oxford Part C |
| [mini-stone-cech-compactification](mini-stone-cech-compactification/) | Stone-Cech compactification, Wallman compactification, universal property | MIT 18.902, Cambridge Part III |
| [mini-topological-constructions](mini-topological-constructions/) | Product topology, quotient topology, subspace topology, direct limits | MIT 18.901, Berkeley Math 142 |

## Design Philosophy

- **Zero external dependencies** -- pure Lean 4, only kernel + sibling imports
- **Self-contained sub-packages** -- `lakefile.lean`, Core/, Morphisms/, Constructions/, Theorems/
- **Theory-to-code mapping** -- inline `#eval` examples and theorem statements

## Building

```bash
cd sub-package-name
lake build
lake env lean --run Test/Smoke.lean
```

Requires **Lean 4** and **Lake**.

## License

MIT
