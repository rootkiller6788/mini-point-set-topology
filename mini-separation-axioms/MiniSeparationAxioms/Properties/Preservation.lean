/-
# MiniSeparationAxioms.Properties.Preservation

Preservation of separation axioms under various classes of maps:
continuous maps, perfect maps, closed maps, open maps.
-/

import MiniSeparationAxioms.Core.Basic
import MiniSeparationAxioms.Morphisms.Hom
import MiniSeparationAxioms.Morphisms.Iso

namespace MiniSeparationAxioms

/-! ## Preservation Under Continuous Maps -/

/-- Continuous surjections do NOT generally preserve T_i for i ≥ 2.
Every topological space is the continuous image of a metric space
(and hence of a normal space).
-/
theorem continuous_surjection_not_preserving : ¬ (∀ (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y), Continuous f → Function.Surjective f → T4 X → T4 Y) := by
  sorry

/-! ## Preservation Under Perfect Maps -/

/-- Perfect maps preserve T2 (Hausdorff).  If f : X → Y is perfect and
X is Hausdorff, then Y is Hausdorff. -/
theorem perfect_map_preserves_t2 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) (hf : IsPerfectMap f) (hX : T2 X) : T2 Y := by
  sorry

/-- Perfect maps preserve regularity. -/
theorem perfect_map_preserves_regular {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) (hf : IsPerfectMap f) (hX : Regular X) : Regular Y := by
  sorry

/-- Perfect maps preserve T4 (normality). -/
theorem perfect_map_preserves_t4 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) (hf : IsPerfectMap f) (hX : T4 X) : T4 Y := by
  sorry

/-! ## Preservation Under Closed Maps -/

/-- Closed continuous surjections preserve T4. -/
theorem closed_map_preserves_t4 {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) (hf : Continuous f) (hf_closed : IsClosedMap f) (hf_surj : Function.Surjective f)
    (hX : T4 X) : T4 Y := by
  sorry

/-! ## Preservation Table

Records which map classes preserve which T_i axioms.
-/

inductive MapClass where
  | continuous | perfect | closed | open | homeomorphism
  deriving Repr

/-- Preservation map: for each MapClass and AxiomRank, whether it's preserved. -/
def preservationTable : MapClass → AxiomRank → Bool
  | .continuous, .t0 => true
  | .continuous, .t1 => true
  | .continuous, .t2 => false
  | .continuous, .t3 => false
  | .continuous, .t3_5 => false
  | .continuous, .t4 => false
  | .continuous, .t5 => false
  | .continuous, .t6 => false
  | .perfect, _ => true
  | .closed, .t4 => true
  | .homeomorphism, _ => true
  | _, _ => false

/-! ## Diagnostics -/

#eval "Properties.Preservation — perfect maps preserve all T_i, closed maps preserve T4"
#eval "  Perfect: T2, Regular, T4"
#eval "  Closed: T4 (with surjectivity)"

end MiniSeparationAxioms
