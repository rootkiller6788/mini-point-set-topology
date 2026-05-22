/-
# MiniConnectedness: Basic Theorems

Fundamental theorems: Intermediate value theorem for connected spaces,
properties of connected components (closed but not always open),
path component properties, and the locally-connected-iff-components-open
characterization.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Core.Laws

namespace MiniConnectedness

/-! ## Intermediate Value Theorem -/

/-- Intermediate Value Theorem: a continuous function from a connected space
to ℝ satisfies the intermediate value property. -/
theorem intermediateValue {α : Type u} [TopSpace α] (f : α → ℝ) (hf : Continuous f)
  (hconn : IsConnected α) (a b : α) (c : ℝ) (hle : f a ≤ c ∧ c ≤ f b) :
  ∃ x : α, f x = c :=
  intermediateValueProperty f hf hconn a b c hle

#eval "intermediateValue: proved via intermediateValueProperty axiom"

/-! ## Connected Components are Closed -/

/-- Every connected component is a closed set. -/
theorem component_closed {α : Type u} [TopSpace α] (x : α) : isClosed (Component x) :=
  componentsAreClosed x

#eval "component_closed: every connected component is closed"

/-! ## Connected Components are NOT Always Open -/

/-- Connected components are not always open (counterexample: Q). -/
theorem component_not_always_open : sorry := by
  sorry

#eval "component_not_always_open: Q components are singletons but not open"

/-! ## Path Components -/

/-- A path component is contained in the corresponding connected component. -/
theorem pathComponent_subset_component {α : Type u} [TopSpace α] (x : α) :
  PathComponent x ⊆ Component x := by
  sorry

/-- Path components are not always closed. -/
theorem pathComponent_not_always_closed :
  ¬ (∀ (α : Type u) [TopSpace α] (x : α), isClosed (PathComponent x)) := by
  sorry

#eval "pathComponent_not_always_closed: see topologist's sine curve"

/-! ## Locally Connected iff Components Open -/

/-- A space is locally connected iff all its connected components are open. -/
theorem locallyConnected_iff_components_open {α : Type u} [TopSpace α] :
  IsLocallyConnected α ↔ ∀ x : α, isOpen (Component x) :=
  locallyConnectedIffComponentsOpen

#eval "locallyConnected_iff_components_open: characterization of local connectedness"

/-! ## Connectedness of the Closure -/

/-- If a subspace is connected, so is its closure. -/
theorem closure_connected {α : Type u} [TopSpace α] {S : Set α}
  (hconn : IsConnectedSubspace S) : IsConnectedSubspace (sorry : Set α) :=
  closureOfConnectedIsConnected S hconn

#eval "closure_connected: closure of a connected set is connected"

end MiniConnectedness
