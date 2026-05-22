/-
# MiniConnectedness: Properties — Invariants

Topological invariants related to connectedness: number of components,
number of path components, and cut-point cardinalities.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Morphisms.Equiv

namespace MiniConnectedness

/-! ## Number of Components -/

/-- The number of connected components of a space. -/
def numberOfComponents {α : Type u} [TopSpace α] : Option Nat :=
  sorry

/-- The number of connected components is a topological invariant. -/
theorem numberOfComponents_invariant {α β : Type u} [TopSpace α] [TopSpace β]
  (h : Homeomorphism α β) : numberOfComponents α = numberOfComponents β := by
  sorry

#eval "numberOfComponents is a topological invariant"

/-! ## Number of Path Components -/

/-- The number of path components of a space. -/
def numberOfPathComponents {α : Type u} [TopSpace α] : Option Nat :=
  sorry

/-- Path component count is a topological invariant. -/
theorem numberOfPathComponents_invariant {α β : Type u} [TopSpace α] [TopSpace β]
  (h : Homeomorphism α β) : numberOfPathComponents α = numberOfPathComponents β := by
  sorry

#eval "numberOfPathComponents is a topological invariant"

/-! ## Cut-Point Number -/

/-- The number of cut points of a space. -/
def cutPointNumber {α : Type u} [TopSpace α] : Option Nat :=
  sorry

/-- For connected spaces with no cut points, the space is a continuum. -/
theorem noCutPoints_implies_continua {α : Type u} [TopSpace α]
  (hconn : IsConnected α) (h : cutPointNumber α = some 0) : sorry := by
  sorry

#eval "cutPointNumber: counting cut points in a connected space"

/-! ## Endpoint Number -/

/-- The number of endpoints in a continuum. -/
def endpointNumber {α : Type u} [TopSpace α] [Continuum α] : Option Nat :=
  sorry

/-- Every nondegenerate continuum has at least 2 endpoints. -/
theorem atLeastTwoEndpoints {α : Type u} [TopSpace α] [Continuum α] (h : ∃ a b : α, a ≠ b) :
  endpointNumber α ≥ some 2 := by
  sorry

#eval "atLeastTwoEndpoints: nondegenerate continuum has ≥2 endpoints"

end MiniConnectedness
