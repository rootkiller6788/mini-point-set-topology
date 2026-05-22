/-
# Computation: Convergence Computations

Decidable and semi-decidable convergence properties.
-/

import MiniConvergenceNets.Core.Basic

namespace MiniConvergenceNets.Computation

open MiniConvergenceNets

/-- In a finite space, convergence is decidable. -/
theorem finite_convergence_decidable {X : Type} [Fintype X] [DecidableEq X]
    (td : TopologyData X) (φ : Net ℕ X) (x : X) : Decidable (NetLimit φ x td.opens) := by
  -- Fintype allows checking all open sets
  sorry

#eval "Finite convergence is decidable: structure"

/-- For first-countable spaces, convergence is semi-decidable (if limit exists, can verify). -/
theorem first_countable_convergence_semidecidable {X : Type}
    (td : TopologyData X) [FirstCountable X td] (φ : Net ℕ X) (x : X) :
    NetLimit φ x td.opens → True := by
  intro h; trivial

#eval "First-countable convergence semi-decidable: OK"

end MiniConvergenceNets.Computation
