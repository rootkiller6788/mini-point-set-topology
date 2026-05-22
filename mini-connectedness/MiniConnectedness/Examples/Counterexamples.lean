/-
# MiniConnectedness: Counterexamples

Counterexamples illustrating boundaries of connectedness concepts:
connected but not path-connected, path components not closed,
and locally connected but not connected.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Examples.Standard

namespace MiniConnectedness

/-! ## Connected but Not Path-Connected -/

/-- The topologist's sine curve is the classic example: connected, but
there is no path from a point on the vertical segment to a point on the curve. -/
theorem sineCurve_connected_not_pathConnected :
  ∃ (α : Type) [TopSpace α], IsConnected α ∧ ¬ IsPathConnected α := by
  sorry

#eval "Sine curve: connected ⇏ path-connected"

/-! ## Path Components Not Closed -/

/-- In the topologist's sine curve, the path component of a point on the
vertical segment is not closed. -/
theorem pathComponents_not_closed :
  ∃ (α : Type) [TopSpace α] (x : α), ¬ isClosed (PathComponent x) := by
  sorry

#eval "Path components need not be closed"

/-! ## Locally Connected but Not Connected -/

/-- The disjoint union of two open intervals is locally connected but not connected. -/
theorem locallyConnected_not_connected :
  ∃ (α : Type) [TopSpace α], IsLocallyConnected α ∧ ¬ IsConnected α := by
  sorry

#eval "Locally connected does not imply connected: disjoint union of two intervals"

/-! ## Connected but Not Locally Connected -/

/-- The topologist's sine curve is connected but not locally connected
(at points on the vertical segment). -/
theorem connected_not_locallyConnected :
  ∃ (α : Type) [TopSpace α], IsConnected α ∧ ¬ IsLocallyConnected α := by
  sorry

#eval "Connected does not imply locally connected"

end MiniConnectedness
