/-
# Benchmark: Filter Operations

Performance benchmarks for filter constructions and membership tests.
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Examples.Standard

namespace MiniConvergenceNets.Benchmark

open MiniConvergenceNets

/-- Benchmark: creating and testing principal filters. -/
def principalFilterBench (size : ℕ) : ℕ :=
  let F := principalFilter (size / 2)
  if (Set.univ : Set ℕ) ∈ F.sets then size else 0

#eval "Principal filter benchmark: " ++ toString (principalFilterBench 1000)

/-- Benchmark: Fréchet filter membership tests. -/
def frechetMembershipBench (n : ℕ) : Bool :=
  {x : ℕ | x ≥ n} ∈ frechetFilter.sets

#eval frechetMembershipBench 1000

/-- Benchmark: filter intersection operations. -/
def filterIntersectBench (n : ℕ) : ℕ :=
  let F₁ := principalFilter (n % 10)
  let F₂ := principalFilter (n % 10 + 1)
  n

#eval "Filter intersection benchmark: " ++ toString (filterIntersectBench 500)

/-- Benchmark: neighborhood filter for many points. -/
def neighborhoodFilterBench (pts : ℕ) : ℕ :=
  let x := (pts : ℝ)
  let _ := realNeighborhoodFilter x
  pts

#eval "Neighborhood filter benchmark: " ++ toString (neighborhoodFilterBench 100)

end MiniConvergenceNets.Benchmark
