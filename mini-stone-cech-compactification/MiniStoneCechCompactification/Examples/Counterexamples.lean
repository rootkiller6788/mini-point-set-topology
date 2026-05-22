/-
# MiniStoneCechCompactification.Examples.Counterexamples

Counterexamples in compactification theory. Spaces where constructions
fail: not locally compact => one-point not Hausdorff, etc.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws
import MiniStoneCechCompactification.Theorems.Basic

open Set

namespace MiniStoneCechCompactification

/-! ## Failure of one-point compactification -/

/-- Q (rationals) is not locally compact, so its one-point
    compactification is not Hausdorff. -/
theorem Q_onePoint_not_Hausdorff : ¬ T2Space (OnePointCompactification ℚ) :=
  sorry

/-- The one-point compactification of Q is not Hausdorff because
    Q is not locally compact. -/
example : ¬ LocallyCompactSpace ℚ := by
  -- Q has no compact neighborhood of any point
  sorry

#eval "Q is not locally compact → Q* not Hausdorff"

/-- The space of irrationals R\Q is not locally compact,
    so its one-point compactification is not Hausdorff. -/
theorem irrational_onePoint_not_Hausdorff : ¬ T2Space (OnePointCompactification (ℝ \ Set.range ((·) : ℚ → ℝ))) :=
  sorry

#eval "R\\Q not locally compact → (R\\Q)* not Hausdorff"

/-! ## Non-Tychonoff spaces have no Stone-Cech -/

/-- A non-Tychonoff (non-T_3.5) space does not embed into any
    compact Hausdorff space, so it has no Stone-Cech compactification. -/
theorem non_tychonoff_no_stoneCech (X : Type u) [TopologicalSpace X]
    (h : ¬ T35Space X) : ¬ ∃ (c : Compactification X), True :=
  sorry

#eval "Non-Tychonoff ⇒ no Stone-Cech compactification"

/-! ## β of non-normal spaces -/

/-- The Tychonoff plank has a Stone-Cech compactification but it is
    not equal to its Wallman compactification. -/
theorem tychonoffPlank_wallman_not_beta :
    ¬ Nonempty ((WallmanCompactification tychonoffPlank).carrier ≃ₜ (stoneCech tychonoffPlank).carrier) :=
  sorry

#eval "Tychonoff plank: Wallman ≠ β"

/-! ## Infinite products fail β commutation -/

/-- β does not commute with infinite products in general.
    β(∏_i X_i) ≠ ∏_i β(X_i) for infinite products. -/
theorem infinite_product_stoneCech_not_commute :
    ¬ (∀ {ι : Type u} (X : ι → Type u) [∀ i, TopologicalSpace (X i)] [∀ i, T35Space (X i)],
      Nonempty ((stoneCech (∀ i, X i)).carrier ≃ₜ (∀ i, (stoneCech (X i)).carrier))) :=
  sorry

#eval "β(∏X_i) ≠ ∏βX_i for infinite products"

/-! ## Remainder counterexample -/

/-- Not every compact space is a remainder. A compact space K is
    a remainder of some compactification iff K is a continuous image
    of βN\N. Not all compact spaces have this property. -/
theorem not_all_compact_are_remainders (K : Type u) [TopologicalSpace K] [T2Space K] [CompactSpace K] :
    ¬ (∀ (X : Type u) [TopologicalSpace X] [T35Space X],
      Nonempty (K ≃ₜ stoneCechRemainder X)) :=
  sorry

#eval "Not all compact spaces are remainders"
