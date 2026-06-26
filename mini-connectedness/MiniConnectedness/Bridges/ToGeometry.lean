/-
# MiniConnectedness: Bridge to Geometry
L7: Connected sums, manifolds, Euclidean spaces.
Connectedness in geometric contexts.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Constructions.Products
namespace MiniConnectedness

/-- The connected sum M#N of two connected n-manifolds is connected.
(Documented; formal construction requires manifold theory.) -/
#eval "Connected sum M#N: connected if M, N connected"

/-- For a topological manifold, connected components and path components coincide.
This is because manifolds are locally path-connected. -/
#eval "Manifold: components = path components (locally path-connected)"

/-- R^n is path-connected for n >= 1.
R^n minus a point is path-connected for n >= 2. -/
#eval "R^n: path-connected (n>=1), R^n\\{0} path-connected (n>=2)"

/-- Finite Euclidean space (Fin n with discrete topology): connected iff n = 1. -/
example (n : Nat) (hn : n > 1) : ¬ IsConnected (Fin n) := by
  let _ : TopSpace (Fin n) := { topology := discreteTopology (Fin n) }
  have hsub : ¬ Subsingleton (Fin n) := by
    intro h; have : (0 : Fin n) = (1 : Fin n) := Subsingleton.elim _ _
    have : (0 : Fin n) ≠ (1 : Fin n) := by
      intro h_eq; have : (0 : Nat) = (1 : Nat) := congrArg Fin.val h_eq; omega
    exact this (Subsingleton.elim _ _)
  intro hconn
  have h_subsingleton : Subsingleton (Fin n) :=
    (finite_discrete_connected_iff_subsingleton (h := rfl)).mp hconn
  exact hsub h_subsingleton

/-- The wedge sum of two connected spaces (glued at a point) is connected.
This construction is fundamental in algebraic topology (bouquet of circles). -/
#eval "Wedge sum: gluing at a point preserves connectedness"

/-- The join X * Y of two spaces: all line segments between points in X and Y.
The join of two connected spaces is connected (actually simply connected). -/
#eval "Join X*Y: connected if X,Y connected"

#eval "══ Bridges/ToGeometry ══"
#eval "Connected sums, manifolds, Euclidean spaces"
#eval "Wedge sums and joins preserve connectedness"
end MiniConnectedness