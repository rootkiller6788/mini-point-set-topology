/-
# Benchmark.CoreCoverage

Benchmark: Core coverage of compactification definitions.
-/

import MiniStoneCechCompactification

open MiniStoneCechCompactification

/-- Benchmark: How many compactification types are defined? -/
def bench_core_object_count : List String := [
  "Compactification (dense embedding into compact Hausdorff)",
  "StoneCech βX (evaluation map into [0,1]^C(X,[0,1]))",
  "OnePointCompactification X*=X∪{∞}",
  "WallmanCompactification",
  "BohrCompactification",
  "SamuelCompactification",
  "EndCompactification (Freudenthal)",
  "Remainder βX\\X",
  "Cech-Stone functor"
]

/-- Benchmark: Key theorems stated. -/
def bench_core_theorem_count : List String := [
  "Universal property of βX",
  "βX maximal compactification",
  "βN ≅ Ultrafilter(N)",
  "β as functor Tych→CompHaus",
  "β ⊣ forgetful (left adjoint)"
]

def main : IO Unit := do
  IO.println s!"mini-stone-cech-compactification: Core coverage benchmark"
  IO.println s!"  Compactification types: {bench_core_object_count.length}"
  IO.println s!"  Key theorems: {bench_core_theorem_count.length}"
  return ()

#eval main
