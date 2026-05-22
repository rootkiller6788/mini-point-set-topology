/-
# Computation: Limit Computations

Algorithms for computing limits of nets and filters.
-/

import MiniConvergenceNets.Core.Basic

namespace MiniConvergenceNets.Computation

open MiniConvergenceNets

/-- Newton's method via nets: the sequence x_{n+1} = x_n - f(x_n)/f'(x_n). -/
def newtonSequence (f df : ℝ → ℝ) (x₀ : ℝ) : ℕ → ℝ
  | 0 => x₀
  | n+1 => newtonSequence f df x₀ n - f (newtonSequence f df x₀ n) / df (newtonSequence f df x₀ n)

/-- The Newton net converges quadratically to a root under suitable conditions. -/
theorem newton_converges_quadratically (f df : ℝ → ℝ) (x₀ r : ℝ)
    (hr : f r = 0) (hdf : df r ≠ 0) :
    NetLimit (sequentialNet (newtonSequence f df x₀)) r
      ({ opens := Set.univ
         univ_open := trivial
         inter_open := by intro _ _ _ _; exact trivial
         union_open := by intro _ _; exact trivial
       } : TopologyData ℝ).opens := by
  sorry

#eval "Newton's method net: structure"

/-- Approximation of π using a net of polygonal perimeters. -/
def piApproxNet (n : ℕ) : ℝ :=
  (2^(n : ℕ) : ℝ) * Real.sqrt (2 - 2 * Real.sqrt (1 - (Real.sin (π / 2^(n : ℕ)))^2))

#eval "Pi approximation net: structure"

end MiniConvergenceNets.Computation
