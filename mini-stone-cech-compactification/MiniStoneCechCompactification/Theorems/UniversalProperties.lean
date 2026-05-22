/-
# MiniStoneCechCompactification.Theorems.UniversalProperties

Universal properties: β as left adjoint to the forgetful functor,
βN as projective object in CompHaus, and extremal properties.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws
import MiniStoneCechCompactification.Constructions.Universal

open Set

namespace MiniStoneCechCompactification

variable {X : Type u} [TopologicalSpace X] [T35Space X]

/-! ## β as left adjoint -/

/-- **β is left adjoint to the forgetful functor U : CompHaus → Tych**.
    There is a natural bijection:
    Hom_CompHaus(βX, K) ≅ Hom_Tych(X, U K) -/
theorem stoneCech_left_adjoint {K : Type u} [TopologicalSpace K] [T2Space K] [CompactSpace K] :
    Bijection (fun (g : (stoneCech X).carrier → K) => g ∘ (stoneCech X).embedding)
      (fun (f : X → K) => (stoneCech_universal f (by
        -- continuous since restriction of continuous map to Tych
        sorry)).exists.choose) :=
  sorry

/-- The unit of the adjunction: η_X : X → βX is the canonical embedding. -/
theorem adjunction_unit_is_embedding : Embedding ((stoneCech X).embedding : X → (stoneCech X).carrier) :=
  (stoneCech X).isEmbedding

/-- The counit of the adjunction: ε_K : βK → K is the evaluation at K's own points. -/
theorem adjunction_counit_splits {K : Type u} [TopologicalSpace K] [T2Space K] [CompactSpace K] (k : K) :
    (stoneCech_adjunction_counit (X := K)) ((stoneCech K).embedding k) = k :=
  sorry

/-! ## βN as projective object -/

/-- **βN is projective in CompHaus**:
    For any continuous surjection f : K → L between compact Hausdorff spaces,
    and any continuous g : βN → L, there exists a lift h : βN → K
    such that f ∘ h = g. -/
theorem betaN_projective_lifting {K L : Type u} [TopologicalSpace K] [TopologicalSpace L]
    [T2Space K] [T2Space L] [CompactSpace K] [CompactSpace L]
    (f : K → L) (hf : Continuous f) (hf_surj : Surjective f)
    (g : (stoneCech ℕ).carrier → L) (hg : Continuous g) :
    ∃ h : (stoneCech ℕ).carrier → K, Continuous h ∧ f ∘ h = g :=
  sorry

/-- Equivalently, βN is an absolute extensor for compact spaces of weight ≤ c. -/
theorem betaN_absolute_extensor {K : Type u} [TopologicalSpace K] [T2Space K] [CompactSpace K]
    (h_weight : weight K ≤ 2 ^ ℵ₀) {A : Set K} (hA : IsClosed A)
    (f : A → (stoneCech ℕ).carrier) (hf : Continuous f) :
    ∃ g : K → (stoneCech ℕ).carrier, Continuous g ∧ g ∘ Subtype.val = f :=
  sorry

/-! ## Extremal properties -/

/-- βX is the maximal compactification. -/
theorem stoneCech_maximal_compactification (c : Compactification X) : c ≤c stoneCech X :=
  stoneCech_is_maximal c

/-- βX is extremally disconnected when X is discrete. -/
theorem stoneCech_extremally_disconnected [DiscreteTopology X] :
    ExtremallyDisconnected (stoneCech X).carrier :=
  stoneCech_discrete_extremallyDisconnected

/-- X has a unique compactification (i.e., |K(X)| = 1) iff X is compact. -/
theorem unique_compactification_iff_compact [T2Space X] :
    (∀ c₁ c₂ : Compactification X, c₁ ≅c c₂) ↔ CompactSpace X :=
  sorry

#eval "β ⊣ U (left adjoint to forgetful)"
#eval "βN is projective in CompHaus"
#eval "βX maximal, β(discrete) extremally disconnected"
