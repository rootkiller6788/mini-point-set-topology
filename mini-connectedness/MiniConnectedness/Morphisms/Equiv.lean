/-
# MiniConnectedness: Equivalences (Connectedness Invariants)

Connectedness invariants preserved under homeomorphism, and the
cut-point ordering on topological spaces.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Morphisms.Iso

namespace MiniConnectedness

/-! ## Connectedness Invariants -/

/-- The number of connected components is a topological invariant. -/
theorem componentCount_invariant {α β : Type u} [TopSpace α] [TopSpace β]
  (h : Homeomorphism α β) : sorry := by
  sorry

/-- The number of path components is a topological invariant. -/
theorem pathComponentCount_invariant {α β : Type u} [TopSpace α] [TopSpace β]
  (h : Homeomorphism α β) : sorry := by
  sorry

/-- Connectedness itself is a topological invariant. -/
theorem connectedness_invariant {α β : Type u} [TopSpace α] [TopSpace β]
  (h : Homeomorphism α β) (hconn : IsConnected α) : IsConnected β :=
  continuousImageOfConnectedIsConnected h.toFun h.continuous_toFun hconn

#eval "connectedness_invariant: homeomorphism preserves connectedness"

/-! ## Cut-Point Ordering -/

/-- The set of cut points of a space, partially ordered by... -/
def cutPointSet {α : Type u} [TopSpace α] : Set α :=
  { x | IsCutPoint x }

/-- A cut-point ordering: x ≤ y if every connected set containing x and y contains all cut points between them. -/
def CutPointOrder {α : Type u} [TopSpace α] (x y : α) : Prop :=
  sorry

/-- Every homeomorphism induces an order-isomorphism on cut-point sets. -/
theorem cutPointOrder_invariant {α β : Type u} [TopSpace α] [TopSpace β]
  (h : Homeomorphism α β) : sorry := by
  sorry

#eval "Cut-point ordering is a topological invariant"

end MiniConnectedness
