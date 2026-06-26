/-
# MiniStoneCechCompactification

Stone-Cech compactification and general compactification theory in point-set topology.
Covers the Stone-Cech compactification βX, one-point compactification, Wallman
compactification, Bohr compactification, Samuel compactification, Freudenthal end
compactification, remainder theory, the Cech-Stone functor, and connections to
C*-algebras, F-spaces, moduli spaces, and computational ultrafilter methods.

## Sub-packages
- `Core`         — Compactification definitions, Stone-Cech βX, one-point, Wallman, Alexandroff, Bohr, Samuel, end, remainder, functor
- `Morphisms`    — Continuous extension, functor β: Tych→CompHaus, equivalent compactifications, complete lattice ordering
- `Constructions` — Products, Glicksberg, quotients, subspaces, β as left adjoint
- `Properties`   — Growth of βN\N, cardinality, weight, cellularity, C*(X) ≅ C(βX), preservation
- `Theorems`     — Existence-uniqueness, Magill classification, Parovicenko, Gelfand-Naimark, Wallman
- `Examples`     — βN, βR, S^n one-point, counterexamples
- `Bridges`      — C*-algebras, corona, F-spaces, moduli spaces, ultrafilter computation
-/

import MiniStoneCechCompactification.Topology.Basic
import MiniStoneCechCompactification.Definitions
import MiniStoneCechCompactification.Theorems
import MiniStoneCechCompactification.Examples
import MiniStoneCechCompactification.Bridges
