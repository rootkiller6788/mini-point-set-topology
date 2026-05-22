/-
# MiniTopologicalSpaces: Bridge to Geometry

Topological manifolds as topological spaces: manifolds of
dimension n are locally homeomorphic to ℝⁿ, Hausdorff,
and second-countable.
-/

import MiniTopologicalSpaces.Core.Basic
import MiniTopologicalSpaces.Morphisms.Iso
import MiniTopologicalSpaces.Properties.Invariants

namespace MiniTopologicalSpaces

/-! ## Topological Manifold

An n-dimensional topological manifold is a second-countable
Hausdorff space where every point has a neighborhood
homeomorphic to ℝⁿ.
-/

def TopologicalManifold (X : Type u) [t : TopologicalSpace X] (n : ℕ) : Prop :=
  Hausdorff X ∧ SecondCountable X ∧
    ∀ x : X, ∃ (U : Set X), U ∈ t.opens ∧ x ∈ U ∧
      Homeomorphic U (Set.univ : Set (Fin n → ℝ))

/-! ## Manifold with Boundary

A manifold with boundary allows neighborhoods homeomorphic
to either ℝⁿ or the half-space ℍⁿ = {x ∈ ℝⁿ | xₙ ≥ 0}.
-/

def HalfSpace (n : ℕ) : Set (Fin n → ℝ) :=
  {f | f ⟨0, by decide⟩ ≥ 0}

def ManifoldWithBoundary (X : Type u) [t : TopologicalSpace X] (n : ℕ) : Prop :=
  Hausdorff X ∧ SecondCountable X ∧
    ∀ x : X, ∃ (U : Set X), U ∈ t.opens ∧ x ∈ U ∧
      (Homeomorphic U (Set.univ : Set (Fin n → ℝ)) ∨
       Homeomorphic U (HalfSpace n))

/-! ## Charts and Atlases

A chart is a homeomorphism from an open set of X to an
open set of ℝⁿ. An atlas is a collection of charts covering X.
-/

structure Chart (X : Type u) [t : TopologicalSpace X] (n : ℕ) where
  source : Set X
  source_open : source ∈ t.opens
  target : Set (Fin n → ℝ)
  target_open : target ∈ (metricTopology (default : MetricSpace (Fin n → ℝ))).opens
  homeo : Homeomorphic source target

structure Atlas (X : Type u) [t : TopologicalSpace X] (n : ℕ) where
  charts : Set (Chart X n)
  covers : ⋃ (c : Chart X n) (h : c ∈ charts), c.source = Set.univ

#eval "── Bridges/ToGeometry: topological manifolds ──"
#check TopologicalManifold
#check HalfSpace
#check Chart
#check Atlas
#eval "Topological manifold, chart, atlas defined"

end MiniTopologicalSpaces
