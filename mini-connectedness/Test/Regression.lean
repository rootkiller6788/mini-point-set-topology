/-
# Regression Tests — MiniConnectedness

Regression tests verifying that all sub-modules compile and
inter-module imports are consistent.
-/

import MiniConnectedness

open MiniConnectedness

#eval "══ REGRESSION TESTS: MiniConnectedness ══"

/-! ### Core module regression -/
#eval "Core.Basic, Core.Objects, Core.Laws imported"

/-! ### Morphisms module regression -/
#eval "Morphisms.Hom (monotone/light), Iso (cut points), Equiv (invariants) imported"

/-! ### Constructions module regression -/
#eval "Products, Quotients, Subobjects, Universal all imported"

/-! ### Properties module regression -/
#eval "Invariants, Preservation, ClassificationData imported"

/-! ### Theorems module regression -/
#eval "Basic, Classification, Main, UniversalProperties imported"

/-! ### Examples module regression -/
#eval "Standard, Counterexamples imported"

/-! ### Bridges module regression -/
#eval "ToAlgebra, ToTopology, ToGeometry, ToComputation imported"

#eval "══ REGRESSION TESTS PASSED (all modules import) ══"
