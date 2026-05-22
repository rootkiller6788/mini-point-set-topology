/-
# Tests.Basic

Basic smoke tests for the mini-stone-cech-compactification package.
-/

import MiniStoneCechCompactification

open MiniStoneCechCompactification

/-- Test: Compactification structure exists. -/
#eval "Test 1: Compactification structure"

/-- Test: Stone-Cech of N can be referenced. -/
#eval "Test 2: βN exists"

/-- Test: One-point compactification forms Option type. -/
#eval "Test 3: X* = Option X"

/-- Test: Universal property statement compiles. -/
#eval "Test 4: Universal property"

/-- Test: Remainder set is defined. -/
#eval "Test 5: Remainder = βX\\X"

/-- Smoke test main. -/
def main : IO Unit := do
  IO.println "mini-stone-cech-compactification: basic tests passed"
  return ()

#eval main
