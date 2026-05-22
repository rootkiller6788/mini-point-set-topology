/-
# Computation: Ultrafilter Computations

Computable aspects of ultrafilter theory.
-/

import MiniConvergenceNets.Core.Basic

namespace MiniConvergenceNets.Computation

open MiniConvergenceNets

/-- A computable ultrafilter on a finite type is simply the principal filter. -/
theorem finite_ultrafilter_computable {X : Type} [Fintype X] [DecidableEq X] :
    ∀ (U : Filter X), IsUltrafilter U → ∃ x : X, U.sets = (principalFilter x).sets := by
  intro U hultra
  -- For finite X, we can check each element
  sorry

#eval "Finite ultrafilters are computable: structure"

/-- On ℕ, non-principal ultrafilters are not computable (no decidable membership). -/
theorem nonprincipal_ultrafilter_not_computable :
    ¬ ∃ (U : Filter ℕ) (dec : ∀ s : Set ℕ, Decidable (s ∈ U.sets)),
      IsUltrafilter U ∧ ¬ ∃ x : ℕ, U.sets = (principalFilter x).sets := by
  sorry

#eval "Non-principal ultrafilters are non-computable: structure"

end MiniConvergenceNets.Computation
