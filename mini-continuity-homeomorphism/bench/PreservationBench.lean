import MiniContinuityHomeomorphism.Properties.Preservation
import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Constructions.Products

/-!
# Benchmark: Preservation Operations

Benchmarks for preservation-style reasoning: continuous images, embeddings, and
quotients preserving properties.
-/

open MiniContinuityHomeomorphism

set_option maxRecDepth 100000

/-- Benchmark: constructing continuous functions for preservation tests. -/
def bench_preserveConstruct (n : Nat) : List (C(Nat, Nat)) :=
  List.range n |>.map fun _ => .id _

/-- Benchmark: product construction for preservation. -/
def bench_productMaps (n : Nat) : C(Nat × Nat, Nat × Nat) :=
  List.range n |>.foldl (fun acc _ => productMap acc acc) (.id _)

/-- Benchmark: embedding construction. -/
def bench_embedding (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ : Embedding Nat Nat := {
      toFun := id
      continuous_toFun := continuous_id
      injective := fun _ _ h => h
      induced := rfl
    }
    pure ()

/-- Benchmark: quotient map construction. -/
def bench_quotient (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ : QuotientMap Nat Nat id := {
      surjective := fun y => ⟨y, rfl⟩
      quotient_condition := fun U => ⟨fun h => by
        have : id ⁻¹' U = U := rfl
        rw [this]; exact h,
        fun h => by
        have : id ⁻¹' U = U := rfl
        rw [← this]; exact h⟩
    }
    pure ()

section evals

#eval "bench_preservation : preservation benchmarks loaded"

#eval (bench_productMaps 5) (0, 0)

#eval "preservation_benchmark_ok"

end evals
