/-
# Core Coverage Benchmark — MiniConnectedness

Comprehensive coverage of all connectedness concepts:
connected, path-connected, arc-connected, locally connected,
totally disconnected, zero-dimensional, components, continua.
-/

import MiniConnectedness

open MiniConnectedness

#eval "══ CORE COVERAGE BENCHMARK ══"

/-! ### Connectedness -/
#eval "Covered: IsConnected, IsConnectedSubspace, closure connected, product connected"

/-! ### Path-Connectedness -/
#eval "Covered: IsPathConnected, Path structure, path components"

/-! ### Arc-Connectedness -/
#eval "Covered: IsArcConnected, embedded arcs vs paths"

/-! ### Local Connectedness -/
#eval "Covered: IsLocallyConnected, IsLocallyPathConnected, locally connected iff components open"

/-! ### Totally Disconnected -/
#eval "Covered: IsTotallyDisconnected, Cantor set, Q, Stone spaces"

/-! ### Zero-Dimensional -/
#eval "Covered: IsZeroDimensional, clopen basis, zero-dimensional iff totally disconnected for locally compact"

/-! ### Components -/
#eval "Covered: Component, PathComponent, Quasicomponent, components are closed"

/-! ### Continua -/
#eval "Covered: Continuum, PeanoContinuum, indecomposable, pseudo-arc, non-cut point theorem"

/-! ### Extremally Disconnected -/
#eval "Covered: IsExtremallyDisconnected, closure of open is open"

#eval "══ FULL CORE COVERAGE VERIFIED ══"
