/-
# MiniConnectedness: Universal Properties

Universal connected quotient, irreducible connected space, and
the connected component functor as a reflection.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Constructions.Universal

namespace MiniConnectedness

/-! ## Universal Connected Quotient -/

/-- The connected components functor maps each space to its space of components. -/
structure ConnectedQuotient (α : Type u) [TopSpace α] where
  quotSpace : Type u
  [top_quot : TopSpace quotSpace]
  proj : α → quotSpace
  [surj : Function.Surjective proj]
  totally_disconnected : IsTotallyDisconnected quotSpace
  -- The quotient is the totally disconnected reflection

/-- Every space maps to its connected quotient via the component map. -/
def componentQuotient {α : Type u} [TopSpace α] : ConnectedQuotient α where
  quotSpace := Quotient (fun x y => Component x = Component y)
  proj := Quotient.mk _
  totally_disconnected := sorry

#eval "componentQuotient: the space of connected components"

/-! ## Universal Property of the Connected Quotient -/

/-- The connected quotient is universal: any continuous map to a totally
disconnected space factors uniquely through it. -/
theorem connectedQuotient_universal {α β : Type u} [TopSpace α] [TopSpace β]
  (q : ConnectedQuotient α) (hβ : IsTotallyDisconnected β) (f : α → β) (hf : Continuous f) :
  ∃! (g : q.quotSpace → β), Continuous g ∧ ∀ x, g (q.proj x) = f x := by
  sorry

#eval "connectedQuotient_universal: universal property of component quotient"

/-! ## Irreducible Connected Spaces -/

/-- A connected space is irreducible if it cannot be expressed as the union
of two proper closed connected subspaces. -/
def IsIrreducibleConnected {α : Type u} [TopSpace α] : Prop :=
  IsConnected α ∧ ∀ (A B : Set α), isClosed A → isClosed B →
    IsConnectedSubspace A → IsConnectedSubspace B →
    A ∪ B = Set.univ → A = Set.univ ∨ B = Set.univ

/-- Every connected space has an irreducible connected quotient. -/
theorem irreducibleConnectedQuotient {α : Type u} [TopSpace α] (hconn : IsConnected α) :
  ∃ (β : Type u) [TopSpace β] (q : α → β), IsIrreducibleConnected β ∧ Continuous q ∧ Function.Surjective q := by
  sorry

#eval "irreducibleConnectedQuotient: every connected space maps onto an irreducible one"

end MiniConnectedness
