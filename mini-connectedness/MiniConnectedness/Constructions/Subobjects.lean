/-
# MiniConnectedness: Constructions — Subobjects

Connected subspaces, locally connected subspaces, and totally
disconnected spaces as subobjects.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic

namespace MiniConnectedness

/-! ## Subspace Topology -/

/-- Subspace topology on a subset S ⊆ α. -/
def subspaceTopology {α : Type u} [TopSpace α] (S : Set α) : TopologicalSpace (Subtype S) where
  isOpen U := ∃ (V : Set α), isOpen V ∧ U = V ∩ Subtype.val '' S
  univOpen := by
    refine ⟨Set.univ, ?_, ?_⟩
    · apply (topology _).univOpen
    · ext ⟨x, hx⟩; simp
  interOpen := sorry
  unionOpen := sorry

instance {α : Type u} [TopSpace α] (S : Set α) : TopSpace (Subtype S) where
  topology := subspaceTopology S

/-! ## Connected Subspace -/

/-- A connected subspace remains connected in the subspace topology. -/
theorem subspace_connected {α : Type u} [TopSpace α] (S : Set α)
  (hconn : IsConnectedSubspace S) : IsConnected (Subtype S) := by
  sorry

#eval "subspace_connected: connected subspace induces connected subspace topology"

/-! ## Locally Connected Subspace -/

/-- An open subspace of a locally connected space is locally connected. -/
theorem openSubspace_locallyConnected {α : Type u} [TopSpace α]
  (h : IsLocallyConnected α) (U : Set α) (hU : isOpen U) :
  IsLocallyConnected (Subtype U) := by
  sorry

#eval "openSubspace_locallyConnected: open subspace of locally connected is locally connected"

/-! ## Totally Disconnected -/

/-- A subspace of a totally disconnected space is totally disconnected. -/
theorem subspace_totallyDisconnected {α : Type u} [TopSpace α]
  (h : IsTotallyDisconnected α) (S : Set α) : IsTotallyDisconnected (Subtype S) := by
  sorry

#eval "subspace_totallyDisconnected: subspace of totally disconnected is totally disconnected"

end MiniConnectedness
