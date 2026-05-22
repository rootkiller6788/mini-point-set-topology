/-
# MiniStoneCechCompactification.Properties.Preservation

Properties preserved by the Stone-Cech compactification:
C*(X) ≅ C(βX), and topological properties of X reflected in βX.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws

open Set

namespace MiniStoneCechCompactification

variable {X : Type u} [TopologicalSpace X] [T35Space X]

/-! ## C*(X) ≅ C(βX) -/

/-- The ring of bounded continuous real-valued functions on X. -/
def boundedContinuousFunctions (X : Type u) [TopologicalSpace X] : Type u :=
  {f : X → ℝ // Continuous f ∧ ∃ M, ∀ x, |f x| ≤ M}

/-- There is an isometric isomorphism C*(X) ≅ C(βX). -/
theorem cstar_iso_stoneCech : Nonempty (boundedContinuousFunctions X ≃⋆ C((stoneCech X).carrier, ℝ)) :=
  sorry

/-- Every bounded continuous f : X → ℝ extends uniquely to βX. -/
theorem bounded_continuous_extension (f : X → ℝ) (hf : Continuous f)
    (hb : ∃ M, ∀ x, |f x| ≤ M) : ∃! g : (stoneCech X).carrier → ℝ, Continuous g ∧ g ∘ (stoneCech X).embedding = f :=
  stoneCech_universal f hf

/-! ## Properties reflected in βX -/

/-- X is pseudocompact iff βX = all compactifications are trivial.
    Equivalently, C*(X) = C(X). -/
theorem pseudocompact_iff_stoneCech_trivial : IsPseudocompact X ↔
    ∀ (c : Compactification X), Surjective c.embedding :=
  sorry

/-- X is compact iff X = βX. -/
theorem compact_iff_eq_stoneCech [T2Space X] : CompactSpace X ↔
    Nonempty (X ≃ₜ (stoneCech X).carrier) :=
  sorry

/-- X is locally compact iff X is open in βX. -/
theorem locallyCompact_iff_open_in_beta : LocallyCompactSpace X ↔
    IsOpen (Set.range ((stoneCech X).embedding : X → (stoneCech X).carrier)) :=
  sorry

/-! ## Cech-completeness -/

/-- A Tychonoff space X is Cech-complete iff X is a G_δ in βX. -/
theorem cechComplete_iff_Gdelta_in_beta : IsCechComplete X ↔
    IsGδ (Set.range ((stoneCech X).embedding : X → (stoneCech X).carrier)) :=
  sorry

/-! ## Realcompactness -/

/-- X is realcompact iff X = υX (the Hewitt realcompactification). -/
theorem realcompact_iff_eq_hewitt : HewittRealcompact X ↔
    Nonempty (X ≃ₜ (hewittRealcompactification X).carrier) :=
  sorry

#eval "C*(X) ≅ C(βX) isometric isomorphism"
#eval "X compact ⇔ X = βX"
#eval "Locally compact ⇔ X open in βX"
