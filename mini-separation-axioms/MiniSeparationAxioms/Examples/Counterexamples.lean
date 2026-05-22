/-
# MiniSeparationAxioms.Examples.Counterexamples

Key counterexamples in separation axiom theory:
- Tychonoff plank: T3.5 but not T4
- Deleted Tychonoff plank: T3.5 but not T4
- Moore plane (Niemytzki plane): T3.5 but not normal
- Sorgenfrey plane: product of two normal spaces that is not normal
- Ordinal space ω₁: normal but not perfectly normal
-/
import MiniSeparationAxioms.Core.Basic

namespace MiniSeparationAxioms

/-! ## The Tychonoff Plank

The Tychonoff plank is [0, ω₁] × [0, ω] minus the corner point (ω₁, ω).
It is a Tychonoff (T3.5) space that is NOT normal (T4).
This shows T3.5 does not imply T4.
-/

/-- The Tychonoff plank as a set. -/
def TychonoffPlank : Set (Ordinal × Ordinal) :=
  {p | p.1 ≤ ω₁ ∧ p.2 ≤ ω} \ {(ω₁, ω)}

/-- The Tychonoff plank is T3.5. -/
theorem tychonoff_plank_is_t3_5 : T3_5 (TychonoffPlank : Type) := by
  sorry

/-- The Tychonoff plank is NOT T4 (not normal). -/
theorem tychonoff_plank_not_t4 : ¬ T4 (TychonoffPlank : Type) := by
  sorry

/-! ## The Deleted Tychonoff Plank

Same as the Tychonoff plank but without the corner. This is also
T3.5 but not T4.  It serves as a cleaner counterexample.
-/

/-- The deleted Tychonoff plank: Tychonoff plank minus (ω₁, ω). -/
def DeletedTychonoffPlank := TychonoffPlank \ {(ω₁, ω)}

/-- The deleted Tychonoff plank is T3.5. -/
theorem deleted_tychonoff_plank_is_t3_5 : T3_5 (DeletedTychonoffPlank : Type) := by
  sorry

/-- The deleted Tychonoff plank is NOT T4. -/
theorem deleted_tychonoff_plank_not_t4 : ¬ T4 (DeletedTychonoffPlank : Type) := by
  sorry

/-! ## The Moore Plane (Niemytzki Plane)

The Niemytzki plane is the upper half-plane {(x,y) | y ≥ 0} with
the tangent disk topology: basic open neighborhoods of points on
the x-axis are open disks tangent to the x-axis plus the point.
This space is T3.5 but NOT normal.
-/

/-- Moore plane: upper half-plane. -/
def MoorePlane : Set (ℝ × ℝ) := {p | 0 ≤ p.2}

/-- Tangent disk topology on the upper half-plane. -/
def MoorePlaneTopology : TopologicalSpace (MoorePlane : Type) :=
  -- Stub: for points with y > 0, use Euclidean topology;
  -- for points with y = 0, basic opens are disks tangent at that point
  ⊥  -- Stub

/-- The Moore plane is T3.5. -/
theorem moore_plane_is_t3_5 : T3_5 (MoorePlane : Type) := by
  sorry

/-- The Moore plane is NOT T4 (not normal). -/
theorem moore_plane_not_t4 : ¬ T4 (MoorePlane : Type) := by
  sorry

/-! ## The Sorgenfrey Plane

The Sorgenfrey line (ℝ with lower-limit topology) is T4.
The Sorgenfrey plane S × S is T3.5 but NOT T4.
This is a classic example showing that T4 is NOT productive.
-/

/-- Sorgenfrey line topology: basic opens [a,b). -/
def SorgenfreyLineTopology : TopologicalSpace ℝ :=
  -- basic opens are half-open intervals [a, b)
  ⊥  -- Stub

/-- The Sorgenfrey line is T4. -/
theorem sorgenfrey_line_is_t4 : @T4 ℝ SorgenfreyLineTopology := by
  sorry

/-- The Sorgenfrey plane (S × S) is NOT T4. -/
theorem sorgenfrey_plane_not_t4 : ¬ @T4 (ℝ × ℝ) (by
    apply inferInstance
  ) := by
  sorry

/-! ## Ordinal Space ω₁

[0, ω₁) with the order topology is sequentially compact, normal (T4),
but NOT perfectly normal (T6).  This shows T4 does not imply T5 or T6.
-/

/-- The ordinal space ω₁ is T4. -/
theorem omega1_is_t4 : T4 Ordinal := by
  sorry

/-- The ordinal space ω₁ is NOT T6 (not perfectly normal).
The singleton {ω₁} is closed but not a Gδ set. -/
theorem omega1_not_t6 : ¬ T6 Ordinal := by
  sorry

/-! ## Diagnostics -/

#eval "Examples.Counterexamples — key separation axiom counterexamples"
#eval "  Tychonoff plank: T3.5, not T4"
#eval "  Deleted Tychonoff plank: T3.5, not T4"
#eval "  Moore plane: T3.5, not T4"
#eval "  Sorgenfrey plane: T4 × T4 not T4"

end MiniSeparationAxioms
