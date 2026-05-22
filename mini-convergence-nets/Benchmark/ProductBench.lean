/-
# Benchmark: Product Constructions

Performance benchmarks for product nets, filters, and Tychonoff.
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Constructions.Products

namespace MiniConvergenceNets.Benchmark

open MiniConvergenceNets

/-- Benchmark: product of large directed sets. -/
def productDirectedBench (n m : ℕ) : DirectedSet (ℕ × ℕ) :=
  directedProduct ℕdir ℕdir

#eval "Product directed benchmark: " ++ toString ((productDirectedBench 100 200).le (50, 50) (100, 100))

/-- Benchmark: product net construction. -/
def productNetBench (size : ℕ) : ℕ :=
  let φ := createLargeNet size
  let ψ := createLargeNet (size / 2)
  let _ := productNet φ ψ
  size

#eval "Product net benchmark: " ++ toString (productNetBench 100)

/-- Benchmark: product filter creation. -/
def productFilterBench (n : ℕ) : ℕ :=
  let F := principalFilter (n % 10)
  let G := principalFilter (n % 10 + 1)
  let _ := productFilter F G
  n

#eval "Product filter benchmark: " ++ toString (productFilterBench 500)

end MiniConvergenceNets.Benchmark
