/-
# Benchmark.CambridgePartIII

Cambridge Part III (MMath/MASt) style benchmarks for Stone-Cech
compactification theory.
-/

import MiniStoneCechCompactification

open MiniStoneCechCompactification

/-- Cambridge-style problem 1: C*(X) ≅ C(βX) as Banach algebras. -/
def bench_cambridge_gn : String :=
  "Show: C*(X) ≅ C(βX) as commutative unital C*-algebras (Gelfand-Naimark)."

/-- Cambridge-style problem 2: Magill classification. -/
def bench_cambridge_magill : String :=
  "Show: For locally compact σ-compact X, compactifications of X correspond to closed subsets of βX\\X."

/-- Cambridge-style problem 3: Parovicenko (under CH). -/
def bench_cambridge_parovicenko : String :=
  "Show (CH): βN\\N is the unique zero-dimensional compact F-space of weight c without isolated points."

/-- Cambridge-style problem 4: Wallman compactification. -/
def bench_cambridge_wallman : String :=
  "Show: For T1 X, Wallman compactification exists; it is Hausdorff iff X is normal; for normal X, wX = βX."

/-- Cambridge-style problem 5: Glicksberg's theorem. -/
def bench_cambridge_glicksberg : String :=
  "Show: Product of pseudocompact locally compact X and pseudocompact Y is pseudocompact."

def main : IO Unit := do
  IO.println "mini-stone-cech-compactification: Cambridge Part III benchmark"
  IO.println s!"  Problem 1: {bench_cambridge_gn}"
  IO.println s!"  Problem 2: {bench_cambridge_magill}"
  IO.println s!"  Problem 3: {bench_cambridge_parovicenko}"
  IO.println s!"  Problem 4: {bench_cambridge_wallman}"
  IO.println s!"  Problem 5: {bench_cambridge_glicksberg}"
  return ()

#eval main
