/-
# MiniStoneCechCompactification.Bridges.ToTopology

Bridge to general topology: corona, remainders, F-spaces.
The corona of a space, the relationship between βX and
various topological properties.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws
import MiniStoneCechCompactification.Properties.Invariants

open Set

namespace MiniStoneCechCompactification

variable (X : Type u) [TopologicalSpace X] [T35Space X]

/-! ## Corona -/

/-- The corona of X is βX \ X (the Stone-Cech remainder). -/
def corona (X : Type u) [TopologicalSpace X] [T35Space X] : Set ((stoneCech X).carrier) :=
  stoneCechRemainder X

/-- The corona is a compact Hausdorff space (closed subset of βX). -/
theorem corona_compact_Hausdorff : IsCompact (corona X) ∧ IsClosed (corona X) :=
  sorry

/-- The corona of N is the space of nonprincipal ultrafilters on N. -/
theorem corona_N_nonprincipal : corona ℕ = {u : Ultrafilter ℕ | ¬ IsPrincipal u} :=
  sorry

/-! ## F-spaces -/

/-- An F-space is a Tychonoff space in which disjoint open F_σ sets
    have disjoint closures. βN\N is a compact F-space. -/
structure IsFSpace (Y : Type u) [TopologicalSpace Y] : Prop where
  fspace_property : ∀ (U V : Set Y), IsOpen U → IsOpen V →
    IsFσ U → IsFσ V → U ∩ V = ∅ → closure U ∩ closure V = ∅

/-- βN\N is an F-space. -/
theorem corona_N_is_FSpace : IsFSpace (corona ℕ) :=
  sorry

/-- Every extremally disconnected space is an F-space. -/
theorem extremallyDisconnected_is_FSpace {Y : Type u} [TopologicalSpace Y]
    (h : ExtremallyDisconnected Y) : IsFSpace Y :=
  sorry

/-! ## Corona of R -/

/-- The corona of R (βR\R) has a rich structure: it is not extremally
    disconnected and contains many distinct types of points. -/
theorem corona_R_not_extremally_disconnected : ¬ ExtremallyDisconnected (corona ℝ) :=
  sorry

/-- |βR\R| = 2^c. -/
theorem corona_R_cardinality : #(corona ℝ) = 2 ^ (2 ^ ℵ₀) :=
  sorry

/-! ## Relation to other compactifications -/

/-- Every continuous image of βX\X is the remainder of some compactification. -/
theorem remainder_is_continuous_image [LocallyCompactSpace X] [T2Space X]
    (K : Type u) [TopologicalSpace K] [T2Space K] [CompactSpace K]
    (f : corona X → K) (hf : Continuous f) (hf_surj : Surjective f) :
    ∃ (c : Compactification X), Nonempty (Compactification.remainder c ≃ₜ K) :=
  sorry

/-- Remainders of locally compact σ-compact spaces are precisely the
    continuous images of βX\X. -/
theorem remainder_characterization_locally_compact_sigma [LocallyCompactSpace X] [T2Space X]
    [SigmaCompactSpace X] (K : Type u) [TopologicalSpace K] [T2Space K] [CompactSpace K] :
    (∃ (c : Compactification X), Nonempty (Compactification.remainder c ≃ₜ K)) ↔
    (∃ (f : corona X → K), Continuous f ∧ Surjective f) :=
  sorry

#eval "Corona βX\\X: compact Hausdorff remainder"
#eval "βN\\N is an F-space (compact)"
#eval "Remainders = continuous images of corona (loc.comp.σ-comp)"
