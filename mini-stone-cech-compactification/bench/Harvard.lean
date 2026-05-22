/-
# Benchmark.Harvard

Harvard Math 55a/212a style benchmarks. Advanced problems in
compactification and Stone-Cech theory.
-/

import MiniStoneCechCompactification

open MiniStoneCechCompactification

/-- Harvard-style problem 1: β as left adjoint to forgetful CompHaus→Tych. -/
def bench_harvard_adjoint : String :=
  "Show: β : Tych → CompHaus is left adjoint to the forgetful functor U, with unit and counit satisfying the triangle identities."

/-- Harvard-style problem 2: βN is projective in CompHaus. -/
def bench_harvard_projective : String :=
  "Show: βN is projective in CompHaus: every continuous surjection onto a space with βN as target splits."

/-- Harvard-style problem 3: Remainder as F-space. -/
def bench_harvard_fspace : String :=
  "Characterize: When is a compact space an F-space? Show βN\\N is a compact F-space."

/-- Harvard-style problem 4: Gelfand duality for compactifications. -/
def bench_harvard_gelfand : String :=
  "Establish: Contravariant equivalence between CompHaus and commutative unital C*-algebras via C(-)."

/-- Harvard-style problem 5: βN semigroup structure. -/
def bench_harvard_semigroup : String :=
  "Show: βN carries a right-topological semigroup structure extending addition on N. Use for Hindman's theorem."

def main : IO Unit := do
  IO.println "mini-stone-cech-compactification: Harvard benchmark"
  IO.println s!"  Problem 1: {bench_harvard_adjoint}"
  IO.println s!"  Problem 2: {bench_harvard_projective}"
  IO.println s!"  Problem 3: {bench_harvard_fspace}"
  IO.println s!"  Problem 4: {bench_harvard_gelfand}"
  IO.println s!"  Problem 5: {bench_harvard_semigroup}"
  return ()

#eval main
