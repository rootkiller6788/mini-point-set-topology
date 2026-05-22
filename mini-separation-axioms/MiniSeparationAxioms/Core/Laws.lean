/-
# MiniSeparationAxioms.Core.Laws

Implication laws among separation axioms: T_i ⇒ T_j for i ≥ j.
Axiom values as numerical ranks for classification.
Also records the Urysohn lemma, Tietze extension, and metrization theorems
as laws of the separation axiom hierarchy.
-/

import MiniSeparationAxioms.Core.Basic

namespace MiniSeparationAxioms

/-! ## Axiom Rank

Each separation axiom is assigned a numerical level (0..6) for the
purpose of classification and implication tracking.
-/

/-- Numerical rank of a separation axiom (0=T0, 1=T1, ..., 6=T6). -/
inductive AxiomRank : Type where
  | t0 : AxiomRank
  | t1 : AxiomRank
  | t2 : AxiomRank
  | t2_5 : AxiomRank
  | t3 : AxiomRank
  | t3_5 : AxiomRank
  | t4 : AxiomRank
  | t5 : AxiomRank
  | t6 : AxiomRank
  deriving Repr, DecidableEq, Ord

/-- Numerical value of each rank for comparison. -/
def AxiomRank.toNat : AxiomRank → Nat
  | .t0 => 0
  | .t1 => 1
  | .t2 => 2
  | .t2_5 => 3
  | .t3 => 4
  | .t3_5 => 5
  | .t4 => 6
  | .t5 => 7
  | .t6 => 8

/-- Predicate asserting that space X satisfies the separation axiom at the given rank. -/
def satisfiesRank (X : Type u) [TopologicalSpace X] : AxiomRank → Prop
  | .t0 => T0 X
  | .t1 => T1 X
  | .t2 => T2 X
  | .t2_5 => T2_5 X
  | .t3 => T3 X
  | .t3_5 => T3_5 X
  | .t4 => T4 X
  | .t5 => T5 X
  | .t6 => T6 X

/-! ## Implication Laws

The standard chain of implications:
  T6 ⇒ T5 ⇒ T4 ⇒ T3.5 ⇒ T3 ⇒ T2.5 ⇒ T2 ⇒ T1 ⇒ T0
-/

/-- T6 implies T5 (Perfectly Normal ⇒ Completely Normal). -/
theorem t6_implies_t5 (X : Type u) [TopologicalSpace X] (h : T6 X) : T5 X := by
  -- T6 = PerfectlyNormal + T1; PerfectlyNormal ⇒ CompletelyNormal
  -- In practice, every perfectly normal space is completely normal.
  sorry

/-- T5 implies T4 (Completely Normal ⇒ Normal). -/
theorem t5_implies_t4 (X : Type u) [TopologicalSpace X] (h : T5 X) : T4 X := by
  sorry

/-- T4 implies T3.5 (Normal + T1 ⇒ Completely Regular + T1). -/
theorem t4_implies_t3_5 (X : Type u) [TopologicalSpace X] (h : T4 X) : T3_5 X := by
  sorry

/-- T3.5 implies T3 (Completely Regular + T1 ⇒ Regular + T1). -/
theorem t3_5_implies_t3 (X : Type u) [TopologicalSpace X] (h : T3_5 X) : T3 X := by
  sorry

/-- T3 implies T2.5 (Regular + T1 ⇒ Urysohn). -/
theorem t3_implies_t2_5 (X : Type u) [TopologicalSpace X] (h : T3 X) : T2_5 X := by
  sorry

/-- T2.5 implies T2 (Urysohn ⇒ Hausdorff).
If two points can be separated by open sets with disjoint closures,
then they can certainly be separated by disjoint open sets alone. -/
theorem t2_5_implies_t2 (X : Type u) [TopologicalSpace X] (h : T2_5 X) : T2 X := by
  intro x y hne
  rcases h x y hne with ⟨U, V, hU, hV, hxU, hyV, hdisj⟩
  -- Since closure U and closure V are disjoint, U and V are also disjoint
  have hdisj' : Disjoint U V := by
    apply Set.disjoint_of_subset (by
      intro z hz
      apply Set.subset_closure
      exact hz)
    apply Set.disjoint_of_subset (by
      intro z hz
      apply Set.subset_closure
      exact hz)
    exact hdisj
  exact ⟨U, V, hU, hV, hxU, hyV, hdisj'⟩

/-- T2 implies T1 (Hausdorff ⇒ Frechet). -/
theorem t2_implies_t1 (X : Type u) [TopologicalSpace X] (h : T2 X) : T1 X := by
  sorry

/-- T1 implies T0 (Frechet ⇒ Kolmogorov). -/
theorem t1_implies_t0 (X : Type u) [TopologicalSpace X] (h : T1 X) : T0 X := by
  sorry

/-! ## Key Law Statements

These are THE major theorems of the separation axiom hierarchy.
Their proofs (or sorried stubs) reside in Theorems/Basic.lean.
-/

/-- Urysohn Lemma (law form): T4 ⇒ functional separation of disjoint closed sets. -/
def urysohnLaw (X : Type u) [TopologicalSpace X] : Prop := UrysohnLemma X

/-- Tietze Extension (law form): T4 ⇒ extension of continuous functions from closed sets. -/
def tietzeLaw (X : Type u) [TopologicalSpace X] : Prop := TietzeExtension X

/-- Urysohn Metrization (law form): T3 + second countable ⇒ metrizable. -/
def urysohnMetrizationLaw (X : Type u) [TopologicalSpace X] : Prop := UrysohnMetrization X

/-! ## Diagnostics -/

#eval "Core.Laws — implication chain + law statements"
#eval "  T6→T5→T4→T3.5→T3→T2.5→T2→T1→T0"
#eval "  AxiomRank values: " ++ toString (List.map AxiomRank.toNat [AxiomRank.t0, AxiomRank.t1, AxiomRank.t2, AxiomRank.t2_5, AxiomRank.t3, AxiomRank.t3_5, AxiomRank.t4, AxiomRank.t5, AxiomRank.t6])

end MiniSeparationAxioms
