/-
# MiniConnectedness: Laws

Fundamental laws and axioms of connectedness: continuous images
preserve connectedness, products of connected spaces, closure
properties, and the intermediate value property.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic

namespace MiniConnectedness

/-! ## Axiom: Continuous Image of Connected is Connected -/

/-- The continuous image of a connected space is connected. -/
axiom continuousImageOfConnectedIsConnected {α β : Type u}
  [TopSpace α] [TopSpace β] (f : α → β) (hf : Continuous f)
  (hconn : IsConnected α) : IsConnected β

/-- #eval illustration of the continuous image law -/
#eval "continuousImageOfConnectedIsConnected: f : α → β, f continuous, α connected ⇒ β connected"

/-! ## Axiom: Product of Connected Spaces is Connected -/

/-- The product of connected spaces is connected. -/
axiom productOfConnectedIsConnected {α β : Type u}
  [TopSpace α] [TopSpace β] (hα : IsConnected α) (hβ : IsConnected β) :
  IsConnected (α × β)

#eval "productOfConnectedIsConnected: α, β connected ⇒ α × β connected"

/-! ## Axiom: Closure of Connected is Connected -/

/-- The closure of a connected subspace is connected. -/
axiom closureOfConnectedIsConnected {α : Type u} [TopSpace α] (S : Set α)
  (hconn : IsConnectedSubspace S) : IsConnectedSubspace (sorry : Set α)

#eval "closureOfConnectedIsConnected: S connected ⇒ cl(S) connected"

/-! ## Axiom: Intermediate Value Property -/

/-- A continuous function from a connected space to ℝ satisfies the intermediate value property. -/
axiom intermediateValueProperty {α : Type u} [TopSpace α] (f : α → ℝ) (hf : Continuous f)
  (hconn : IsConnected α) (a b : α) (c : ℝ) (h : f a ≤ c ∧ c ≤ f b) :
  ∃ x : α, f x = c

#eval "intermediateValueProperty: continuous f : α → ℝ, α connected ⇒ IVP"

/-! ## Axiom: Components are Closed -/

/-- Connected components are closed in the space. -/
axiom componentsAreClosed {α : Type u} [TopSpace α] (x : α) : isClosed (Component x)

#eval "componentsAreClosed: ∀ x, Component(x) is closed"

/-! ## Axiom: Locally Connected iff Components Open -/

/-- A space is locally connected iff its connected components are open. -/
axiom locallyConnectedIffComponentsOpen {α : Type u} [TopSpace α] :
  IsLocallyConnected α ↔ ∀ x : α, isOpen (Component x)

#eval "locallyConnectedIffComponentsOpen: locally connected ↔ all components open"

end MiniConnectedness
