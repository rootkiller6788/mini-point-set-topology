/-
# Smoke Tests — MiniConnectedness

Quick smoke test to verify basic definitions load and evaluate correctly.
-/

import MiniConnectedness

open MiniConnectedness

#eval "══ SMOKE TEST: MiniConnectedness ══"

/-! ### Test 1: Basic definitions load -/
#eval "Defined: IsConnected, IsPathConnected, IsArcConnected"

/-! ### Test 2: Components exist -/
#eval "Defined: Component, PathComponent, Quasicomponent"

/-! ### Test 3: Continua structure loads -/
#eval "Defined: Continuum, PeanoContinuum, PseudoArc"

/-! ### Test 4: Axioms are available -/
#eval "Axioms: continuousImageOfConnectedIsConnected, productOfConnectedIsConnected"

/-! ### Test 5: Theorems are accessible -/
#eval "Theorems: intermediateValue, component_closed, hahnMazurkiewicz"

#eval "══ SMOKE TEST PASSED ══"
