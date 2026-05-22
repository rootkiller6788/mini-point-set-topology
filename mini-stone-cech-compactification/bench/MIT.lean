/-
# Benchmark.MIT

MIT 18.901/18.102 style benchmarks. Applied topology problems
in compactification theory.
-/

import MiniStoneCechCompactification

open MiniStoneCechCompactification

/-- MIT-style problem 1: One-point compactification of R^n is S^n. -/
def bench_mit_sphere : String :=
  "Prove: The one-point compactification of R^n is homeomorphic to S^n."

/-- MIT-style problem 2: Q* not Hausdorff because Q not locally compact. -/
def bench_mit_rational : String :=
  "Show: The one-point compactification of Q is not Hausdorff. Explain why Q is not locally compact."

/-- MIT-style problem 3: β of discrete space. -/
def bench_mit_discrete : String :=
  "Show: For a discrete space D, βD is extremally disconnected. Characterize βD in terms of ultrafilters."

/-- MIT-style problem 4: Locally compact ⇒ open in βX. -/
def bench_mit_open : String :=
  "Prove: X is locally compact iff X is open in βX."

/-- MIT-style problem 5: Compact metric spaces have metrizable β. -/
def bench_mit_metrizable : String :=
  "Prove: If X is a compact metric space, then βX ≅ X and hence βX is metrizable."

def main : IO Unit := do
  IO.println "mini-stone-cech-compactification: MIT benchmark"
  IO.println s!"  Problem 1: {bench_mit_sphere}"
  IO.println s!"  Problem 2: {bench_mit_rational}"
  IO.println s!"  Problem 3: {bench_mit_discrete}"
  IO.println s!"  Problem 4: {bench_mit_open}"
  IO.println s!"  Problem 5: {bench_mit_metrizable}"
  return ()

#eval main
