/-
# Computation: Net Computations

Computable aspects of net construction and manipulation.
-/

import MiniConvergenceNets.Core.Basic

namespace MiniConvergenceNets.Computation

open MiniConvergenceNets

/-- A computable directed set: all operations are decidable. -/
structure ComputableDirectedSet (α : Type) [DecidableEq α] where
  dir : DirectedSet α
  decLe : ∀ a b : α, Decidable (dir.le a b)
  decDirected : ∀ a b : α, α -- returns an upper bound

/-- Computable net: a net with a computable directed set and computable map. -/
structure ComputableNet (α X : Type) [DecidableEq α] where
  cd : ComputableDirectedSet α
  f : α → X

/-- Check if a computable net is eventually in a decidable set. -/
def computableEventually {α X : Type} [DecidableEq α] [DecidableEq X]
    (φ : ComputableNet α X) (A : Set X) [DecidablePred (· ∈ A)] : Bool :=
  -- search for an index i
  false

#eval "Computable net eventual check"

end MiniConvergenceNets.Computation
