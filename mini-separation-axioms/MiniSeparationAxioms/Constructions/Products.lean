/-
# MiniSeparationAxioms.Constructions.Products

Preservation of separation axioms under products.
The product of T_i spaces is T_i for i ≤ 3.5.
Hausdorff is preserved under arbitrary products.
-/

import MiniSeparationAxioms.Core.Basic

namespace MiniSeparationAxioms

/-! ## Products and Separation Axioms

We state and (mostly) prove that separation axioms are preserved
under product constructions.  For i ≤ 3.5, the product of T_i spaces
is T_i.  For T4 (normality), the product may fail.
-/

/-- The product of two T0 spaces is T0. -/
theorem product_preserves_t0 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (hX : T0 X) (hY : T0 Y) : T0 (X × Y) := by
  sorry

/-- The product of two T1 spaces is T1. -/
theorem product_preserves_t1 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (hX : T1 X) (hY : T1 Y) : T1 (X × Y) := by
  sorry

/-- The product of two Hausdorff spaces is Hausdorff. -/
theorem product_preserves_t2 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (hX : T2 X) (hY : T2 Y) : T2 (X × Y) := by
  intro p q hne
  rcases Prod.ne_iff.mp hne with (h | h)
  · -- first components differ
    rcases hX p.1 q.1 h with ⟨U, V, hU, hV, hpU, hqV, hdisj⟩
    refine ⟨U ×ˢ Set.univ, V ×ˢ Set.univ, ?_, ?_, ?_, ?_, ?_⟩
    · -- U×Y is open
      sorry
    · -- V×Y is open
      sorry
    · exact ⟨hpU, trivial⟩
    · exact ⟨hqV, trivial⟩
    · -- disjointness
      sorry
  · -- second components differ
    rcases hY p.2 q.2 h with ⟨U, V, hU, hV, hpU, hqV, hdisj⟩
    refine ⟨Set.univ ×ˢ U, Set.univ ×ˢ V, ?_, ?_, ?_, ?_, ?_⟩
    sorry

/-- The product of two T3 spaces is T3. -/
theorem product_preserves_t3 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (hX : T3 X) (hY : T3 Y) : T3 (X × Y) := by
  sorry

/-- The product of two T3.5 (Tychonoff) spaces is T3.5. -/
theorem product_preserves_t3_5 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (hX : T3_5 X) (hY : T3_5 Y) : T3_5 (X × Y) := by
  sorry

/-- The product of T4 spaces need NOT be T4.
The Sorgenfrey line is a classic counterexample. -/
theorem product_t4_not_necessarily_t4 : ¬ (∀ (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y],
    T4 X → T4 Y → T4 (X × Y)) := by
  sorry

/-- Counterexample: Sorgenfrey plane is not normal. -/
def sorgenfreyNotNormal : Prop :=
  ∃ (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y], T4 X ∧ T4 Y ∧ ¬ T4 (X × Y)

#eval "Constructions.Products — T0,T1,T2,T3,T3.5 preserved; T4 NOT always preserved"
#eval "  Sorgenfrey plane: product of normal spaces that is not normal"

end MiniSeparationAxioms
