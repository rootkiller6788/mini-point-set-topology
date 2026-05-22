/-
# MiniTopologicalSpaces: Bridge to Computation

Finite topological spaces, digital topology, and computational
topology — applications to computer science and data analysis.
-/

import MiniTopologicalSpaces.Core.Basic
import MiniTopologicalSpaces.Properties.ClassificationData

namespace MiniTopologicalSpaces

/-! ## Finite Topological Spaces

A finite topological space is completely determined by its
specialization preorder: x ≤ y iff x ∈ cl({y}).
-/

def specializationPreorder {X : Type u} [t : TopologicalSpace X] (x y : X) : Prop :=
  x ∈ closure X {y}

/-! ## Finite Space from Preorder

Every finite preordered set (X, ≤) gives a topology where
open sets are the upper sets: U is open iff x ∈ U and x ≤ y
implies y ∈ U.
-/

def topologyFromPreorder {X : Type u} [DecidableEq X] (R : X → X → Prop)
    [hR : IsPreorder X R] : TopologicalSpace X where
  opens := {U | ∀ x ∈ U, ∀ y, R x y → y ∈ U}
  contains_univ := by
    intro x hx y hRxy; exact Set.mem_univ y
  contains_empty := by
    intro x hx; exact hx.elim
  closed_under_union 𝒰 h := by
    intro x hx y hRxy
    rcases hx with ⟨U, hU, hxU⟩
    have hU_open : U ∈ {U | ∀ x ∈ U, ∀ y, R x y → y ∈ U} := h hU
    exact ⟨U, hU, hU_open x hxU y hRxy⟩
  closed_under_inter U₁ U₂ hU₁ hU₂ := by
    intro x hx y hRxy
    rcases hx with ⟨hx₁, hx₂⟩
    have hU₁_open := hU₁
    have hU₂_open := hU₂
    exact ⟨hU₁_open x hx₁ y hRxy, hU₂_open x hx₂ y hRxy⟩

/-! ## Digital Topology

The digital plane ℤ² with the Khalimsky topology is a model
for digital images used in computer vision.
-/

/-! ## Persistent Homology (placeholder)

Persistent homology is a method for computing topological
features of data at different scales, used in topological
data analysis (TDA).
-/

structure PersistentHomologyParams where
  maxDimension : ℕ
  maxFiltration : ℝ

def computePersistence (data : List (List ℝ)) (params : PersistentHomologyParams) : String :=
  s!"Persistent homology: dim≤{params.maxDimension}, ε≤{params.maxFiltration}"
  ++ s!" on {data.length} points"

#eval "── Bridges/ToComputation: digital topology ──"
#check specializationPreorder
#check topologyFromPreorder
#check computePersistence
#eval "Finite topological spaces via specialization preorder"
#eval computePersistence [[1.0, 2.0], [3.0, 4.0]] { maxDimension := 2, maxFiltration := 1.0 }

end MiniTopologicalSpaces
