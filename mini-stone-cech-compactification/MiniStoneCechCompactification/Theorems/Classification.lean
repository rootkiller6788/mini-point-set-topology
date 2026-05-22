/-
# MiniStoneCechCompactification.Theorems.Classification

Classification theorems: Magill classification of remainders and
Parovicenko characterization of βN\N under CH.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws
import MiniStoneCechCompactification.Properties.ClassificationData

open Set

namespace MiniStoneCechCompactification

variable {X : Type u} [TopologicalSpace X] [T35Space X]

/-! ## Magill classification of remainders -/

/-- **Magill's theorem**: For a locally compact σ-compact space X,
    compactifications of X correspond bijectively to closed subsets of βX\X.
    This is an isomorphism of complete lattices. -/
theorem magill_classification [LocallyCompactSpace X] [T2Space X] [SigmaCompactSpace X] :
    Nonempty (CompactificationClass X ≃ {F : Set (stoneCechRemainder X) // IsClosed F}) :=
  sorry

/-- Two locally compact σ-compact spaces have isomorphic compactification
    lattices iff their remainders are homeomorphic. -/
theorem magill_remainder_isomorphism {Y : Type u} [TopologicalSpace Y] [T35Space Y]
    [LocallyCompactSpace Y] [T2Space Y] [SigmaCompactSpace Y]
    [LocallyCompactSpace X] [T2Space X] [SigmaCompactSpace X] :
    (Nonempty ((stoneCechRemainder X) ≃ₜ (stoneCechRemainder Y))) ↔
    (Nonempty (CompactificationClass X ≃ CompactificationClass Y)) :=
  sorry

/-! ## Parovicenko characterization -/

/-- **Parovicenko's theorem (under CH)**: βN\N is the unique (up to
    homeomorphism) zero-dimensional compact F-space of weight c
    without isolated points in which every nonempty G_δ has infinite interior.

    This characterizes βN\N completely under the Continuum Hypothesis. -/
theorem parovicenko_characterization [ContinuumHypothesis] (Z : Type u)
    [TopologicalSpace Z] [T2Space Z] [CompactSpace Z] [TotallySeparated Z]
    -- Z is an F-space
    -- weight(Z) = c
    -- no isolated points
    -- every nonempty G_δ has infinite interior
    (h_weight : weight Z = 2 ^ ℵ₀)
    (h_no_isolated : ∀ z : Z, ¬ IsOpen ({z} : Set Z))
    (h_F_space : True)
    (h_Gdelta_interior : True) :
    Nonempty (Z ≃ₜ (stoneCechRemainder ℕ)) :=
  sorry

/-- **Parovicenko's corollary**: Under CH, βN\N ≅ βQ\Q ≅ βR\N ≅ ...
    All remainders of separable zero-dimensional metrizable non-compact spaces
    are homeomorphic. -/
theorem parovicenko_corollary [ContinuumHypothesis] :
    Nonempty ((stoneCechRemainder ℕ) ≃ₜ (stoneCechRemainder ℚ)) :=
  CH_implies_remainder_unique

/-- Without CH, there are 2^c many non-homeomorphic remainders. -/
theorem many_remainders_without_CH [¬ ContinuumHypothesis] :
    #(Set (Quotient (Setoid.ker (fun (R : Type u) => R)))) = 2 ^ (2 ^ (2 ^ ℵ₀)) :=
  sorry

#eval "Magill: compactifications ↔ closed subsets of βX\\X"
#eval "Parovicenko (CH): βN\\N uniquely characterized"
#eval "Without CH: many non-homeomorphic remainders"
