/-
# MiniConnectedness: Constructions — Products

Product of connected/path-connected spaces and box product
constructions.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Core.Laws

namespace MiniConnectedness

/-! ## Product Topology -/

/-- Product topology on α × β. -/
def productTopology {α β : Type u} [TopSpace α] [TopSpace β] : TopologicalSpace (α × β) where
  isOpen W := sorry
  univOpen := sorry
  interOpen := sorry
  unionOpen := sorry

instance {α β : Type u} [TopSpace α] [TopSpace β] : TopSpace (α × β) where
  topology := productTopology

/-! ## Product Preserves Connectedness -/

/-- The product of two connected spaces is connected. -/
theorem product_connected {α β : Type u} [TopSpace α] [TopSpace β]
  (hα : IsConnected α) (hβ : IsConnected β) : IsConnected (α × β) :=
  productOfConnectedIsConnected hα hβ

#eval "product_connected: α connected ∧ β connected ⇒ α × β connected"

/-! ## Product Preserves Path-Connectedness -/

/-- The product of two path-connected spaces is path-connected. -/
theorem product_pathConnected {α β : Type u} [TopSpace α] [TopSpace β]
  (hα : IsPathConnected α) (hβ : IsPathConnected β) : IsPathConnected (α × β) := by
  sorry

#eval "product_pathConnected: α path-connected ∧ β path-connected ⇒ α × β path-connected"

/-! ## Box Product -/

/-- Box product topology (for infinite products). -/
def boxProductTopology {ι : Type u} (α : ι → Type u) [∀ i, TopSpace (α i)] :
  TopologicalSpace (∀ i, α i) where
  isOpen U := sorry
  univOpen := sorry
  interOpen := sorry
  unionOpen := sorry

/-- The box product of connected spaces need not be connected. -/
theorem boxProduct_not_always_connected {ι : Type u} (α : ι → Type u) [∀ i, TopSpace (α i)]
  [∀ i, IsConnected (α i)] : sorry := by
  sorry

#eval "Box product: infinite box product of connected spaces may not be connected"

end MiniConnectedness
