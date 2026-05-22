/-
# MiniTopologicalSpaces: Counterexamples

Sorgenfrey line, uncountable product not first-countable,
quotient of Hausdorff not Hausdorff.
-/

import MiniTopologicalSpaces.Core.Basic
import MiniTopologicalSpaces.Properties.Invariants
import MiniTopologicalSpaces.Theorems.Basic

namespace MiniTopologicalSpaces

/-! ## Sorgenfrey Line

The Sorgenfrey (lower-limit) topology on ℝ: basis of half-open
intervals [a, b). This space is separable, first-countable,
but NOT second-countable. It is Lindelof.
-/

def sorgenfreyTopology : TopologicalSpace ℝ where
  opens := {U | ∀ x ∈ U, ∃ b > x, Set.Ico x b ⊆ U}
  contains_univ := by
    intro x hx
    refine ⟨x + 1, by linarith, ?_⟩
    intro y hy
    exact Set.mem_univ y
  contains_empty := by
    intro x hx; exact hx.elim
  closed_under_union 𝒰 h := by
    intro x hx
    rcases hx with ⟨U, hU, hxU⟩
    rcases h hU x hxU with ⟨b, hb, hsub⟩
    refine ⟨b, hb, ?_⟩
    intro y hy
    exact ⟨U, hU, hsub hy⟩
  closed_under_inter U₁ U₂ hU₁ hU₂ := by
    intro x hx
    rcases hx with ⟨hx₁, hx₂⟩
    rcases hU₁ x hx₁ with ⟨b₁, hb₁, hsub₁⟩
    rcases hU₂ x hx₂ with ⟨b₂, hb₂, hsub₂⟩
    let b := min b₁ b₂
    have hb_gt : b > x := lt_min_iff.mpr ⟨hb₁, hb₂⟩
    have hb_le₁ : b ≤ b₁ := min_le_left _ _
    have hb_le₂ : b ≤ b₂ := min_le_right _ _
    refine ⟨b, hb_gt, ?_⟩
    intro y hy
    have hy₁ : y ∈ Set.Ico x b₁ :=
      ⟨hy.1, lt_of_lt_of_le hy.2 hb_le₁⟩
    have hy₂ : y ∈ Set.Ico x b₂ :=
      ⟨hy.1, lt_of_lt_of_le hy.2 hb_le₂⟩
    exact ⟨hsub₁ hy₁, hsub₂ hy₂⟩

#eval "── Counterexamples/Sorgenfrey: lower-limit topology ──"
#eval sorgenfreyTopology.contains_univ
#eval sorgenfreyTopology.contains_empty

/-! ## Uncountable Product Not First-Countable

ℝ^I with the product topology, where I is uncountable,
is not first-countable. This shows that products do not
preserve first-countability.
-/

theorem uncountable_product_not_first_countable (I : Type u) [hI : Infinite I]
    [hI_unc : Uncountable I] :
    ¬ FirstCountable (I → ℝ) := by
  sorry

#eval "── Counterexamples: uncountable product ──"
#check uncountable_product_not_first_countable

/-! ## Quotient of Hausdorff Not Hausdorff

The quotient of a Hausdorff space by a group action
need not be Hausdorff. Classic example: ℝ acting on
ℝ² \ {0} by irrational rotations gives a non-Hausdorff
quotient.
-/

theorem quotient_of_Hausdorff_not_Hausdorff :
    ∃ (X : Type) [tX : TopologicalSpace X] (hH : Hausdorff X)
    (R : X → X → Prop) [Equivalence R],
    ¬ Hausdorff (Quotient R) := by
  sorry

#eval "── Counterexamples: quotient of Hausdorff ──"
#check quotient_of_Hausdorff_not_Hausdorff

end MiniTopologicalSpaces
