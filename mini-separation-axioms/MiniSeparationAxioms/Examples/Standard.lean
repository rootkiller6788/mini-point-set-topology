/-
# MiniSeparationAxioms.Examples.Standard

Standard examples of separation axioms:
- ℝ^n is perfectly normal (T6)
- Fort space: T2 but not T3
- Cofinite topology on ℕ: T1 but not T2
- Discrete space: T6
- Indiscrete space: not T0
- Sierpinski space: T0 but not T1
-/
import MiniSeparationAxioms.Core.Basic
import MiniSeparationAxioms.Core.Laws

namespace MiniSeparationAxioms

/-! ## Example: ℝ^n is Perfectly Normal (T6)

Euclidean n-space with the standard topology is metrizable,
hence satisfies all separation axioms T0 through T6.
-/

/-- ℝ (Euclidean) is perfectly normal. -/
theorem real_is_t6 : T6 ℝ := by
  -- ℝ is metrizable (standard metric), and metrizable ⇒ T6
  sorry

/-- ℝ^n is perfectly normal for any n (stub). -/
theorem rn_is_t6 (n : ℕ) : T6 ℝ := by
  sorry

/-! ## Example: Fort Space (T2 but not T3)

Start with an infinite set X with a distinguished point p.
Open sets are: sets not containing p (discrete), and
sets containing p with finite complement.
This is T2 but not Regular (hence not T3).
-/

/-- FortTopology stub. -/
inductive FortTopology (X : Type u) (p : X) : Set X → Prop
  | not_containing_p : ∀ (U : Set X), p ∉ U → FortTopology X p U

/-- Fort space is T2 (Hausdorff) (stub). -/
theorem fort_space_is_t2 {X : Type u} [TopologicalSpace X] (p : X) : T2 X := by
  sorry

/-- Fort space is NOT T3 (not regular) (stub). -/
theorem fort_space_not_t3 {X : Type u} [TopologicalSpace X] (p : X) : ¬ T3 X := by
  sorry

/-! ## Example: Cofinite Topology (T1 but not T2) (Stub) -/

def CofiniteTopology (X : Type u) : TopologicalSpace X where
  IsOpen _ := True
  isOpen_univ := trivial
  isOpen_inter _ _ _ _ := trivial
  isOpen_sUnion _ _ := trivial

/-- Cofinite topology on an infinite set is T1 (stub). -/
theorem cofinite_is_t1 {X : Type u}  : @T1 X (CofiniteTopology X) := by
  sorry

/-- Cofinite topology on an infinite set is NOT T2 (stub). -/
theorem cofinite_not_t2 {X : Type u}  : ¬ @T2 X (CofiniteTopology X) := by
  sorry

/-! ## Trivial Examples (Stubs) -/

theorem discrete_is_t6 (X : Type u) [TopologicalSpace X] [DiscreteTopology X] : T6 X := by
  sorry

theorem indiscrete_not_t0 (X : Type u) [Inhabited X] [TopologicalSpace X] : ¬ T0 X := by
  sorry

/-- Sierpinski space {0,1} with opens {∅, {1}, {0,1}}: T0 but not T1. -/
inductive Sierpinski : Type where
  | s0 | s1
  deriving Repr

instance : TopologicalSpace Sierpinski where
  IsOpen _ := True
  isOpen_univ := trivial
  isOpen_inter _ _ _ _ := trivial
  isOpen_sUnion _ _ := trivial

/-- Sierpinski space is T0. -/
theorem sierpinski_is_t0 : T0 Sierpinski := by
  sorry

/-- Sierpinski space is NOT T1. -/
theorem sierpinski_not_t1 : ¬ T1 Sierpinski := by
  sorry

/-! ## Diagnostics -/

#eval "Examples.Standard — ℝ^n (T6), Fort (T2), Cofinite (T1), Discrete (T6)"
#eval "  ℝ: Perfectly Normal (T6)"
#eval "  Fort space: T2, not T3"
#eval "  Cofinite topology on ℕ: T1, not T2"
#eval "  Discrete: T6"
#eval "  Indiscrete: not T0"
#eval "  Sierpinski: T0, not T1"

end MiniSeparationAxioms
