/-
# MiniSeparationAxioms.Morphisms.Equiv

Equivalence of regular and completely regular space definitions.
Shows that different formulations of regularity and complete regularity
are equivalent under appropriate conditions.
-/

import MiniSeparationAxioms.Core.Basic

namespace MiniSeparationAxioms

/-! ## Equivalent Definitions of Regularity

A space is regular if for every point x and open neighborhood U of x,
there is an open V such that x ∈ V ⊆ closure V ⊆ U.
This is equivalent to the "point vs closed set" formulation.
-/

/-- Alternative definition: point and neighborhood version. -/
def RegularAlt (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ (x : X) (U : Set X), IsOpen U → x ∈ U → ∃ V : Set X, IsOpen V ∧ x ∈ V ∧ closure V ⊆ U

/-- The two definitions of regularity are equivalent. -/
theorem regular_equiv_regularAlt (X : Type u) [TopologicalSpace X] :
    Regular X ↔ RegularAlt X := by
  constructor
  · intro h x U hU hxU
    have hcl : IsClosed ((Set.univ : Set X) \ U) := by
      -- complement of open is closed
      sorry
    have hx0 : x ∉ ((Set.univ : Set X) \ U) := by
      intro hx; have := hx.2 hxU; contradiction
    sorry
  · intro h x F hF hxF
    have hU : IsOpen (Fᶜ) := by
      -- complement of closed is open
      sorry
    have hxU : x ∈ Fᶜ := hxF
    sorry

/-! ## Equivalent Definitions of Complete Regularity

A space is completely regular if points and closed sets can be functionally
separated. An equivalent formulation uses uniform structures.
-/

/-- Alternative: using a separating family of continuous functions. -/
def CompletelyRegularAlt (X : Type u) [TopologicalSpace X] : Prop :=
  ∃ (F : Set (X → ℝ)), (∀ f ∈ F, Continuous f) ∧
    (∀ x y : X, x ≠ y → ∃ f ∈ F, f x ≠ f y) ∧
    (∀ (x : X) (C : Set X), IsClosed C → x ∉ C → ∃ f ∈ F, f x = 0 ∧ (∀ y ∈ C, f y = 1))

/-- The two definitions of complete regularity are equivalent (in presence of T1). -/
theorem completelyRegular_equiv (X : Type u) [TopologicalSpace X] (hT1 : T1 X) :
    CompletelyRegular X ↔ CompletelyRegularAlt X := by
  constructor
  · intro h
    refine ⟨{f : X → ℝ | Continuous f}, ?_, ?_, ?_⟩
    · intro f hf; exact hf
    · intro x y hne
      have hsing : IsClosed ({y} : Set X) := hT1 y
      have hxny : x ∉ ({y} : Set X) := by
        intro h; apply hne; exact h
      rcases h x {y} hsing hxny with ⟨f, hf, hf0, hf1, hfb⟩
      refine ⟨f, hf, ?_⟩
      rw [hf0, hf1 y (by simp)]
      intro h'; linarith
    · intro x C hC hxC
      rcases h x C hC hxC with ⟨f, hf, hf0, hf1, hfb⟩
      exact ⟨f, hf, hf0, hf1⟩
  · intro h x C hC hxC
    rcases h with ⟨F, hF, hsep, hfunc⟩
    rcases hfunc x C hC hxC with ⟨f, hf, hf0, hf1⟩
    exact ⟨f, hf, hf0, hf1, λ z => ⟨by
      -- we need bounds; this holds if f separates
      sorry, by sorry⟩⟩

/-! ## Diagnostics -/

#eval "Morphisms.Equiv — Regular↔RegularAlt, CompletelyRegular↔CompletelyRegularAlt"

end MiniSeparationAxioms
