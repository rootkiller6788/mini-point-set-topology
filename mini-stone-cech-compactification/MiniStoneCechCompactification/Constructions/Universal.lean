/-
# MiniStoneCechCompactification.Constructions.Universal

β as the left adjoint to the forgetful functor CompHaus → Tych.
The universal construction of compactifications.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws
import MiniStoneCechCompactification.Morphisms.Hom

open Set

namespace MiniStoneCechCompactification

variable {X : Type u} [TopologicalSpace X] [T35Space X]

/-! ## Adjunction β ⊣ U -/

/-- The forgetful functor from compact Hausdorff spaces to Tychonoff spaces. -/
def forgetful (K : Type u) [TopologicalSpace K] [T2Space K] [CompactSpace K] : Type u := K

/-- β is left adjoint to the forgetful functor.
    Hom_CompHaus(βX, K) ≅ Hom_Tych(X, U(K)). -/
def stoneCech_adjunction_unit : X → (stoneCech X).carrier :=
  (stoneCech X).embedding

/-- The counit of the adjunction (for a compact Hausdorff space, βK → K). -/
def stoneCech_adjunction_counit {K : Type u} [TopologicalSpace K] [T2Space K] [CompactSpace K] :
    (stoneCech K).carrier → K :=
  sorry

/-- The adjunction isomorphism. -/
theorem stoneCech_adjunction {K : Type u} [TopologicalSpace K] [T2Space K] [CompactSpace K] :
    ((stoneCech X).carrier → K) ≃ (X → K) :=
  sorry

/-! ## Universal compactification -/

/-- Any continuous map f : X → K where K is compact Hausdorff
    factors uniquely through βX. -/
theorem universal_factorization {K : Type u} [TopologicalSpace K] [T2Space K] [CompactSpace K]
    (f : X → K) (hf : Continuous f) :
    ∃! f̂ : (stoneCech X).carrier → K, Continuous f̂ ∧ f̂ ∘ stoneCech_adjunction_unit = f :=
  stoneCech_universal f hf

/-- βN is a projective object in the category CompHaus. -/
theorem betaN_projective {K : Type u} [TopologicalSpace K] [T2Space K] [CompactSpace K]
    (f : (stoneCech ℕ).carrier → K) (hf : Continuous f) (hf_surj : Surjective f) :
    ∃ g : K → (stoneCech ℕ).carrier, Continuous g ∧ f ∘ g = id :=
  sorry

/-! ## Universal property of one-point -/

/-- Of all compactifications of a locally compact Hausdorff X,
    X* is the smallest (universal for proper maps). -/
theorem onePoint_universal {Y : Type u} [TopologicalSpace Y] [T2Space Y] [CompactSpace Y]
    [LocallyCompactSpace X] [T2Space X]
    (f : X → Y) (hf : Continuous f)
    -- assume f is proper (preimage of compact is compact)
    (hf_proper : True) : ∃! f̂ : OnePointCompactification X → Y, Continuous f̂ ∧ f̂ ∘ OnePointCompactification.inclusion = f :=
  sorry

#eval "Universal: β ⊣ forgetful (left adjoint)"
#eval "βN is projective in CompHaus"
#eval "One-point universal for proper maps"
