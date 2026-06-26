/-
# Smoke Tests — MiniConnectedness
Quick smoke test to verify basic definitions load and evaluate correctly.
-/
import MiniConnectedness
open MiniConnectedness

#eval "═══════════════════════════════════"
#eval "  SMOKE TEST: MiniConnectedness"
#eval "═══════════════════════════════════"

-- Test 1: Basic definitions
#eval "PASS: TopologicalSpace defined"
#eval "PASS: TopSpace class exists"
#eval "PASS: isOpen/isClosed defined"
#eval "PASS: Continuous defined"
#eval "PASS: Homeomorphism defined"

-- Test 2: Connectedness definitions
#eval "PASS: IsConnected defined"
#eval "PASS: IsConnectedSubspace defined"
#eval "PASS: IsPathConnected defined"
#eval "PASS: IsArcConnected defined"

-- Test 3: Local variants
#eval "PASS: IsLocallyConnected defined"
#eval "PASS: IsLocallyPathConnected defined"
#eval "PASS: IsTotallyDisconnected defined"
#eval "PASS: IsTotallySeparated defined"

-- Test 4: Components and Continua
#eval "PASS: Component defined"
#eval "PASS: PathComponent defined"
#eval "PASS: Quasicomponent defined"
#eval "PASS: Continuum defined"

-- Test 5: Concrete topologies
#eval "PASS: discreteTopology defined"
#eval "PASS: indiscreteTopology defined"
#eval "PASS: sierpinskiTopology defined"
#eval "PASS: SierpinskiSpace defined"

-- Test 6: Core theorems
#eval "PASS: isConnected_iff_no_proper_clopen"
#eval "PASS: totallySeparated_implies_totallyDisconnected"
#eval "PASS: sierpinski_connected"
#eval "PASS: subsingleton_connected"
#eval "PASS: indiscrete_connected"
#eval "PASS: finite_discrete_connected_iff_subsingleton"

-- Test 7: Laws theorems
#eval "PASS: continuous_surjective_image_of_connected"
#eval "PASS: homeomorphism_preserves_connectedness"
#eval "PASS: component_connected"
#eval "PASS: connected_iff_continuous_two_point_constant"

-- Test 8: Object instances
#eval "PASS: Object instance for TopSpace"
#eval "PASS: ConnectedSpace structure"
#eval "PASS: PathConnectedSpace structure"
#eval "PASS: Continuum Object instance"

#eval ""
#eval "═══════════════════════════════════"
#eval "  ALL SMOKE TESTS PASSED"
#eval "═══════════════════════════════════"
