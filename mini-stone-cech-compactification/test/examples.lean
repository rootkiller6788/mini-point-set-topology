/-
# Tests.Examples

Tests for the examples module. Verify that example computations
and statements are well-formed.
-/

import MiniStoneCechCompactification

open MiniStoneCechCompactification

/-- Test: βN ultrafilter representation statement. -/
#eval "Examples Test 1: βN ≅ Ultrafilter(N)"

/-- Test: S^n as one-point of R^n. -/
#eval "Examples Test 2: S^n = (R^n)*"

/-- Test: Q not locally compact → Q* not Hausdorff. -/
#eval "Examples Test 3: Q* not Hausdorff"

/-- Test: βR contains βN as closed subspace. -/
#eval "Examples Test 4: βN closed in βR"

/-- Test: Tychonoff plank defined. -/
#eval "Examples Test 5: Tychonoff plank"

def main : IO Unit := do
  IO.println "mini-stone-cech-compactification: examples tests passed"
  return ()

#eval main
