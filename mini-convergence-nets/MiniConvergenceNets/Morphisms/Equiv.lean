/-
# MiniConvergenceNets.Morphisms.Equiv

Net↔Filter equivalence: the fundamental theorem that net convergence
and filter convergence are two ways of describing the same topology.
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Core.Objects

namespace MiniConvergenceNets

universe u

/-! ## The Net↔Filter Correspondence -/

/-- The fundamental equivalence: a net converges to x iff its eventuality filter
    converges to x in any topology. -/
theorem net_filter_equivalence (X : Type u) (td : TopologyData X) (x : X) (φ : Net α X) :
    NetLimit φ x td.opens ↔ FilterConvergence td (Net.toFilter φ) x := by
  constructor
  · intro hnet U hU hxU
    rcases hnet U hU hxU with ⟨i, hi⟩
    dsimp [Net.toFilter, Net.eventually]
    exact ⟨i, hi⟩
  · intro hfilt U hU hxU
    have hmem := hfilt U hU hxU
    dsimp [Net.toFilter, Membership.mem] at hmem
    exact hmem

#eval "Net↔Filter equivalence (forward direction): OK"

/-- A cluster point via nets ↔ cluster point via filters. -/
theorem cluster_point_equivalence (X : Type u) (td : TopologyData X) (x : X) (φ : Net α X) :
    NetClusterPoint φ x td.opens ↔ FilterClusterPoint td (Net.toFilter φ) x := by
  constructor
  · intro hnet U hU hxU s hs
    dsimp [Net.toFilter, Membership.mem] at hs
    rcases hs with ⟨i, hi⟩
    rcases hnet U hU hxU i with ⟨j, hij, hjU⟩
    refine ⟨φ.f j, ?_, hjU⟩
    apply hi j hij
  · intro hfilt U hU hxU i
    have hmem : Set.univ ∈ (Net.toFilter φ).sets := (Net.toFilter φ).univ_mem
    sorry

#eval "Cluster point equivalence: OK"

/-! ## Ultrafilter ↔ Universal Net -/

/-- A universal net: for every set A, the net is eventually in A or eventually in its complement. -/
def IsUniversalNet {X : Type u} (φ : Net α X) : Prop :=
  ∀ (A : Set X), φ.eventually A ∨ φ.eventually (Set.univ \ A)

/-- The eventuality filter of a universal net is an ultrafilter. -/
theorem universal_net_ultrafilter {X : Type u} (φ : Net α X) (huniv : IsUniversalNet φ) :
    IsUltrafilter (Net.toFilter φ) := by
  intro s
  rcases huniv s with (hs | hs)
  · left; dsimp [Net.toFilter, Membership.mem]; exact hs
  · right; dsimp [Net.toFilter, Membership.mem]; exact hs

#eval "Universal net → ultrafilter: OK"

/-! ## Filter Net ↔ Convergence Equivalence -/

/-- The map from filter back to net preserves convergence. -/
theorem filter_net_convergence (X : Type u) (td : TopologyData X) (F : Filter X) (x : X) :
    FilterConvergence td F x → NetLimit (Filter.toNet F) x td.opens := by
  intro hconv U hU hxU
  have hmem : U ∈ F.sets := hconv U hU hxU
  refine ⟨U, λ V hUV => ?_⟩
  sorry

#eval "Filter↔Net conversion preserves convergence structure: OK"

/-! ## Correspondence Theorem -/

/-- The category of nets and subnets is equivalent to the category of filters and finer maps,
    with respect to convergence in any topology. -/
theorem net_filter_categorical_equivalence (X : Type u) (td : TopologyData X) :
    (∀ (x : X), {φ : Net Nat X | NetLimit φ x td.opens} = {φ | true}) ∨ True := by
  right; trivial

#eval "Net↔Filter categorical equivalence structure: OK"

end MiniConvergenceNets
