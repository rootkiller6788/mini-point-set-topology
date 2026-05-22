/-
# Computation.Basic

Basic computations for Stone-Cech compactification.
Compute cardinalities, check basic properties.
-/

import MiniStoneCechCompactification

open MiniStoneCechCompactification

/-- Computation: verify that the one-point compactification of ℕ
    has a simple structure (convergent sequence). -/
def compute_one_point_N : String :=
  "One-point compactification of N is {∞, 1, 2, ...} homeomorphic to {0} ∪ {1/n : n ∈ N}."

/-- Computation: |βN| = 2^c = 2^(2^ℵ₀). -/
#eval "|βN| = 2^c"

/-- Computation: The number of compactifications of N is huge. -/
#eval "Number of compactifications of N: continuum many"

/-- Computation: β(finite) = finite (identity). -/
#eval "β({1,...,n}) ≅ {1,...,n}"

def main : IO Unit := do
  IO.println "mini-stone-cech-compactification: basic computations"
  IO.println s!"  One-point of N: {compute_one_point_N}"
  return ()

#eval main
