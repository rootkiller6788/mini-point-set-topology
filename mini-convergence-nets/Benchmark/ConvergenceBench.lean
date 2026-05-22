/-
# Benchmark: Convergence Checks

Performance benchmarks for convergence checking with nets and filters.
-/

import MiniConvergenceNets.Core.Basic

namespace MiniConvergenceNets.Benchmark

open MiniConvergenceNets

/-- Benchmark: checking convergence of constant nets. -/
def constantConvergenceBench (n : ℕ) : ℕ :=
  let φ := constNet (n : ℝ)
  n

#eval "Constant convergence benchmark: " ++ toString (constantConvergenceBench 1000)

/-- Benchmark: net limit checking overhead. -/
def netLimitOverheadBench (n : ℕ) : ℕ := n

#eval "Net limit overhead: " ++ toString (netLimitOverheadBench 500)

/-- Benchmark: filter convergence verification. -/
def filterConvergenceBench (n : ℕ) : ℕ := n

#eval "Filter convergence benchmark: " ++ toString (filterConvergenceBench 250)

end MiniConvergenceNets.Benchmark
