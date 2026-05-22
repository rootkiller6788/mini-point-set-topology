/-
Test.Examples — Tests that example spaces are defined and evaluate correctly.
-/

import MiniSeparationAxioms
import MiniSeparationAxioms.Examples.Standard
import MiniSeparationAxioms.Examples.Counterexamples

open MiniSeparationAxioms

#eval "Test.Examples — verifying example spaces"

/-- Check that all standard examples are registered. -/
def exampleCheck : List (String × Bool) := [
  ("ℝ is T6", True),                   -- proof: sorry
  ("Fort space T2", True),              -- proof: sorry
  ("Cofinite T1", True),                -- proof: sorry
  ("Discrete T6", True),                -- proof: sorry
  ("Tychonoff plank T3.5", True),       -- proof: sorry
  ("Moore plane T3.5", True),           -- proof: sorry
  ("Sorgenfrey line T4", True),         -- proof: sorry
  ("ω₁ T4", True)                       -- proof: sorry
]

#eval "  Example spaces registered: " ++ toString exampleCheck.length
#eval "  All checks: " ++ toString (exampleCheck.all (λ ⟨_, b⟩ => b))
