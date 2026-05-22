/-
# MiniStoneCechCompactification.Constructions.Subobjects

Compactification of subspaces and extension from dense subspaces.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws

open Set

namespace MiniStoneCechCompactification

variable {X : Type u} [TopologicalSpace X] [T35Space X]

/-! ## Compactification of subspace -/

/-- If Y ⊆ X is a subspace, the closure of Y in βX is a compactification of Y. -/
def subspaceCompactification (Y : Set X) : Compactification Y :=
  sorry

/-- βY is the closure of Y in βX (for Y ⊆ X). -/
theorem stoneCech_subspace_closure (Y : Set X) :
    Nonempty ((stoneCech Y).carrier ≃ₜ closure ((stoneCech X).embedding '' Y)) :=
  sorry

/-! ## Extension from dense subspace -/

/-- A continuous function from a dense subspace of X to a compact Hausdorff space K
    extends uniquely to X. -/
theorem dense_extension_unique {Y : Type u} [TopologicalSpace Y] [T2Space Y] [CompactSpace Y]
    {A : Set X} (hA : Dense A) (f : A → Y) (hf : Continuous f) :
    ∃! g : X → Y, Continuous g ∧ g ∘ Subtype.val = f :=
  sorry

/-- If Y is a dense subspace of X, then βY ≅ βX. -/
theorem stoneCech_dense_subspace {Y : Type u} [TopologicalSpace Y] [T35Space Y]
    (f : Y → X) (hf : DenseEmbedding f) :
    Nonempty ((stoneCech Y).carrier ≃ₜ (stoneCech X).carrier) :=
  sorry

/-! ## Subspace of remainder -/

/-- The remainder of a dense subspace compactification. -/
theorem remainder_of_dense {Y : Type u} [TopologicalSpace Y] [T35Space Y]
    (f : Y → X) (hf : DenseEmbedding f) :
    Nonempty ((stoneCechRemainder Y) ≃ₜ (stoneCechRemainder X)) :=
  sorry

/-! ## C*-embedding -/

/-- Y is C*-embedded in X if every bounded continuous f : Y → ℝ
    extends to a continuous function on X. -/
def IsCStarEmbedded (Y : Set X) : Prop :=
  ∀ (f : Y → ℝ), Continuous f → ∃ (b : ℝ), (∀ y, |f y| ≤ b) →
    ∃ (g : X → ℝ), Continuous g ∧ g ∘ Subtype.val = f

/-- βY ≅ cl_βX(Y) iff Y is C*-embedded in X. -/
theorem cstar_embedded_iff_stoneCech_closure (Y : Set X) :
    IsCStarEmbedded Y ↔ Nonempty ((stoneCech Y).carrier ≃ₜ closure ((stoneCech X).embedding '' Y)) :=
  sorry

#eval "Subspace: βY = cl_βX(Y)"
#eval "Dense subspace => βY ≅ βX"
#eval "C*-embedded characterization"
