/-
# MiniSeparationAxioms.Constructions.Quotients

Quotient spaces and separation axioms.
Quotients of normal spaces may not be normal, but
closed quotients preserve normality (and other T_i axioms).
-/

import MiniSeparationAxioms.Core.Basic
import MiniSeparationAxioms.Morphisms.Hom

namespace MiniSeparationAxioms

/-! ## Quotient Maps -/

/-- A quotient map: surjective, continuous, and U is open iff f⁻¹(U) is open. -/
def IsQuotientMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : Prop :=
  Function.Surjective f ∧ Continuous f ∧ (∀ U : Set Y, IsOpen U ↔ IsOpen (f⁻¹' U))

/-- The quotient topology on Y induced by a surjective map f : X → Y. -/
def QuotientTopology {X Y : Type u} [TopologicalSpace X] (f : X → Y) (hsurj : Function.Surjective f) : TopologicalSpace Y :=
  { IsOpen := λ U => IsOpen (f⁻¹' U)
    isOpen_univ := by simp
    isOpen_inter := by
      intro U V hU hV
      simp [hU, hV]
    isOpen_sUnion := by
      intro S hS
      simp only [Set.preimage_sUnion]
      apply isOpen_sUnion
      intro V hV
      rcases hS V hV with ⟨hV, rfl⟩
      exact hV
  }

/-! ## Preservation Under Quotients -/

/-- A closed quotient map preserves normality (T4). -/
theorem closed_quotient_preserves_t4 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) (hq : IsQuotientMap f) (hf : IsClosedMap f) (hX : T4 X) : T4 Y := by
  sorry

/-- Counterexample: a non-closed quotient of a normal space need not be normal. -/
theorem quotient_normal_not_normal : ∃ (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y), T4 X ∧ IsQuotientMap f ∧ ¬ T4 Y := by
  sorry

/-- The quotient of a T1 space by a closed equivalence relation is T1. -/
theorem quotient_preserves_t1_closed {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) (hq : IsQuotientMap f) (hf : IsClosedMap f) (hX : T1 X) : T1 Y := by
  sorry

/-- The quotient of a Hausdorff space need not be Hausdorff.
Example: the line with two origins. -/
theorem quotient_hausdorff_not_hausdorff : ∃ (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y), T2 X ∧ IsQuotientMap f ∧ ¬ T2 Y := by
  sorry

/-! ## Diagnostics -/

#eval "Constructions.Quotients — closed quotient preserves T4, counterexamples exist"
#eval "  Quotient of normal need NOT be normal"
#eval "  Quotient of Hausdorff need NOT be Hausdorff"

end MiniSeparationAxioms
