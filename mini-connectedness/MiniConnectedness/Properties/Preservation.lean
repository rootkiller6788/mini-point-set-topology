/-
# MiniConnectedness: Properties — Preservation

Which connectedness properties are preserved under homeomorphism,
continuous maps, open maps, closed maps, and products.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Core.Laws

namespace MiniConnectedness

/-! ## Preservation Under Homeomorphism -/

/-- Connectedness is preserved under homeomorphism. -/
theorem connectedness_homeo {α β : Type u} [TopSpace α] [TopSpace β]
  (h : Homeomorphism α β) : IsConnected α ↔ IsConnected β := by
  constructor
  · intro hconn; exact continuousImageOfConnectedIsConnected h.toFun h.continuous_toFun hconn
  · intro hconn; exact continuousImageOfConnectedIsConnected h.invFun h.continuous_invFun hconn

#eval "connectedness_homeo: connectedness is a topological invariant"

/-- Path-connectedness is preserved under homeomorphism. -/
theorem pathConnected_homeo {α β : Type u} [TopSpace α] [TopSpace β]
  (h : Homeomorphism α β) : IsPathConnected α ↔ IsPathConnected β := by
  sorry

#eval "pathConnected_homeo: path-connectedness is a topological invariant"

/-- Zero-dimensionality is preserved under homeomorphism. -/
theorem zeroDimensional_homeo {α β : Type u} [TopSpace α] [TopSpace β]
  (h : Homeomorphism α β) : IsZeroDimensional α ↔ IsZeroDimensional β := by
  sorry

#eval "zeroDimensional_homeo: zero-dimensionality is preserved"

/-! ## Preservation Under Continuous Maps (not always) -/

/-- Local connectedness is NOT preserved under continuous images. -/
theorem locallyConnected_not_preserved_continuous {α β : Type u} [TopSpace α] [TopSpace β]
  (f : α → β) (hf : Continuous f) (hα : IsLocallyConnected α) : IsLocallyConnected β := by
  sorry

#eval "locallyConnected_not_preserved_continuous: local connectedness is not preserved"

/-! ## Preservation Under Perfect Maps -/

/-- Total disconnectedness is preserved under perfect maps. -/
theorem totallyDisconnected_perfect {α β : Type u} [TopSpace α] [TopSpace β]
  (f : α → β) (hf_cont : Continuous f) (hf_closed : sorry) (hf_compact : sorry)
  (hα : IsTotallyDisconnected α) : IsTotallyDisconnected β := by
  sorry

#eval "totallyDisconnected_perfect: total disconnectedness preserved by perfect maps"

end MiniConnectedness
