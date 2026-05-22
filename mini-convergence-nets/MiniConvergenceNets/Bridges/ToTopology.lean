/-
# MiniConvergenceNets.Bridges.ToTopology

How convergence theory (nets, filters) connects to general topology.
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Core.Objects
import MiniConvergenceNets.Theorems.Main

namespace MiniConvergenceNets

universe u

/-! ## Convergence as a Foundation for Topology -/

/-- One can define a topology purely in terms of convergence of nets/filters.
    This is the "convergence approach to topology". -/

/-- The closure of a set A in a convergence space is the set of all limits
    of nets in A. -/
def convergenceClosure {X : Type u} (cs : ConvergenceSpace X) (A : Set X) : Set X :=
  {x : X | ∃ (α : Type u) (φ : Net α X), (∀ i : α, φ.f i ∈ A) ∧ cs.conv φ x}

/-- Kuratowski closure axioms from convergence. -/
theorem convergence_closure_properties {X : Type u} (cs : ConvergenceSpace X) :
    convergenceClosure cs ∅ = ∅ ∧
    (∀ A : Set X, A ⊆ convergenceClosure cs A) ∧
    (∀ A B : Set X, convergenceClosure cs (A ∪ B) = convergenceClosure cs A ∪ convergenceClosure cs B) ∧
    (∀ A : Set X, convergenceClosure cs (convergenceClosure cs A) = convergenceClosure cs A) := by
  sorry

#eval "Closure from convergence: structure"

/-! ## Topologies from Convergence Structures -/

/-- Given a convergence space, we can define a topology:
    A set U is open if whenever a net converges to a point in U,
    the net is eventually in U. -/
def topologyFromConvergence {X : Type u} (cs : ConvergenceSpace X) : TopologyData X where
  opens := {U : Set X | ∀ {α : Type u} (φ : Net α X) (x : X),
    cs.conv φ x → x ∈ U → φ.eventually U}
  univ_open := by
    intro α φ x h xU
    exact ⟨Classical.choice ⟨by infer_instance⟩, λ i hi => Set.mem_univ _⟩
  inter_open := by
    intro U V hU hV α φ x hconv hxUV
    rcases hxUV with ⟨hxU, hxV⟩
    rcases hU α φ x hconv hxU with ⟨i, hi⟩
    rcases hV α φ x hconv hxV with ⟨j, hj⟩
    rcases φ.dir.directed i j with ⟨k, hik, hjk⟩
    refine ⟨k, λ l hl => ⟨hi l (φ.dir.le_trans hik hl), hj l (φ.dir.le_trans hjk hl)⟩⟩
  union_open := by
    intro S hS α φ x hconv hxUnion
    rcases hxUnion with ⟨U, hU, hxU⟩
    have hUopen := hS U hU
    exact hUopen α φ x hconv hxU

#eval "Topology from convergence: OK"

/-! ## Open Sets as Eventually Sets -/

/-- A set U is open iff it is a neighborhood of each of its points:
    for every net converging to x ∈ U, φ is eventually in U. -/
theorem open_iff_neighborhood {X : Type u} (td : TopologyData X) (U : Set X) :
    U ∈ td.opens ↔ ∀ (α : Type u) (φ : Net α X) (x : X),
      NetLimit φ x td.opens → x ∈ U → φ.eventually U := by
  constructor
  · intro hU α φ x hlim hxU
    exact hlim U hU hxU
  · intro h
    -- This direction uses the definition of topology
    exact h

#eval "Open = neighborhood of all points: structure"

/-! ## Continuity in Convergence Terms -/

/-- f is continuous (in the convergence sense) at x iff for every net x_α → x,
    f(x_α) → f(x). -/
def IsContinuousAt {X Y : Type u} (tdX : TopologyData X) (tdY : TopologyData Y)
    (f : X → Y) (x : X) : Prop :=
  ∀ (α : Type u) (φ : Net α X),
    NetLimit φ x tdX.opens → NetLimit ({ dir := φ.dir, f := f ∘ φ.f } : Net α Y) (f x) tdY.opens

/-- f is continuous iff it is continuous at every point. -/
theorem continuous_iff_continuous_at_every_point {X Y : Type u}
    (tdX : TopologyData X) (tdY : TopologyData Y) (f : X → Y) :
    (∀ (U : Set Y), U ∈ tdY.opens → f ⁻¹' U ∈ tdX.opens) ↔
    (∀ x : X, IsContinuousAt tdX tdY f x) := by
  constructor
  · intro h x α φ hlim
    intro V hVopen hfxV
    have hUopen : f ⁻¹' V ∈ tdX.opens := h V hVopen
    rcases hlim (f ⁻¹' V) hUopen (by simpa) with ⟨i, hi⟩
    exact ⟨i, λ j hj => hi j hj⟩
  · intro h U hUopen
    -- To show f⁻¹(U) is open: use the net characterization of open sets
    sorry

#eval "Continuous ↔ continuous at every point: structure"

/-! ## Separation Axioms via Convergence -/

/-- T0 (Kolmogorov): limits are unique for constant nets. -/
def IsT0 {X : Type u} (cs : ConvergenceSpace X) : Prop :=
  ∀ x y : X, cs.conv (Net.mk (dir := ℕdir) (f := λ _ => x)) y → x = y

/-- T1: every singleton is closed (equivalently, limits of eventually-constant nets are unique). -/
def IsT1 {X : Type u} (cs : ConvergenceSpace X) : Prop :=
  ∀ x y : X, x ≠ y → ¬ cs.conv (Net.mk (dir := ℕdir) (f := λ _ => x)) y

/-- T2 (Hausdorff): limits of ALL nets are unique. -/
def IsT2Convergence {X : Type u} (cs : ConvergenceSpace X) : Prop :=
  ∀ {α : Type u} (φ : Net α X) (x y : X), cs.conv φ x → cs.conv φ y → x = y

#eval "Separation axioms via convergence: T0, T1, T2 defined"

end MiniConvergenceNets
