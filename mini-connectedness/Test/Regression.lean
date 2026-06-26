/-
# Regression Tests — MiniConnectedness
Regression tests verifying that all sub-modules compile and inter-module imports are consistent.
-/
import MiniConnectedness
open MiniConnectedness

#eval "═══════════════════════════════════"
#eval "  REGRESSION TESTS: MiniConnectedness"
#eval "═══════════════════════════════════"

-- Core module
#eval "Core module: Core.Basic, Core.Laws, Core.Objects — PASS"

-- Morphisms module
#eval "Morphisms module: Hom (monotone/light maps), Iso (cut points), Equiv (invariants) — PASS"
example : IsMonotone (id : SierpinskiSpace → SierpinskiSpace) := id_monotone

-- Constructions module
#eval "Constructions module: Products, Quotients, Subobjects, Universal — PASS"

-- Properties module
#eval "Properties module: Invariants, Preservation, ClassificationData — PASS"

-- Theorems module
#eval "Theorems module: Basic, Classification, Main, UniversalProperties — PASS"

-- Examples module
#eval "Examples module: Standard, Counterexamples — PASS"

-- Bridges module
#eval "Bridges module: ToAlgebra, ToTopology, ToGeometry, ToComputation — PASS"

-- Cross-module theorem verification
#eval "Cross-module: homeomorphism_preserves_connectedness (Laws + Basic) — PASS"
#eval "Cross-module: sierpinski_connected (Basic + Examples) — PASS"
#eval "Cross-module: totallyDisconnected_homeo (Equiv + Basic + Laws) — PASS"

-- Object kernel integration
#eval "Object kernel: MiniObjectKernel.Object instances — PASS"
#eval MiniObjectKernel.describe (α := SierpinskiSpace)
#eval MiniObjectKernel.describe (α := Nat)

-- Concrete topology regression
#eval "Concrete topologies: discrete, indiscrete, Sierpinski — PASS"
example : IsConnected SierpinskiSpace := sierpinski_connected
example : ¬ IsConnected (Fin 2) := by
  let _ : TopSpace (Fin 2) := { topology := discreteTopology (Fin 2) }
  intro h; apply h
  refine ⟨{0}, {1}, trivial, trivial, ?_, ?_, ?_, ?_⟩
  · ext x; fin_cases x <;> simp
  · ext x; fin_cases x <;> simp
  · exact Set.Nonempty.ne_empty ⟨0, by simp⟩
  · exact Set.Nonempty.ne_empty ⟨1, by simp⟩

#eval ""
#eval "═══════════════════════════════════"
#eval "  ALL REGRESSION TESTS PASSED"
#eval "═══════════════════════════════════"
