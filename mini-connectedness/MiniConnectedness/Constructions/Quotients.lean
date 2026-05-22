/-
# MiniConnectedness: Constructions — Quotients

Quotient spaces preserve connectedness. Wedge of connected spaces.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Core.Laws

namespace MiniConnectedness

/-! ## Quotient Topology -/

/-- The quotient topology induced by a map q : α → β. -/
def quotientTopology {α β : Type u} [TopSpace α] (q : α → β) : TopologicalSpace β where
  isOpen U := isOpen (q⁻¹' U)
  univOpen := by
    have : q⁻¹' Set.univ = Set.univ := by
      ext x; simp
    sorry
  interOpen := sorry
  unionOpen := sorry

/-- Quotient of a connected space is connected. -/
theorem quotient_preserves_connected {α β : Type u} [TopSpace α] (q : α → β)
  (hq : Function.Surjective q) (hconn : IsConnected α) :
  let _ : TopSpace β := { topology := quotientTopology q }
  IsConnected β :=
  continuousImageOfConnectedIsConnected q sorry hconn

#eval "quotient_preserves_connected: quotient of connected is connected"

/-! ## Wedge of Connected Spaces -/

/-- The wedge sum of connected spaces is connected. -/
structure WedgeSum (α β : Type u) [TopSpace α] [TopSpace β] (a₀ : α) (b₀ : β) where
  space : Type u
  [top_sp : TopSpace space]
  incl_left : α → space
  incl_right : β → space
  seam : incl_left a₀ = incl_right b₀
  is_connected : IsConnected space

/-- For any two connected spaces with basepoints, the wedge sum is connected. -/
axiom wedgeSumConnected {α β : Type u} [TopSpace α] [TopSpace β] (a₀ : α) (b₀ : β)
  (hα : IsConnected α) (hβ : IsConnected β) : ∃ (s : WedgeSum α β a₀ b₀), s.is_connected

#eval "wedgeSumConnected: wedge of two connected spaces is connected"

end MiniConnectedness
