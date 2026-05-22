import MiniContinuityHomeomorphism.Core.Basic

/-!
# Utils: Tactics

Custom tactics for reasoning about continuity and homeomorphisms in Lean 4.
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

/-- Tactic to prove that a function is continuous by checking all subbasis
elements (for the compact-open topology or similar). -/
syntax "continuity'" : tactic
macro_rules
  | `(tactic| continuity') =>
    `(tactic|
      first
        | apply continuous_id
        | apply continuous_const
        | apply continuous_fst
        | apply continuous_snd
        | apply Continuous.comp <;> continuity'
        | apply Continuous.prod_mk <;> continuity'
    )

/-- Tactic to prove that a map is a homeomorphism by providing the inverse
and continuity proofs. -/
syntax "homeomorphism" : tactic
macro_rules
  | `(tactic| homeomorphism) =>
    `(tactic|
      refine {
        toFun := ?_
        continuous_toFun := ?_
        invFun := ?_
        left_inv := ?_
        right_inv := ?_
        continuous_invFun := ?_
      }
    )

/-- Tactic to prove openness by using that the preimage of an open set is open. -/
syntax "open_from_continuous" : tactic
macro_rules
  | `(tactic| open_from_continuous) =>
    `(tactic|
      intro U hU
      have := ?_  -- should be f.continuous_toFun U
      apply this hU
    )

/-- A helper lemma: the composition of two homeomorphisms is a homeomorphism. -/
lemma homeomorphism_comp {X Y Z : Type} [TopologicalSpace X] [TopologicalSpace Y]
    [TopologicalSpace Z] (h₁ : Homeomorphism X Y) (h₂ : Homeomorphism Y Z) :
    Homeomorphism X Z :=
  homeomorphismTrans h₁ h₂

/-- A helper to extract the inverse of a homeomorphism. -/
def homeomorphismInv {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (h : Homeomorphism X Y) : Homeomorphism Y X :=
  homeomorphismSymm h

/-- Automatically prove that a function is an open map when it is a homeomorphism. -/
theorem homeomorphism_is_open {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (h : Homeomorphism X Y) : OpenMap h.toFun := by
  intro U hU
  -- f(U) = (f⁻¹)⁻¹(U) which is open because f⁻¹ is continuous
  have : h.toFun '' U = h.invFun ⁻¹' U := by
    ext y; constructor
    · rintro ⟨x, hx, rfl⟩
      simpa [h.left_inv x] using hx
    · intro hy
      refine ⟨h.invFun y, hy, ?_⟩
      simp [h.right_inv y]
  rw [this]
  exact h.continuous_invFun.isOpen_preimage U hU

/-- Automatically prove that a function is a closed map when it is a homeomorphism. -/
theorem homeomorphism_is_closed {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (h : Homeomorphism X Y) : ClosedMap h.toFun := by
  intro F hF
  have : h.toFun '' F = h.invFun ⁻¹' F := by
    ext y; constructor
    · rintro ⟨x, hx, rfl⟩
      simpa [h.left_inv x] using hx
    · intro hy
      refine ⟨h.invFun y, hy, ?_⟩
      simp [h.right_inv y]
  rw [this]
  exact h.continuous_invFun.isClosed_preimage F hF

/-- A lemma: if `f : X → Y` and `g : Y → Z` are both proper, then `g ∘ f` is
proper. -/
theorem proper_comp {X Y Z : Type} [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    {f : X → Y} {g : Y → Z} (hf : Proper f) (hg : Proper g) : Proper (g ∘ f) := by
  intro K hK
  have h1 : IsCompact (g ⁻¹' K) := hg K hK
  have h2 : IsCompact (f ⁻¹' (g ⁻¹' K)) := hf (g ⁻¹' K) h1
  simpa [Set.preimage_comp] using h2

section evals

/-- Tactics are defined and available for use. -/
#eval "continuity_tactic_registered : continuity' tactic available"

/-- Homeomorphism helper lemma. -/
#eval "homeomorphism_helper : homeomorphism_comp is available"

/-- Properness composes. -/
#eval "proper_comp : composition of proper maps is proper"

end evals

end MiniContinuityHomeomorphism
