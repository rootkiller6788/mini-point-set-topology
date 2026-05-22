/-
# MiniTopologicalSpaces: Bridge to Metrizable Spaces

Metrizable spaces and the Urysohn metrization theorem: connections
between topology and metric space theory.
-/

import MiniTopologicalSpaces.Core.Basic
import MiniTopologicalSpaces.Properties.Invariants
import MiniTopologicalSpaces.Theorems.Basic

namespace MiniTopologicalSpaces

/-! ## Metric Space

A metric on X is a function d : X × X → ℝ satisfying:
1. d(x,y) ≥ 0, with d(x,y) = 0 iff x = y
2. d(x,y) = d(y,x)
3. d(x,z) ≤ d(x,y) + d(y,z)
-/

structure MetricSpace (X : Type u) where
  dist : X → X → ℝ
  nonneg : ∀ x y, dist x y ≥ 0
  eq_zero : ∀ x y, dist x y = 0 ↔ x = y
  symm : ∀ x y, dist x y = dist y x
  triangle : ∀ x y z, dist x z ≤ dist x y + dist y z

/-! ## Metric Topology

A metric induces a topology where a set U is open iff for
every x ∈ U there exists ε > 0 such that B(x, ε) ⊆ U.
-/

def metricTopology {X : Type u} (m : MetricSpace X) : TopologicalSpace X where
  opens := {U | ∀ x ∈ U, ∃ ε > 0, ∀ y, m.dist x y < ε → y ∈ U}
  contains_univ := by
    intro x hx; refine ⟨1, by norm_num, λ y hy => Set.mem_univ y⟩
  contains_empty := by
    intro x hx; exact hx.elim
  closed_under_union 𝒰 h := by
    intro x hx; rcases hx with ⟨U, hU, hxU⟩
    rcases h hU x hxU with ⟨ε, hε, hball⟩
    refine ⟨ε, hε, λ y hy => ⟨U, hU, hball y hy⟩⟩
  closed_under_inter U₁ U₂ hU₁ hU₂ := by
    intro x hx; rcases hx with ⟨hx₁, hx₂⟩
    rcases hU₁ x hx₁ with ⟨ε₁, hε₁, hball₁⟩
    rcases hU₂ x hx₂ with ⟨ε₂, hε₂, hball₂⟩
    let ε := min ε₁ ε₂
    have hε : ε > 0 := lt_min_iff.mpr ⟨hε₁, hε₂⟩
    refine ⟨ε, hε, λ y hy =>
      ⟨hball₁ y (lt_of_lt_of_le hy (min_le_left _ _)),
       hball₂ y (lt_of_lt_of_le hy (min_le_right _ _))⟩⟩

/-! ## Metrizable Space

A topological space is metrizable if its topology is induced
by some metric.
-/

def Metrizable (X : Type u) [t : TopologicalSpace X] : Prop :=
  ∃ (m : MetricSpace X), t.opens = (metricTopology m).opens

/-! ## Urysohn Metrization Theorem

Every second-countable regular T₁ space is metrizable.
-/

def T1Space (X : Type u) [t : TopologicalSpace X] : Prop :=
  ∀ x y : X, x ≠ y → ∃ U ∈ t.opens, x ∈ U ∧ y ∉ U

def Regular (X : Type u) [t : TopologicalSpace X] : Prop :=
  ∀ (x : X) (F : Set X), (Set.univ \ F) ∈ t.opens → x ∉ F →
    ∃ (U V : Set X), U ∈ t.opens ∧ V ∈ t.opens ∧ x ∈ U ∧ F ⊆ V ∧ U ∩ V = ∅

theorem urysohn_metrization (X : Type u) [t : TopologicalSpace X]
    (h_T1 : T1Space X) (h_regular : Regular X) (h_second : SecondCountable X) :
    Metrizable X := by
  sorry

#eval "── Bridges/ToTopology: metrizable spaces ──"
#check MetricSpace
#check metricTopology
#check Metrizable
#check urysohn_metrization
#eval "Urysohn metrization: second-countable regular T₁ => metrizable"

end MiniTopologicalSpaces
