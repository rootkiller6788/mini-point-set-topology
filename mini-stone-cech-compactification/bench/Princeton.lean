/-
# Benchmark.Princeton

Princeton topology qual exam style benchmarks for Stone-Cech
compactification.
-/

import MiniStoneCechCompactification

open MiniStoneCechCompactification

/-- Princeton-style problem 1: Show βX exists and has the universal property. -/
def bench_princeton_existence : String :=
  "Show: For any Tychonoff X, ∃ βX compact Hausdorff and dense embedding e:X→βX with universal property."

/-- Princeton-style problem 2: βX is maximal among compactifications. -/
def bench_princeton_maximal : String :=
  "Show: For any compactification c of X, ∃! π:βX→c continuous surjection with π∘e_β = e_c."

/-- Princeton-style problem 3: βN is extremally disconnected. -/
def bench_princeton_extremal : String :=
  "Show: βN is extremally disconnected (the closure of every open set is open)."

/-- Princeton-style problem 4: |βN| = 2^c. -/
def bench_princeton_cardinality : String :=
  "Show: |βN| = 2^c where c = |R| = 2^ℵ₀."

/-- Princeton-style problem 5: X* = βX when complement of compact is compact. -/
def bench_princeton_one_point : String :=
  "Show: If X is locally compact and X\\K is compact for compact K, then X* = βX."

def main : IO Unit := do
  IO.println "mini-stone-cech-compactification: Princeton benchmark"
  IO.println s!"  Problem 1: {bench_princeton_existence}"
  IO.println s!"  Problem 2: {bench_princeton_maximal}"
  IO.println s!"  Problem 3: {bench_princeton_extremal}"
  IO.println s!"  Problem 4: {bench_princeton_cardinality}"
  IO.println s!"  Problem 5: {bench_princeton_one_point}"
  return ()

#eval main
