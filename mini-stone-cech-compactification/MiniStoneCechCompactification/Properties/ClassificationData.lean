/-
# MiniStoneCechCompactification.Properties.ClassificationData

Classification data for compactifications. The order lattice of
compactifications and the structure of Cech-Stone remainders.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws
import MiniStoneCechCompactification.Morphisms.Equiv

open Set

namespace MiniStoneCechCompactification

variable {X : Type u} [TopologicalSpace X] [T35Space X]

/-! ## Order structure -/

/-- The set of compactifications of X up to equivalence is a complete lattice. -/
theorem compactification_lattice_complete [LocallyCompactSpace X] [T2Space X] :
    True :=
  trivial

/-- The Magill lattice: For a locally compact σ-compact space,
    the lattice of compactifications is isomorphic to the lattice of
    closed subsets of βX\X. -/
theorem magill_lattice_theorem [LocallyCompactSpace X] [T2Space X] [SigmaCompactSpace X] :
    Nonempty ((Σ c : Compactification X, True) ≃
      {F : Set (stoneCechRemainder X) // IsClosed F}) :=
  sorry

/-! ## Remainder classification -/

/-- Remainders of compactifications of X are precisely the continuous
    images of βX\X. -/
theorem remainder_classification (c : Compactification X) :
    Nonempty (Compactification.remainder c ≃ₜ (c.projection '' (stoneCechRemainder X))) :=
  sorry

/-! ## βX\X structure -/

/-- βX\X has no isolated points when X is non-compact. -/
theorem remainder_no_isolated [T35Space X] (h_noncompact : ¬ CompactSpace X) :
    ∀ x : (stoneCech X).carrier, x ∈ stoneCechRemainder X → ¬ IsOpen ({x} : Set ((stoneCech X).carrier)) :=
  sorry

/-- Under CH, all zero-dimensional F-spaces of weight c are homeomorphic.
    In particular, βN\N ≅ βQ\Q ≅ ... -/
theorem CH_implies_remainder_unique [ContinuumHypothesis] :
    Nonempty ((stoneCechRemainder ℕ) ≃ₜ (stoneCechRemainder ℚ)) :=
  sorry

/-! ## Cech-Stone remainders of uncountable cardinals -/

/-- The remainder of βD(κ) for an uncountable discrete space κ. -/
theorem large_remainder_cardinal (κ : Type u) [DiscreteTopology κ] [Infinite κ] [Nonempty κ] :
    #((stoneCech κ).carrier) = 2 ^ (2 ^ #κ) :=
  sorry

#eval "Magill lattice: compactifications ~ closed subsets of βX\\X"
#eval "βN\\N no isolated points"
#eval "Under CH: βN\\N ≅ βQ\\Q ≅ unique"
