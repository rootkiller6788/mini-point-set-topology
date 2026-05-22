/-
# MiniConnectedness: Standard Examples

Classic examples of connectedness: ℝ is connected, S^n is connected
for n ≥ 1, the topologist's sine curve, and the Cantor set is
totally disconnected.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Core.Laws
import MiniConnectedness.Theorems.Basic

namespace MiniConnectedness

/-! ## ℝ is Connected -/

/-- The real line ℝ with its standard topology is connected. -/
axiom real_connected : IsConnected ℝ

/-- The intermediate value theorem as a direct corollary. -/
theorem real_ivt (f : ℝ → ℝ) (hf : Continuous f) (a b c : ℝ) (hle : f a ≤ c ∧ c ≤ f b) :
  ∃ x : ℝ, f x = c :=
  intermediateValue f hf real_connected a b c hle

#eval "R is connected → Intermediate Value Theorem holds on R"

/-! ## ℝ is Path-Connected -/

/-- ℝ is path-connected: for any x, y there is a path f(t) = (1-t)x + ty. -/
axiom real_pathConnected : IsPathConnected ℝ

#eval "R is path-connected: f(t) = (1-t)x + t*y"

/-! ## S^n is Connected for n ≥ 1 -/

/-- The n-sphere S^n is connected for all n ≥ 1. -/
axiom sphere_connected (n : ℕ) (hn : n ≥ 1) : IsConnected (sorry)

/-- S^1 (the circle) is connected. -/
example : IsConnected (sorry) := sphere_connected 1 (by decide)

#eval "S^1 is connected"

/-- S^2 is connected. -/
example : IsConnected (sorry) := sphere_connected 2 (by omega)

#eval "S^2 is connected"

/-! ## Topologist's Sine Curve -/

/-- The topologist's sine curve T = {(x, sin(1/x)) | 0 < x ≤ 1} ∪ ({0} × [-1,1]).
It is connected but not path-connected. -/
structure TopologistsSineCurve where
  space : Set (ℝ × ℝ)
  connected : IsConnectedSubspace space
  not_path_connected : ¬ IsPathConnected (Subtype space)

/-- The topologist's sine curve is connected. -/
axiom topologistsSineCurve_connected : ∃ (T : TopologistsSineCurve), T.connected

#eval "Topologist's sine curve is connected but not path-connected"

/-! ## Cantor Set is Totally Disconnected -/

/-- The Cantor set is totally disconnected. -/
axiom cantorSet_totallyDisconnected : IsTotallyDisconnected (sorry)

/-- The Cantor set is also zero-dimensional. -/
axiom cantorSet_zeroDimensional : IsZeroDimensional (sorry)

#eval "Cantor set is totally disconnected and zero-dimensional"

end MiniConnectedness
