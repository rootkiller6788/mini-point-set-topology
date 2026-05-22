/-
# Computation: Filter Computations

Computable filter operations and decidable membership.
-/

import MiniConvergenceNets.Core.Basic

namespace MiniConvergenceNets.Computation

open MiniConvergenceNets

/-- A computable filter: membership is decidable. -/
structure ComputableFilter (X : Type) [DecidableEq X] where
  filter : Filter X
  decMem : ∀ s : Set X, Decidable (s ∈ filter.sets)

/-- Build the computable principal filter at x. -/
def computablePrincipalFilter {X : Type} [DecidableEq X] (x : X) : ComputableFilter X where
  filter := principalFilter x
  decMem s := by
    dsimp [principalFilter]
    infer_instance

#eval "Computable principal filter constructed"

end MiniConvergenceNets.Computation
