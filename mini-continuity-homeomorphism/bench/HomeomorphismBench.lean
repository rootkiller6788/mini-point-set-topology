import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Core.Laws
import MiniContinuityHomeomorphism.Morphisms.Iso

/-!
# Benchmark: Homeomorphism Operations

Benchmarks for homeomorphism construction, inversion, and composition.
-/

open MiniContinuityHomeomorphism

set_option maxRecDepth 100000

/-- Benchmark: constructing homeomorphisms. -/
def bench_homeoConstruction (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ : Homeomorphism Nat Nat := homeomorphismRefl _
    pure ()

/-- Benchmark: inverting homeomorphisms repeatedly. -/
def bench_homeoInversion (n : Nat) : Homeomorphism Nat Nat :=
  let h : Homeomorphism Nat Nat := homeomorphismRefl _
  List.range n |>.foldl (fun acc _ => homeomorphismSymm acc) h

/-- Benchmark: composing homeomorphisms. -/
def bench_homeoComposition (n : Nat) : Homeomorphism Nat Nat :=
  List.range n |>.foldl (fun acc _ => homeomorphismTrans acc (homeomorphismRefl _))
    (homeomorphismRefl _)

/-- Benchmark: homeomorphism group operations. -/
def bench_homeoGroupOps (n : Nat) : Homeomorphism Nat Nat :=
  List.range n |>.foldl (fun acc _ =>
    HomeoGroup.mul (HomeoGroup.inv acc) acc) HomeoGroup.one

/-- Benchmark: evaluating a homeomorphism composed n times. -/
def bench_homeoEval (n : Nat) : Nat :=
  let h : Homeomorphism Nat Nat := homeomorphismRefl _
  (bench_homeoComposition n).toFun 0

section evals

#eval "bench_homeomorphism : benchmarks for homeomorphism operations loaded"

#eval bench_homeoEval 10

#eval (bench_homeoInversion 5).toFun 0

end evals
