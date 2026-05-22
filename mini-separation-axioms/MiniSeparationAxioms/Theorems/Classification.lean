/-
# MiniSeparationAxioms.Theorems.Classification

Metrization theorems and classification of each T_i class.
Characterizes which spaces belong to each separation class.
-/

import MiniSeparationAxioms.Core.Basic
import MiniSeparationAxioms.Theorems.Basic

namespace MiniSeparationAxioms

/-! ## Metrization and T_i Classification

A metrizable space satisfies ALL separation axioms (T0 through T6).
Conversely, for second-countable spaces, T3 implies metrizability.
-/

/-- Every metrizable space is T6 (Perfectly Normal). -/
theorem metrizable_implies_t6 (X : Type u) [TopologicalSpace X] (hMet : Metrizable X) : T6 X := by
  sorry

/-- For second-countable spaces, T3 is equivalent to metrizability
(Urysohn Metrization). -/
theorem t3_secondCountable_iff_metrizable (X : Type u) [TopologicalSpace X]
    (hSecond : SecondCountable X) : T3 X ↔ Metrizable X := by
  sorry

/-! ## Characterization of T_i Classes -/

/-- T0 characterization: x ≤ y and y ≤ x ⇒ x = y in the specialization order. -/
theorem t0_characterization (X : Type u) [TopologicalSpace X] :
    T0 X ↔ ∀ x y : X, (∀ U : Set X, IsOpen U → (x ∈ U → y ∈ U)) → (∀ U : Set X, IsOpen U → (y ∈ U → x ∈ U)) → x = y := by
  sorry

/-- T1 characterization: points are closed. -/
theorem t1_characterization (X : Type u) [TopologicalSpace X] :
    T1 X ↔ ∀ x : X, IsClosed ({x} : Set X) := by
  constructor
  · exact λ h x => h x
  · exact λ h x => h x

/-- T2 characterization: the diagonal is closed in X × X. -/
theorem t2_characterization (X : Type u) [TopologicalSpace X] :
    T2 X ↔ IsClosed {p : X × X | p.1 = p.2} := by
  sorry

/-- T3 characterization (with T1): Regular T1 space. -/
theorem t3_characterization (X : Type u) [TopologicalSpace X] :
    T3 X ↔ Regular X ∧ T1 X := by rfl

/-- T3.5 characterization: points and closed sets functionally separated. -/
theorem t3_5_characterization (X : Type u) [TopologicalSpace X] :
    T3_5 X ↔ CompletelyRegular X ∧ T1 X := by rfl

/-- T4 characterization: Normal T1 space. -/
theorem t4_characterization (X : Type u) [TopologicalSpace X] :
    T4 X ↔ Normal X ∧ T1 X := by rfl

/-- T5 characterization: every subspace is normal. -/
theorem t5_characterization (X : Type u) [TopologicalSpace X] :
    T5 X ↔ CompletelyNormal X ∧ T1 X := by rfl

/-- T6 characterization: Normal + every closed set is Gδ. -/
theorem t6_characterization (X : Type u) [TopologicalSpace X] :
    T6 X ↔ PerfectlyNormal X ∧ T1 X := by rfl

/-! ## Compactness and Separation

In a Hausdorff space, disjoint compact sets can be separated by open sets.
-/

/-- In a Hausdorff space, a compact set and a point outside it can be separated. -/
theorem hausdorff_separates_compact_point {X : Type u} [TopologicalSpace X] (hX : T2 X)
    (K : Set X) (hK : IsCompact K) (x : X) (hx : x ∉ K) :
    ∃ U V : Set X, IsOpen U ∧ IsOpen V ∧ K ⊆ U ∧ x ∈ V ∧ Disjoint U V := by
  sorry

/-- Compact Hausdorff spaces are T4 (Normal). -/
theorem compact_hausdorff_implies_t4 (X : Type u) [TopologicalSpace X]
    (hComp : IsCompact (Set.univ : Set X)) (hT2 : T2 X) : T4 X := by
  sorry

/-! ## Diagnostics -/

#eval "Theorems.Classification — all T_i characterizations"
#eval "  Metrizable ⇒ T6 (all separation axioms)"
#eval "  T3 + 2nd countable ↔ Metrizable"

end MiniSeparationAxioms
