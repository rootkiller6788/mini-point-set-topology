/-
# MiniTopologicalSpaces: Topological Invariants

Separability, first-countable, second-countable, and Lindelof
properties of topological spaces.
-/

import MiniTopologicalSpaces.Core.Basic

namespace MiniTopologicalSpaces

/-! ## Separation Properties Already Defined

`Separable` is defined in Core/Basic.lean: a space is separable
if it contains a countable dense subset.
-/

/-! ## First-Countable

A space is first-countable if every point has a countable
neighborhood basis.
-/

def FirstCountable (X : Type u) [t : TopologicalSpace X] : Prop :=
  ∀ x : X, ∃ (𝒩 : Set (Set X)), 𝒩.Countable ∧
    (∀ N ∈ 𝒩, N ∈ t.opens) ∧
    (∀ N ∈ 𝒩, x ∈ N) ∧
    (∀ U ∈ t.opens, x ∈ U → ∃ N ∈ 𝒩, N ⊆ U)

/-! ## Second-Countable

A space is second-countable if its topology has a countable basis.
-/

def SecondCountable (X : Type u) [t : TopologicalSpace X] : Prop :=
  ∃ (ℬ : Set (Set X)), ℬ.Countable ∧
    (∀ B ∈ ℬ, B ∈ t.opens) ∧
    (∀ U ∈ t.opens, ∃ (𝒰 : Set (Set X)), (∀ B ∈ 𝒰, B ∈ ℬ) ∧ U = ⋃₀ 𝒰)

/-! ## Lindelof

A space is Lindelof if every open cover has a countable subcover.
-/

def Lindelof (X : Type u) [t : TopologicalSpace X] : Prop :=
  ∀ (𝒰 : Set (Set X)), (∀ U ∈ 𝒰, U ∈ t.opens) → (⋃₀ 𝒰 = Set.univ) →
    ∃ (𝒱 : Set (Set X)), 𝒱.Countable ∧ 𝒱 ⊆ 𝒰 ∧ ⋃₀ 𝒱 = Set.univ

/-! ## Invariant Relationships

Second-countable implies first-countable and separable.
Second-countable spaces are Lindelof.
-/

theorem second_countable_implies_first_countable (X : Type u) [t : TopologicalSpace X]
    (h : SecondCountable X) : FirstCountable X := by
  sorry

theorem second_countable_implies_separable (X : Type u) [t : TopologicalSpace X]
    (h : SecondCountable X) : Separable X := by
  sorry

theorem second_countable_implies_lindelof (X : Type u) [t : TopologicalSpace X]
    (h : SecondCountable X) : Lindelof X := by
  sorry

#eval "── Properties/Invariants: countability ──"
#check FirstCountable
#check SecondCountable
#check Lindelof
#eval "First-countable, second-countable, Lindelof defined"

end MiniTopologicalSpaces
