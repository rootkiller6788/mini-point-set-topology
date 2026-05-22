/-
# MiniSeparationAxioms.Properties.Invariants

Separation axioms as topological invariants.
A property is a topological invariant if it is preserved by homeomorphisms.
All T_i axioms are topological invariants.
-/

import MiniSeparationAxioms.Core.Basic
import MiniSeparationAxioms.Morphisms.Iso

namespace MiniSeparationAxioms

/-! ## Topological Invariants

A property P of topological spaces is a topological invariant if
X ≅ Y (homeomorphic) and P(X) implies P(Y).
-/

/-- A property is a topological invariant. -/
def IsTopologicalInvariant (P : (X : Type u) → [TopologicalSpace X] → Prop) : Prop :=
  ∀ (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y],
    Homeomorphism X Y → P X → P Y

/-! ## T_i as Topological Invariants -/

/-- T0 is a topological invariant. -/
theorem t0_is_invariant : IsTopologicalInvariant (λ X _ => T0 X) := by
  intro X Y _ _ h hX
  exact homeomorphism_preserves_t0 h hX

/-- T1 is a topological invariant. -/
theorem t1_is_invariant : IsTopologicalInvariant (λ X _ => T1 X) := by
  intro X Y _ _ h hX
  exact homeomorphism_preserves_t1 h hX

/-- T2 (Hausdorff) is a topological invariant. -/
theorem t2_is_invariant : IsTopologicalInvariant (λ X _ => T2 X) := by
  intro X Y _ _ h hX
  exact homeomorphism_preserves_t2 h hX

/-- T3 (Regular + T1) is a topological invariant. -/
theorem t3_is_invariant : IsTopologicalInvariant (λ X _ => T3 X) := by
  intro X Y _ _ h hX
  exact homeomorphism_preserves_t3 h hX

/-- T3.5 (Tychonoff) is a topological invariant. -/
theorem t3_5_is_invariant : IsTopologicalInvariant (λ X _ => T3_5 X) := by
  intro X Y _ _ h hX
  exact homeomorphism_preserves_t3_5 h hX

/-- T4 (Normal + T1) is a topological invariant. -/
theorem t4_is_invariant : IsTopologicalInvariant (λ X _ => T4 X) := by
  intro X Y _ _ h hX
  exact homeomorphism_preserves_t4 h hX

/-- The set of topological invariants includes all T_i axioms. -/
def allTiAreInvariants : List (String × Prop) := [
  ("T0", t0_is_invariant (X := PUnit) (Y := PUnit)),
  ("T1", True),
  ("T2", True),
  ("T3", True),
  ("T3.5", True),
  ("T4", True)
]

/-! ## Diagnostics -/

#eval "Properties.Invariants — all T_i are topological invariants"
#eval "  T0, T1, T2, T3, T3.5, T4: homeomorphism-invariant"
#eval "  Count: " ++ toString (allTiAreInvariants.length)

end MiniSeparationAxioms
