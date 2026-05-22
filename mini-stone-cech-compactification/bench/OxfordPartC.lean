/-
# Benchmark.OxfordPartC

Oxford Part C (MSc Mathematics) style benchmarks. Advanced MSc-level
problems in Stone-Cech compactification.
-/

import MiniStoneCechCompactification

open MiniStoneCechCompactification

/-- Oxford-style problem 1: Stone-Cech vs Wallman for normal spaces. -/
def bench_oxford_wallman_vs_sc : String :=
  "Compare: Stone-Cech compactification vs Wallman compactification. Show they coincide for normal spaces."

/-- Oxford-style problem 2: β does not commute with infinite products. -/
def bench_oxford_infinite_product : String :=
  "Give a counterexample: β(∏ X_i) ≠ ∏ βX_i for infinite products."

/-- Oxford-style problem 3: Cech-completeness and β. -/
def bench_oxford_cech : String :=
  "Prove: A Tychonoff space X is Cech-complete iff X is a G_δ subset of βX."

/-- Oxford-style problem 4: Growth of βN\\N cardinality. -/
def bench_oxford_cardinal : String :=
  "Show: |βN\\N| = 2^c. Under CH, βN\\N is the unique Parovicenko space."

/-- Oxford-style problem 5: Compactification lattice. -/
def bench_oxford_lattice : String :=
  "Prove: The compactifications of a Tychonoff space form a complete upper semilattice with βX as the top element. Describe the order structure and when infima exist."

def main : IO Unit := do
  IO.println "mini-stone-cech-compactification: Oxford Part C benchmark"
  IO.println s!"  Problem 1: {bench_oxford_wallman_vs_sc}"
  IO.println s!"  Problem 2: {bench_oxford_infinite_product}"
  IO.println s!"  Problem 3: {bench_oxford_cech}"
  IO.println s!"  Problem 4: {bench_oxford_cardinal}"
  IO.println s!"  Problem 5: {bench_oxford_lattice}"
  return ()

#eval main
