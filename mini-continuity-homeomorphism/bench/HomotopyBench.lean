import MiniContinuityHomeomorphism.Morphisms.Hom
import MiniContinuityHomeomorphism.Morphisms.Equiv

/-!
# Benchmark: Homotopy Operations

Benchmarks for homotopy construction and homotopy equivalence reasoning.
-/

open MiniContinuityHomeomorphism

set_option maxRecDepth 100000

/-- Benchmark: constructing constant homotopies. -/
def bench_constantHomotopy (n : Nat) : IO Unit := do
  for _ in List.range n do
    let f : C(Nat, Nat) := .id _
    let _ : Homotopy f f := constantHomotopy f
    pure ()

/-- Benchmark: building homotopy equivalence data. -/
def bench_homotopyEquivalence (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ : HomotopyEquivalence Nat Nat := {
      f := .id _
      g := .id _
      homotopy_comp_left := ⟨constantHomotopy (.id _)⟩
      homotopy_comp_right := ⟨constantHomotopy (.id _)⟩
    }
    pure ()

/-- Benchmark: homotopy evaluation at intermediate times. -/
def bench_homotopyEval (n : Nat) : Nat :=
  let f : C(Nat, Nat) := .id _
  let h : Homotopy f f := constantHomotopy f
  List.range n |>.foldl (fun acc t => acc + h.toFun 0 (t.toFloat / (n.toFloat + 1))) 0

/-- Benchmark: checking Homotopic judgment (trivial). -/
def bench_homotopicCheck (n : Nat) : IO Unit := do
  for _ in List.range n do
    let f : C(Nat, Nat) := .id _
    let _ : Homotopic f f := ⟨constantHomotopy f⟩
    pure ()

section evals

#eval "bench_homotopy : benchmarks for homotopy operations loaded"

#eval bench_homotopyEval 10

#eval "homotopy_benchmark_ok"

end evals
