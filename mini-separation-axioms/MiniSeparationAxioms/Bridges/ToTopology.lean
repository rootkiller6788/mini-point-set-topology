/-
# MiniSeparationAxioms.Bridges.ToTopology

Connection between separation axioms and general topology:
metrizability, uniform spaces, paracompactness.
-/

import MiniSeparationAxioms.Core.Basic
import MiniSeparationAxioms.Theorems.Basic

namespace MiniSeparationAxioms

/-! ## Metrizability and Separation

A metrizable space satisfies all separation axioms.
Conversely, separation axioms plus certain covering properties
guarantee metrizability (Urysohn, Nagata-Smirnov, Bing).
-/

/-- Metrizable ⇒ T6 (perfectly normal). -/
theorem metrizable_implies_all_separation (X : Type u) [TopologicalSpace X]
    (hMet : Metrizable X) : T6 X := by
  sorry

/-- Paracompact Hausdorff ⇒ Normal. -/
theorem paracompact_hausdorff_implies_normal (X : Type u) [TopologicalSpace X]
    (hPara : Paracompact X) (hT2 : T2 X) : Normal X := by
  sorry

/-- Locally compact Hausdorff ⇒ T3.5 (Tychonoff). -/
theorem locally_compact_hausdorff_implies_t3_5 (X : Type u) [TopologicalSpace X]
    (hLC : LocallyCompactSpace X) (hT2 : T2 X) : T3_5 X := by
  sorry

/-! ## Uniform Spaces

Every uniform space is completely regular.  The separation axioms
for uniform spaces correspond to the Hausdorff condition of the
uniform topology.
-/

/-- A uniform space is completely regular. -/
theorem uniform_space_completely_regular (X : Type u) [UniformSpace X] :
    CompletelyRegular X := by
  sorry

/-- A separated uniform space is T3.5. -/
theorem separated_uniform_space_t3_5 (X : Type u) [UniformSpace X] (hSep : SeparatedSpace X) :
    T3_5 X := by
  sorry

/-! ## Function Spaces

The compact-open topology on C(X,Y) preserves separation properties.
-/

/-- If Y is Hausdorff, then C(X,Y) with the compact-open topology is Hausdorff. -/
theorem function_space_hausdorff (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y]
    (hY : T2 Y) : T2 (X → Y) := by
  sorry

/-- If Y is T3 and X is locally compact, then C(X,Y) with the compact-open
topology is T3. -/
theorem function_space_t3 (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y]
    (hX : LocallyCompactSpace X) (hY : T3 Y) : T3 (X → Y) := by
  sorry

/-! ## Diagnostics -/

#eval "Bridges.ToTopology — metrizability, uniform spaces, paracompactness"
#eval "  Metrizable ⇒ T6"
#eval "  Paracompact Hausdorff ⇒ Normal"
#eval "  Uniform spaces ⇒ Completely Regular"

end MiniSeparationAxioms
