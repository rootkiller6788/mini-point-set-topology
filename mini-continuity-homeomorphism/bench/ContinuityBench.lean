import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Core.Laws

/-!
# Benchmark: Continuity Operations

Benchmarks for continuous function construction, composition, and evaluation.
-/

open MiniContinuityHomeomorphism

set_option maxRecDepth 100000

/-- Benchmark: constructing many identity continuous functions. -/
def bench_identityConstruction (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ : C(Nat, Nat) := .id _
    pure ()

/-- Benchmark: function composition depth. -/
def bench_compositionDepth (n : Nat) : C(Nat, Nat) :=
  match n with
  | 0 => .id _
  | n+1 => (bench_compositionDepth n).comp (.id _)

/-- Benchmark: evaluating composed functions. -/
def bench_compositionEval (n : Nat) : Nat :=
  let f : C(Nat, Nat) := bench_compositionDepth n
  f 0

/-- Benchmark: constant function construction. -/
def bench_constantConstruction (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ : C(Nat, Nat) := .const 42
    pure ()

/-- Benchmark: FunLike coercion overhead. -/
def bench_coercion (n : Nat) : Nat :=
  let f : C(Nat, Nat) := .id _
  let mut acc := 0
  for _ in List.range n do
    acc := acc + (f : Nat → Nat) acc
  acc

section evals

#eval "bench_continuity : benchmarks for continuity operations loaded"

#eval bench_compositionDepth 10 10

#eval bench_compositionEval 5

end evals
