/-
# Benchmark: Net Operations

Performance benchmarks for net constructions and convergence checks.
-/

import MiniConvergenceNets.Core.Basic

namespace MiniConvergenceNets.Benchmark

open MiniConvergenceNets

def largeDirectedSet : DirectedSet ℕ := ℕdir

/-- Benchmark: creating a large net. -/
def createLargeNet (size : ℕ) : Net ℕ ℕ :=
  { dir := largeDirectedSet, f := λ n => n % size }

#eval "CreateNet 1000: " ++ toString ((createLargeNet 1000).f 500)

/-- Benchmark: checking eventual membership. -/
def checkEventually (n : ℕ) : Bool :=
  let φ := createLargeNet n
  φ.eventually {x | x < n}

#eval checkEventually 100

/-- Benchmark: net to filter conversion for large nets. -/
def netToFilterBench (size : ℕ) : ℕ :=
  let φ := createLargeNet size
  let F := Net.toFilter φ
  size

#eval "Net to filter conversion: " ++ toString (netToFilterBench 100)

end MiniConvergenceNets.Benchmark
