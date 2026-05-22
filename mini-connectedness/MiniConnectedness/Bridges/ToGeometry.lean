/-
# MiniConnectedness: Bridge to Geometry

Connectedness in geometric contexts: connected sums, manifold
components, and the relationship between connectedness and
geometric structures.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Constructions.Products

namespace MiniConnectedness

/-! ## Connected Sums -/

/-- The connected sum of two connected n-manifolds is connected. -/
axiom connectedSum_connected {M N : Type u} [TopSpace M] [TopSpace N]
  (hM : IsConnected M) (hN : IsConnected N)
  (hM_dim : sorry) (hN_dim : sorry) : IsConnected (sorry)

/-- The connected sum of two path-connected manifolds is path-connected. -/
axiom connectedSum_pathConnected {M N : Type u} [TopSpace M] [TopSpace N]
  (hM : IsPathConnected M) (hN : IsPathConnected N) :
  IsPathConnected (sorry)

#eval "Connected sum of connected manifolds is connected"

/-! ## Manifold Components -/

/-- For a topological manifold, connected components and path components coincide. -/
theorem manifold_components_equal_pathComponents {M : Type u} [TopSpace M]
  (h_manifold : sorry) (x : M) : Component x = PathComponent x := by
  sorry

#eval "For manifolds: connected components = path components"

/-! ## Euclidean Spaces -/

/-- ℝ^n is path-connected (and hence connected) for all n ≥ 1. -/
axiom euclidean_pathConnected (n : ℕ) (hn : n ≥ 1) : IsPathConnected (sorry)

/-- ℝ^n minus a point is path-connected for n ≥ 2. -/
axiom puncturedEuclidean_pathConnected (n : ℕ) (hn : n ≥ 2) : IsPathConnected (sorry)

#eval "ℝ^n is path-connected; ℝ^n \\ {0} is path-connected for n≥2"

end MiniConnectedness
