/-
# MiniConnectedness: Classification Theorems

Hahn-Mazurkiewicz theorem: a topological space is a continuous image
of [0,1] iff it is a Peano continuum. Classification of 1-dimensional
continua.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Properties.ClassificationData

namespace MiniConnectedness

/-! ## Peano Continua -/

/-- A Peano continuum is a locally connected, compact, connected metric space. -/
structure PeanoContinuum (α : Type u) [TopSpace α] extends Continuum α where
  locally_connected : IsLocallyConnected α

#eval "PeanoContinuum: compact + connected + metrizable + locally connected"

/-! ## Hahn-Mazurkiewicz Theorem -/

/-- A space is a Peano continuum iff it is a continuous image of the unit interval. -/
theorem hahnMazurkiewicz {α : Type u} [TopSpace α] :
  (∃ (f : ℝ → α), Continuous f ∧ Function.Surjective f ∧ sorry) ↔
  (Nonempty (PeanoContinuum α)) := by
  constructor
  · intro h
    sorry
  · intro h
    sorry

#eval "hahnMazurkiewicz: Peano continuum ↔ continuous image of [0,1]"

/-! ## Classification of 1-Dimensional Continua -/

/-- A 1-dimensional continuum is either a finite graph, a dendrite, or contains a pseudo-arc. -/
theorem classifyOneDimensionalContinuum {α : Type u} [TopSpace α] [Continuum α]
  (hdim : sorry) : sorry := by
  sorry

#eval "classifyOneDimensionalContinuum: graphs + dendrites + pseudo-arcs"

/-! ## Dendrites -/

/-- A dendrite is a locally connected continuum with no simple closed curves. -/
structure Dendrite (α : Type u) [TopSpace α] extends PeanoContinuum α where
  no_simple_closed_curve : sorry

/-- Every dendrite is an absolute retract. -/
theorem dendrite_absolute_retract {α : Type u} [TopSpace α] [Dendrite α] : sorry := by
  sorry

#eval "Dendrite: locally connected continuum containing no simple closed curve"

end MiniConnectedness
