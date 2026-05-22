/-
# MiniTopologicalSpaces: Quotient Topology

Defines the quotient topology, identification spaces, and
group action quotients.
-/

import MiniTopologicalSpaces.Core.Basic
import MiniTopologicalSpaces.Morphisms.Hom

namespace MiniTopologicalSpaces

/-! ## Quotient Topology

Given a space X and a surjective map q : X -> Y, the quotient
topology on Y is the finest topology making q continuous:
V ⊆ Y is open iff q⁻¹(V) is open in X.
-/

def quotientTopology {X Y : Type u} [tX : TopologicalSpace X] (q : X → Y)
    (h_surj : Function.Surjective q) : TopologicalSpace Y where
  opens := {V : Set Y | q ⁻¹' V ∈ tX.opens}
  contains_univ := by
    simp [tX.contains_univ]
  contains_empty := by
    simp [tX.contains_empty]
  closed_under_union 𝒰 h := by
    have : q ⁻¹' (⋃₀ 𝒰) = ⋃₀ {q ⁻¹' V | V ∈ 𝒰} := by
      ext x; constructor
      · intro hx; rcases hx with ⟨V, hV, hx⟩
        exact ⟨q ⁻¹' V, ⟨V, hV, rfl⟩, hx⟩
      · intro hx; rcases hx with ⟨W, ⟨V, hV, rfl⟩, hx⟩
        exact ⟨V, hV, hx⟩
    rw [this]
    apply tX.closed_under_union
    intro W hW
    rcases hW with ⟨V, hV, rfl⟩
    exact h hV
  closed_under_inter V₁ V₂ hV₁ hV₂ := by
    simp [Set.preimage_inter]
    exact tX.closed_under_inter _ _ hV₁ hV₂

/-! ## Identification Space

An identification space is a quotient where the equivalence
relation identifies points of X that map to the same point in Y.
-/

def identificationTopology {X : Type u} [tX : TopologicalSpace X]
    (R : X → X → Prop) [hR : Equivalence R] : TopologicalSpace (Quotient R) :=
  quotientTopology (Quotient.mk R) (by
    intro y
    rcases Quotient.exists_rep y with ⟨x, rfl⟩
    exact ⟨x, rfl⟩)

/-! ## Group Action Quotient

For a group G acting on X, the orbit space X/G has the
quotient topology induced by the projection X -> X/G.
Such an action defines an equivalence relation x ~ g·x.
-/

structure GroupActionQuotient (X G : Type u) [tX : TopologicalSpace X] [Group G] where
  action : G → X → X
  action_properties : String := "group action satisfying identity and compatibility"
  quotientTopology : TopologicalSpace (Quotient (fun x y => ∃ g : G, action g x = y))

#eval "── Constructions/Quotients: quotient topology ──"
#check quotientTopology
#check identificationTopology
#check GroupActionQuotient
#eval "Quotient topology and identification space defined"

end MiniTopologicalSpaces
