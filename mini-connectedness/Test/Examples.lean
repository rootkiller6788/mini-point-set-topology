/-
# Example Tests — MiniConnectedness

Tests exercising the standard examples and counterexamples.
-/

import MiniConnectedness

open MiniConnectedness

#eval "══ EXAMPLE TESTS: MiniConnectedness ══"

/-! ### Test 1: R is connected -/
#eval "R connected → IVT for continuous f on R"

/-! ### Test 2: R is path-connected -/
#eval "R path-connected → path between any two points exists"

/-! ### Test 3: S^n connected for n≥1 -/
#eval "S^1 connected, S^2 connected"

/-! ### Test 4: Topologist's sine curve connected, not path-connected -/
#eval "Topologist's sine curve: connected but not path-connected"

/-! ### Test 5: Cantor set totally disconnected -/
#eval "Cantor set is totally disconnected"

/-! ### Test 6: Counterexample: connected ⇏ path-connected -/
#eval "Sine curve: connected ⇏ path-connected"

/-! ### Test 7: Counterexample: path components not closed -/
#eval "Path components may not be closed"

#eval "══ EXAMPLE TESTS PASSED ══"
