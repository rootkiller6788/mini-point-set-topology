import MiniContinuityHomeomorphism.Properties.ClassificationData
import MiniContinuityHomeomorphism.Theorems.Classification
import MiniContinuityHomeomorphism.Morphisms.Iso
import MiniContinuityHomeomorphism.Morphisms.Equiv

/-!
# Benchmark: Classification Operations

Benchmarks for classification data structures and mapping class group operations.
-/

open MiniContinuityHomeomorphism

set_option maxRecDepth 100000

/-- Benchmark: constructing surface classification data. -/
def bench_surfaceData (n : Nat) : List SurfaceClassificationData :=
  List.range n |>.map fun g => {
    orientable := g % 2 = 0
    genus := g / 2
    eulerChar := if g % 2 = 0 then 2 - 2*(g/2) else 2 - (g/2)
  }

/-- Benchmark: computing invariants. -/
def bench_invariants (n : Nat) : List (ℕ × ℤ) :=
  List.range n |>.map fun g =>
    (bettiNumberInvariant (X := Nat) g, eulerCharacteristicInvariant (X := Nat))

/-- Benchmark: mapping class group operations. -/
def bench_mappingClassGroup (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ : Type := mappingClassGroup Nat
    pure ()

/-- Benchmark: classification theorem statement traversal. -/
def bench_classificationStatements (n : Nat) : IO Unit := do
  for _ in List.range n do
    let _ := classification_of_closed_surfaces
    let _ := mapping_class_group_of_torus
    let _ := mapping_class_group_of_sphere
    pure ()

/-- Benchmark: homeomorphism type comparison. -/
def bench_homeoCheck (n : Nat) : IO Unit := do
  for _ in List.range n do
    let h : Homeomorphism Nat Nat := homeomorphismRefl _
    let _ : Homeomorphism Nat Nat := homeomorphismSymm h
    pure ()

section evals

#eval "bench_classification : classification benchmarks loaded"

#eval (bench_surfaceData 3).length

#eval (bench_invariants 5).length

end evals
