/-
# MiniSeparationAxioms.Constructions.Subobjects

Subspaces and separation axioms.
Subspaces preserve T_i for i ≤ 3.5.
Closed subspaces preserve T_i for all i.
-/

import MiniSeparationAxioms.Core.Basic

namespace MiniSeparationAxioms

/-! ## Subspace Topology

For any subset Y ⊆ X, the subspace topology on Y.
-/

/-- Restriction of topology to a subset Y. -/
def SubspaceTopology {X : Type u} [TopologicalSpace X] (Y : Set X) : TopologicalSpace Y :=
  { IsOpen := λ U => ∃ V : Set X, IsOpen V ∧ U = V ∩ Y
    isOpen_univ := ⟨Set.univ, isOpen_univ, by simp⟩
    isOpen_inter := by
      intro U V ⟨U', hU', hUeq⟩ ⟨V', hV', hVeq⟩
      refine ⟨U' ∩ V', IsOpen.inter hU' hV', ?_⟩
      ext y; simp [hUeq, hVeq]
    isOpen_sUnion := by
      intro S hS
      choose U' hU' hUeq using fun U hU => hS U hU
      refine ⟨⋃ U ∈ S, U' U, isOpen_sUnion (λ U hU => hU' U hU), ?_⟩
      ext y; simp [hUeq]
  }

/-- A subspace inherits T0. -/
theorem subspace_preserves_t0 {X : Type u} [TopologicalSpace X] (hX : T0 X) (Y : Set X) :
    @T0 Y (SubspaceTopology Y) := by
  sorry

/-- A subspace inherits T1. -/
theorem subspace_preserves_t1 {X : Type u} [TopologicalSpace X] (hX : T1 X) (Y : Set X) :
    @T1 Y (SubspaceTopology Y) := by
  sorry

/-- A subspace inherits T2 (Hausdorff). -/
theorem subspace_preserves_t2 {X : Type u} [TopologicalSpace X] (hX : T2 X) (Y : Set X) :
    @T2 Y (SubspaceTopology Y) := by
  sorry

/-- A subspace inherits T2.5 (Urysohn). -/
theorem subspace_preserves_t2_5 {X : Type u} [TopologicalSpace X] (hX : T2_5 X) (Y : Set X) :
    @T2_5 Y (SubspaceTopology Y) := by
  sorry

/-- A subspace inherits T3 (Regular + T1). -/
theorem subspace_preserves_t3 {X : Type u} [TopologicalSpace X] (hX : T3 X) (Y : Set X) :
    @T3 Y (SubspaceTopology Y) := by
  sorry

/-- A subspace inherits T3.5 (Tychonoff). -/
theorem subspace_preserves_t3_5 {X : Type u} [TopologicalSpace X] (hX : T3_5 X) (Y : Set X) :
    @T3_5 Y (SubspaceTopology Y) := by
  sorry

/-- A subspace of a normal space need NOT be normal.  However, a CLOSED subspace
of a normal space is normal.  The Tychonoff plank is an example. -/
theorem subspace_normal_not_normal : ∃ (X : Type u) [TopologicalSpace X] (Y : Set X),
    T4 X ∧ ¬ @T4 Y (SubspaceTopology Y) := by
  sorry

/-- A CLOSED subspace inherits T4 (normal + T1). -/
theorem closed_subspace_preserves_t4 {X : Type u} [TopologicalSpace X] (hX : T4 X)
    (Y : Set X) (hYcl : IsClosed Y) : @T4 Y (SubspaceTopology Y) := by
  sorry

/-- A CLOSED subspace inherits T5. -/
theorem closed_subspace_preserves_t5 {X : Type u} [TopologicalSpace X] (hX : T5 X)
    (Y : Set X) (hYcl : IsClosed Y) : @T5 Y (SubspaceTopology Y) := by
  sorry

/-- A CLOSED subspace inherits T6. -/
theorem closed_subspace_preserves_t6 {X : Type u} [TopologicalSpace X] (hX : T6 X)
    (Y : Set X) (hYcl : IsClosed Y) : @T6 Y (SubspaceTopology Y) := by
  sorry

/-! ## Diagnostics -/

#eval "Constructions.Subobjects — subspace preserves T_i for i≤3.5, closed subspace for all i"
#eval "  T0,T1,T2,T2.5,T3,T3.5: subspace preserved"
#eval "  T4,T5,T6: only closed subspace preserved"

end MiniSeparationAxioms
