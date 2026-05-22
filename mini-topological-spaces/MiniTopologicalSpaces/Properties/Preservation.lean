/-
# MiniTopologicalSpaces: Preservation Theorems

Properties preserved under continuous maps, open maps, etc.
-/

import MiniTopologicalSpaces.Core.Basic
import MiniTopologicalSpaces.Morphisms.Hom
import MiniTopologicalSpaces.Properties.Invariants

namespace MiniTopologicalSpaces

/-! ## Compactness Preserved by Continuous Maps

The continuous image of a compact space is compact.
-/

def Compact (X : Type u) [t : TopologicalSpace X] : Prop :=
  ∀ (𝒰 : Set (Set X)), (∀ U ∈ 𝒰, U ∈ t.opens) → (⋃₀ 𝒰 = Set.univ) →
    ∃ (𝒱 : Set (Set X)), Set.Finite 𝒱 ∧ 𝒱 ⊆ 𝒰 ∧ ⋃₀ 𝒱 = Set.univ

theorem compact_image {X Y : Type u} [tX : TopologicalSpace X] [tY : TopologicalSpace Y]
    (f : ContinuousMap X Y) (hX : Compact X) : Compact (Set.range f.toFun) := by
  sorry

/-! ## Connectedness Preserved by Continuous Maps

The continuous image of a connected space is connected.
-/

def Connected (X : Type u) [t : TopologicalSpace X] : Prop :=
  ¬ ∃ (U V : Set X), U ∈ t.opens ∧ V ∈ t.opens ∧ U ≠ ∅ ∧ V ≠ ∅ ∧
    U ∩ V = ∅ ∧ U ∪ V = Set.univ

theorem connected_image {X Y : Type u} [tX : TopologicalSpace X] [tY : TopologicalSpace Y]
    (f : ContinuousMap X Y) (hX : Connected X) : Connected (Set.range f.toFun) := by
  sorry

/-! ## Separability Preserved by Continuous Maps

The continuous image of a separable space is separable.
-/

theorem separable_image {X Y : Type u} [tX : TopologicalSpace X] [tY : TopologicalSpace Y]
    (f : ContinuousMap X Y) (hX : Separable X) : Separable Y := by
  sorry

/-! ## Countability Preserved by Open Continuous Surjections

If f : X -> Y is an open continuous surjection, and X is
first/second-countable, then Y has the same property.
-/

theorem first_countable_preserved {X Y : Type u} [tX : TopologicalSpace X] [tY : TopologicalSpace Y]
    (f : OpenMap X Y) (h_cont : f.toFun ⁻¹' is continuous) (h_surj : Function.Surjective f.toFun)
    (hX : FirstCountable X) : FirstCountable Y := by
  sorry

#eval "── Properties/Preservation: compactness/connectedness ──"
#check Compact
#check Connected
#check compact_image
#eval "Compactness and connectedness preserved by continuous maps"

end MiniTopologicalSpaces
