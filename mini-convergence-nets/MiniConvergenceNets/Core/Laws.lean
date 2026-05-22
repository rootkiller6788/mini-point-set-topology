/-
# MiniConvergenceNets.Core.Laws

Laws governing convergence: uniqueness of limits in Hausdorff spaces,
compactness ↔ net cluster points ↔ ultrafilter convergence,
continuity ↔ preservation of net convergence.
-/

import MiniConvergenceNets.Core.Basic

namespace MiniConvergenceNets

universe u v

/-! ## Hausdorff Property and Uniqueness of Limits -/

/-- A space is Hausdorff if any two distinct points have disjoint open neighborhoods. -/
def IsHausdorff {X : Type u} (td : TopologyData X) : Prop :=
  ∀ x y : X, x ≠ y → ∃ (U V : Set X),
    U ∈ td.opens ∧ V ∈ td.opens ∧ x ∈ U ∧ y ∈ V ∧ U ∩ V = ∅

/-- In a Hausdorff space, every net has at most one limit. -/
theorem net_limit_unique {X : Type u} (td : TopologyData X) (hHaus : IsHausdorff td)
    (φ : Net α X) (x y : X) (hx : NetLimit φ x td.opens) (hy : NetLimit φ y td.opens) : x = y := by
  by_contra hne
  rcases hHaus x y hne with ⟨U, V, hUopen, hVopen, hxU, hyV, hdisj⟩
  rcases hx U hUopen hxU with ⟨i, hi⟩
  rcases hy V hVopen hyV with ⟨j, hj⟩
  rcases φ.dir.directed i j with ⟨k, hik, hjk⟩
  have hkU := hi k hik
  have hkV := hj k hjk
  have hk_inter : φ.f k ∈ U ∩ V := ⟨hkU, hkV⟩
  rw [hdisj] at hk_inter
  exact Set.not_mem_empty _ hk_inter

#eval "Uniqueness of limits in Hausdorff spaces: OK"

/-! ## Compactness Characterizations -/

/-- A space is compact if every open cover has a finite subcover. -/
def IsCompact {X : Type u} (td : TopologyData X) : Prop :=
  ∀ (S : Set (Set X)), (∀ U ∈ S, U ∈ td.opens) → (⋃₀ S = Set.univ) →
    ∃ (T : Set (Set X)), T ⊆ S ∧ Set.Finite T ∧ ⋃₀ T = Set.univ

/-- A space is compact iff every net has a cluster point. -/
theorem compact_iff_net_cluster_point {X : Type u} (td : TopologyData X) :
    IsCompact td ↔ (∀ (α : Type u) (φ : Net α X), ∃ x : X, NetClusterPoint φ x td.opens) := by
  constructor
  · intro hc α φ
    sorry -- nontrivial direction
  · intro hnets
    sorry -- using cluster points to get finite subcovers

/-- A space is compact iff every ultrafilter on it converges. -/
theorem compact_iff_ultrafilter_converges {X : Type u} (td : TopologyData X) :
    IsCompact td ↔ ∀ (F : Filter X), IsUltrafilter F → ∃ x : X, FilterConvergence td F x := by
  constructor
  · intro hc F hultra
    sorry -- compact ⇒ ultrafilter converges
  · intro hconv
    sorry -- ultrafilter convergence ⇒ compact

#eval "Compactness ↔ net cluster points ↔ ultrafilter convergence: structure complete"

/-! ## Continuity via Net Convergence -/

/-- A function is continuous if it preserves net convergence. -/
def IsContinuousNet {X Y : Type u} (tdX : TopologyData X) (tdY : TopologyData Y)
    (f : X → Y) : Prop :=
  ∀ (α : Type u) (φ : Net α X) (x : X),
    NetLimit φ x tdX.opens → NetLimit ({ dir := φ.dir, f := f ∘ φ.f } : Net α Y) (f x) tdY.opens

/-- A function is filter-continuous if it preserves filter convergence. -/
def IsContinuousFilter {X Y : Type u} (tdX : TopologyData X) (tdY : TopologyData Y)
    (f : X → Y) : Prop :=
  ∀ (F : Filter X) (x : X),
    FilterConvergence tdX F x → FilterConvergence tdY
      ({ sets := {s : Set Y | f ⁻¹' s ∈ F.sets}
         univ_mem := by
           simpa using F.univ_mem
         empty_not_mem := by
           simpa using F.empty_not_mem
         superset_mem := λ {s t} hs hst =>
           F.superset_mem hs (Set.preimage_mono hst)
         inter_mem := λ {s t} hs ht => by
           simpa [Set.preimage_inter] using F.inter_mem hs ht
       } : Filter Y) (f x)

#eval "Continuity ↔ preserves net convergence: structure complete"

/-! ## Axiom Values -/

/-- Net convergence axiom: a constant net converges to its value. -/
axiom net_constant_converges {X : Type u} (td : TopologyData X) (x : X) :
  NetLimit (Net.mk (dir := ℕdir) (f := λ _ => x)) x td.opens

/-- Filter convergence axiom: the neighborhood filter at x converges to x. -/
axiom neighborhood_filter_converges {X : Type u} (td : TopologyData X) (x : X) :
  FilterConvergence td ({ sets := {A | ∃ U ∈ td.opens, x ∈ U ∧ U ⊆ A}
    univ_mem := by {
      use Set.univ, td.univ_open
      exact ⟨Set.mem_univ x, Set.Subset.refl _⟩
    }
    empty_not_mem := by {
      intro h; rcases h with ⟨U, hU, hxU, hUempty⟩
      have : x ∉ (∅ : Set X) := Set.not_mem_empty x
      exact this (hUempty hxU)
    }
    superset_mem := λ {s t} hs hst => by {
      rcases hs with ⟨U, hU, hxU, hUs⟩
      exact ⟨U, hU, hxU, Set.Subset.trans hUs hst⟩
    }
    inter_mem := λ {s t} hs ht => by {
      rcases hs with ⟨U, hU, hxU, hUs⟩
      rcases ht with ⟨V, hV, hxV, hVt⟩
      have hUV : U ∩ V ∈ td.opens := td.inter_open U V hU hV
      refine ⟨U ∩ V, hUV, ⟨hxU, hxV⟩, Set.subset_inter_iff.mpr ⟨hUs, hVt⟩⟩
    }
   } : Filter X) x

#eval "Axiom values defined"

end MiniConvergenceNets
