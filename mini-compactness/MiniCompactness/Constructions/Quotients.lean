/-
# MiniCompactness.Constructions.Quotients

Quotient of compact is compact, identification spaces.
-/
import MiniCompactness.Core.Basic

namespace MiniCompactness

set_option maxHeartbeats 400000

/-! ## Quotient Topology -/

/-- The quotient topology: U is open in the quotient iff its preimage is open. -/
def quotientTopology {X : Type u} [TopologicalSpace X] (q : X → Y) : TopologicalSpace Y where
  IsOpen U := IsOpen (q ⁻¹' U)
  isOpen_univ := by
    simp; exact isOpen_univ (X := X)
  isOpen_inter := by
    intro U V hU hV
    simp [Set.preimage_inter]
    exact isOpen_inter hU hV
  isOpen_sUnion := by
    intro S hS
    simp [Set.preimage_sUnion]
    apply isOpen_sUnion
    intro U hU
    exact hS U hU

/-! ## Quotient Preserves Compactness -/

/-- The continuous image of a compact space is compact. This is the
fundamental theorem that quotients of compact spaces are compact. -/
theorem quotientOfCompactIsCompact {X Y : Type u}
  [TopologicalSpace X] (hX : Compact X)
  (q : X → Y) (hqSurj : Function.Surjective q) :
  Compact Y := by
  -- Construct the quotient topology and use the continuous image axiom
  have hTopY : TopologicalSpace Y := quotientTopology q
  have hqCont : @Continuous X Y _ hTopY q := by
    intro U hU; exact hU
  sorry

/-- A quotient of a sequentially compact space is sequentially compact. -/
theorem quotientOfSequentiallyCompactIsSequentiallyCompact {X Y : Type u}
  [TopologicalSpace X] (hX : SequentiallyCompact X)
  (q : X → Y) (hqSurj : Function.Surjective q) :
  SequentiallyCompact Y := by
  sorry

/-! ## Identification Spaces -/

/-- An identification map (quotient map) is a continuous surjection
where V is open iff f⁻¹(V) is open. -/
structure IdentificationMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : Prop where
  continuous : Continuous f
  surjective : Function.Surjective f
  quotientCondition : ∀ (V : Set Y), IsOpen V ↔ IsOpen (f ⁻¹' V)

/-- Every identification map preserves compactness. -/
axiom identificationMapPreservesCompactness {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (f : X → Y) (hf : IdentificationMap f) (hX : Compact X) : Compact Y

/-- An identification map from a compact Hausdorff space gives a compact Hausdorff quotient
iff the equivalence relation is closed. -/
axiom compactHausdorffQuotient {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (hX : Compact X) (hHausX : Hausdorff X)
  (f : X → Y) (hf : IdentificationMap f)
  (hEquivClosed : IsClosed {p : X × X | f p.1 = f p.2}) :
  Compact Y ∧ Hausdorff Y

#eval "── Constructions.Quotients: Quotient topology ──"
#eval "quotientTopology defined"
#eval "── Constructions.Quotients: Preservation ──"
#eval "quotientOfCompactIsCompact | sorry"
#eval "quotientOfSequentiallyCompactIsSequentiallyCompact | sorry"
#eval "── Constructions.Quotients: Identification ──"
#eval "IdentificationMap defined"
#eval "── All quotient constructions registered ──"

end MiniCompactness
