# MiniConnectedness: Coverage Map

## Topological Connectedness Concepts

| Concept | Defined | Theorems | Examples | Bridges |
|---------|---------|----------|----------|---------|
| Connected | Yes | IVT, product, closure, quotient | R, S^n | Geometry, Algebra |
| Path-Connected | Yes | Product preserves | R | Geometry |
| Arc-Connected | Yes | — | — | — |
| Locally Connected | Yes | iff components open | Standard | Topology |
| Locally Path-Connected | Yes | — | — | — |
| Totally Disconnected | Yes | Subspace preserved | Cantor set, Q | Algebra (Stone) |
| Extremally Disconnected | Yes | — | — | — |
| Zero-Dimensional | Yes | Homeo invariant | Cantor set | Algebra |
| Component | Yes | Closed, not always open | — | — |
| Path Component | Yes | ⊆ Component, not always closed | Sine curve | — |
| Quasicomponent | Yes | = Component in compact Hausdorff | — | — |
| Continuum | Yes | Non-cut point, Sierpinski | — | Topology, Bridge |

## Axioms (Laws.lean)

1. Continuous image of connected is connected
2. Product of connected is connected
3. Closure of connected is connected
4. Intermediate Value Property
5. Components are closed
6. Locally connected iff components open

## Theorems Status

| Theorem | Status |
|---------|--------|
| Intermediate Value Theorem | Proved (from axiom) |
| Components closed | Proved (from axiom) |
| Locally connected iff components open | Proved (from axiom) |
| Closure of connected is connected | Proved (from axiom) |
| Non-cut point theorem | sorry |
| Sierpinski theorem | sorry |
| Hahn-Mazurkiewicz | sorry |
| Product preserves connected | Proved (from axiom) |
| Quotient preserves connected | Proved (from axiom) |
| Universal property of connected quotient | sorry |
| Stone representation | sorry |
