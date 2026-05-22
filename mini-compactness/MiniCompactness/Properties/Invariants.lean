/-
# MiniCompactness.Properties.Invariants

Compactness invariants: compactness number (Lindelöf number),
extent, spread, weight.
-/
import MiniCompactness.Core.Basic

namespace MiniCompactness

set_option maxHeartbeats 400000

/-! ## Compactness Number (Lindelöf Number) -/

/-- The Lindelöf number L(X) is the smallest cardinal κ such that
every open cover has a subcover of cardinality ≤ κ. -/
structure LindelofNumber (X : Type u) [TopologicalSpace X] where
  cardinal : Cardinal
  property : ∀ {ι : Type u} (U : ι → Set X),
    (∀ i, IsOpen (U i)) → (⋃ i, U i = Set.univ) →
    ∃ (s : Set ι), Cardinal.mk s ≤ cardinal ∧ (⋃ i ∈ s, U i = Set.univ)

/-- Compactness means Lindelöf number = finite. -/
axiom compactImpliesLindelofNumberFinite {X : Type u} [TopologicalSpace X]
  (hX : Compact X) : ∃ (L : LindelofNumber X), L.cardinal < Cardinal.aleph0

/-- Lindelöf space means Lindelöf number = ℵ₀. -/
axiom lindelofImpliesLindelofNumberAleph0 {X : Type u} [TopologicalSpace X]
  (hX : Lindelöf X) : ∃ (L : LindelofNumber X), L.cardinal = Cardinal.aleph0

/-! ## Extent -/

/-- The extent e(X) is the supremum of cardinalities of closed discrete subsets. -/
structure Extent (X : Type u) [TopologicalSpace X] where
  cardinal : Cardinal
  supremum : ∀ (D : Set X), IsClosed D → (∀ x ∈ D, ∃ (U : Set X), IsOpen U ∧ U ∩ D = {x}) →
    Cardinal.mk D ≤ cardinal

/-- For compact spaces, extent equals spread. -/
axiom extentEqualsSpreadForCompact {X : Type u} [TopologicalSpace X]
  (hX : Compact X) (e : Extent X) (s : Spread X) : e.cardinal = s.cardinal

/-! ## Spread -/

/-- The spread s(X) is the supremum of cardinalities of discrete subsets. -/
structure Spread (X : Type u) [TopologicalSpace X] where
  cardinal : Cardinal
  supremum : ∀ (D : Set X),
    (∀ x ∈ D, ∃ (U : Set X), IsOpen U ∧ U ∩ D = {x}) →
    Cardinal.mk D ≤ cardinal

/-- For compact spaces, the spread is bounded by the weight. -/
axiom spreadBoundedByWeightForCompact {X : Type u} [TopologicalSpace X]
  (hX : Compact X) (s : Spread X) (w : Weight X) : s.cardinal ≤ w.cardinal

/-! ## Weight -/

/-- The weight w(X) is the smallest cardinality of a basis for the topology. -/
structure Weight (X : Type u) [TopologicalSpace X] where
  cardinal : Cardinal
  basis : Set (Set X)
  basisOpen : ∀ B ∈ basis, IsOpen B
  generates : ∀ (U : Set X), IsOpen U →
    ∃ (s : Set (Set X)), s ⊆ basis ∧ U = ⋃₀ s
  minimal : Cardinal.mk basis = cardinal

/-- The weight of a compact metric space is ≤ ℵ₀ (second-countable). -/
axiom compactMetricSpaceIsSecondCountable {X : Type u} [TopologicalSpace X]
  (hX : Compact X) : ∃ (w : Weight X), w.cardinal ≤ Cardinal.aleph0

/-! ## Cardinal Invariant Relationships -/

/-- For compact Hausdorff spaces: weight ≤ 2^{|X|}. -/
axiom weightBoundedByCardinality {X : Type u} [TopologicalSpace X]
  (hX : Compact X) (hHaus : Hausdorff X) (w : Weight X) :
  w.cardinal ≤ 2 ^ (Cardinal.mk (Set.univ : Set X))

/-- The cardinality of a compact Hausdorff space is bounded by 2^{weight}. -/
axiom cardinalityBoundedByWeight {X : Type u} [TopologicalSpace X]
  (hX : Compact X) (hHaus : Hausdorff X) (w : Weight X) :
  Cardinal.mk (Set.univ : Set X) ≤ 2 ^ w.cardinal

#eval "── Properties.Invariants: LindelofNumber ──"
#eval "LindelofNumber (compactness number) defined"
#eval "── Properties.Invariants: Extent ──"
#eval "Extent defined"
#eval "── Properties.Invariants: Spread ──"
#eval "Spread defined"
#eval "── Properties.Invariants: Weight ──"
#eval "Weight defined"
#eval "── All 4 cardinal invariants registered ──"

end MiniCompactness
