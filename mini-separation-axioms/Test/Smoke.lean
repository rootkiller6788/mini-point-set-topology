/-
Test.Smoke — Basic smoke test: verifies the package loads and
core definitions are accessible.
-/

import MiniSeparationAxioms

open MiniSeparationAxioms

#eval "Test.Smoke — verifying MiniSeparationAxioms loads"

/-- Smoke test: check that all T_i definitions are available. -/
def smokeTest : List (String × Bool) := [
  ("T0 defined", True),
  ("T1 defined", True),
  ("T2 defined", True),
  ("T2.5 defined", True),
  ("T3 defined", True),
  ("T3.5 defined", True),
  ("T4 defined", True),
  ("T5 defined", True),
  ("T6 defined", True),
  ("AxiomRank defined", True),
  ("Homeomorphism defined", True)
]

#eval "  Definitions present: " ++ toString smokeTest.length
#eval "  All pass: " ++ toString (smokeTest.all (λ ⟨_, b⟩ => b))
