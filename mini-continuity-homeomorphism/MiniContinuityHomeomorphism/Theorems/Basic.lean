import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Core.Laws

/-!
# Theorems: Basic Results

Fundamental theorems: the pasting lemma, tube lemma, lifting properties, and
the homotopy extension property. All proofs are deferred (marked `sorry`).
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

section PastingLemmaTheorem

/-- The pasting lemma: If `X = A ∪ B` with `A, B` closed in `X`, and `f : X → Y`
is continuous on `A` and on `B`, then `f` is continuous on `X`. -/
theorem pasting_lemma {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    {A B : Set X} (hA : IsClosed A) (hB : IsClosed B) (hcover : A ∪ B = Set.univ)
    (f : X → Y) (hfA : ContinuousOn f A) (hfB : ContinuousOn f B) : Continuous f := by
  sorry

/-- Pasting lemma for an arbitrary locally finite closed cover. -/
theorem pasting_lemma_locally_finite {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    {ι : Type} (C : ι → Set X) (hC : ∀ i, IsClosed (C i))
    (hcover : ⋃ i, C i = Set.univ) (hlocfin : LocallyFinite C)
    (f : X → Y) (hf : ∀ i, ContinuousOn f (C i)) : Continuous f := by
  sorry

end PastingLemmaTheorem

section TubeLemma

/-- The Tube Lemma: If `X` is compact, `Y` is any space, `x₀ ∈ X`, and `N` is
an open set in `X × Y` containing the slice `{x₀} × Y`, then there exists an
open neighborhood `U` of `x₀` in `X` such that `U × Y ⊆ N`. -/
theorem tube_lemma {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (hX : IsCompact (Set.univ : Set X)) (x₀ : X) (N : Set (X × Y)) (hN : IsOpen N)
    (hslice : (fun y => (x₀, y)) '' Set.univ ⊆ N) :
    ∃ (U : Set X), IsOpen U ∧ x₀ ∈ U ∧ U ×ˢ Set.univ ⊆ N := by
  sorry

/-- Compactness of product: Tychonoff for two factors. -/
theorem compact_product {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (hX : IsCompact (Set.univ : Set X)) (hY : IsCompact (Set.univ : Set Y)) :
    IsCompact (Set.univ : Set (X × Y)) := by
  sorry

end TubeLemma

section LiftingProperties

/-- A map `p : E → B` has the homotopy lifting property with respect to `X`
if every homotopy into `B` can be lifted given an initial lift. -/
def HasHomotopyLiftingProperty {E B X : Type} [TopologicalSpace E] [TopologicalSpace B]
    [TopologicalSpace X] (p : C(E, B)) : Prop :=
  ∀ (f : C(X, E)) (H : Homotopy (p.comp f) (p.comp f)),
    ∃ (H' : Homotopy f f), ∀ x t, p (H'.toFun x t) = H.toFun x t

/-- A map `i : A → X` has the homotopy extension property if every homotopy
from `A` can be extended to a homotopy from `X`. -/
def HasHomotopyExtensionProperty {A X : Type} [TopologicalSpace A] [TopologicalSpace X]
    (i : C(A, X)) : Prop :=
  ∀ (Y : Type) [TopologicalSpace Y] (f : C(X, Y)) (H : Homotopy (f.comp i) (f.comp i)),
    ∃ (H' : Homotopy f f), ∀ a t, H'.toFun (i a) t = H.toFun a t

/-- The inclusion of a subcomplex into a CW complex is a cofibration (has HEP). -/
theorem cw_inclusion_has_HEP {A X : Type} [TopologicalSpace A] [TopologicalSpace X]
    (i : C(A, X)) (hCW : IsCWComplex X) (hsub : IsSubcomplex A X) : HasHomotopyExtensionProperty i := by
  sorry

end LiftingProperties

section evals

/-- The pasting lemma is fundamental for building continuous maps. -/
#eval "pasting_lemma : essential for defining maps on unions"

/-- The tube lemma is the key ingredient for Tychonoff's theorem. -/
#eval "tube_lemma : key ingredient for Tychonoff (product of compact is compact)"

/-- HEP characterizes cofibrations in the model structure on Top. -/
#eval "HEP_characterization : cofibration iff inclusion has homotopy extension property"

end evals

end MiniContinuityHomeomorphism
