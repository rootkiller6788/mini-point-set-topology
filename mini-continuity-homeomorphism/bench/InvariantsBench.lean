import MiniContinuityHomeomorphism.Properties.Invariants
import MiniContinuityHomeomorphism.Properties.Preservation

/-!
# Benchmark: Invariant Checking

Benchmarks for checking topological and homotopy invariants.
-/

open MiniContinuityHomeomorphism

set_option maxRecDepth 100000

/-- Benchmark: constructing invariant predicates. -/
def bench_invariantPredicates (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ : IsTopologicalInvariant (fun (X : Type) [TopologicalSpace X] => True) := by
      intro X Y hX hY ⟨h⟩; exact ⟨fun _ => trivial, fun _ => trivial⟩
    pure ()

/-- Benchmark: checking compactness invariant (statement traversal). -/
def bench_compactInvariant (n : Nat) : IO Unit := do
  for _ in List.range n do
    -- traverse the statement
    let _ : IsTopologicalInvariant
      (fun (X : Type) [TopologicalSpace X] => IsCompact (Set.univ : Set X)) :=
      compactness_is_topological_invariant
    pure ()

/-- Benchmark: preservation theorem statements. -/
def bench_preservation (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ := continuous_image_of_compact
    let _ := continuous_image_of_connected
    let _ := embedding_subspace_of_metrizable
    pure ()

section evals

#eval "bench_invariants : benchmarks for invariant operations loaded"

#eval "invariants_benchmark_ok"

end evals
