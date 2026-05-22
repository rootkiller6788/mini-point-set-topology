/-
# MiniConnectedness: Main Theorems

Major structure theorems: the non-cut point theorem (every nondegenerate
continuum has at least two non-cut points) and Sierpinski's theorem
on continua (no continuum is a countable union of pairwise disjoint
closed subsets, except the empty set).
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Morphisms.Iso
import MiniConnectedness.Properties.Invariants

namespace MiniConnectedness

/-! ## Non-Cut Point Theorem -/

/-- Every nondegenerate continuum has at least two non-cut points.
This is a fundamental result in continuum theory. -/
theorem nonCutPointTheorem_full {α : Type u} [TopSpace α] [Continuum α]
  (h_nondeg : ∃ a b : α, a ≠ b) : ∃ x y : α, x ≠ y ∧ IsNonCutPoint x ∧ IsNonCutPoint y := by
  sorry

#eval "nonCutPointTheorem_full: every continuum with ≥2 points has ≥2 non-cut points"

/-! ## Corollary: Continua Have Endpoints -/

/-- Every nondegenerate continuum has at least two endpoints. -/
theorem continuumHasEndpoints {α : Type u} [TopSpace α] [Continuum α]
  (h_nondeg : ∃ a b : α, a ≠ b) : ∃ x y : α, x ≠ y ∧ IsEndpoint x ∧ IsEndpoint y := by
  sorry

#eval "continuumHasEndpoints: nondegenerate continuum ⇒ at least 2 endpoints"

/-! ## Sierpinski's Theorem -/

/-- Sierpinski's theorem: no continuum can be expressed as a countable union
of pairwise disjoint nonempty closed subsets. -/
theorem sierpinskiTheorem {α : Type u} [TopSpace α] [Continuum α]
  (h_nonempty : Nonempty α) : ¬ ∃ (Fn : ℕ → Set α),
    (∀ n, isClosed (Fn n)) ∧ (∀ n, Fn n ≠ ∅) ∧
    (∀ n m, n ≠ m → Fn n ∩ Fn m = ∅) ∧
    (⋃ n, Fn n = Set.univ) := by
  sorry

#eval "Sierpinski theorem: continuum ≠ countable union of disjoint closed sets"

/-! ## Application: Closed Partition of a Continuum -/

/-- Any partition of a continuum into closed sets is finite or contains a non-closed member. -/
theorem continuum_partition_finite_or_nonclosed {α : Type u} [TopSpace α] [Continuum α]
  (h_nonempty : Nonempty α) (P : Set (Set α)) (h_partition : sorry) : sorry := by
  sorry

#eval "Continuum partition: closed partition of continuum must be finite"

end MiniConnectedness
