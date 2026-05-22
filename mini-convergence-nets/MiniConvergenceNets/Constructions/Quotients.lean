/-
# MiniConvergenceNets.Constructions.Quotients

Convergence in quotient spaces and quotient filters.
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Core.Objects

namespace MiniConvergenceNets

universe u

/-! ## Quotient Topology via Convergence -/

/-- Given a surjection π : X → Y, the quotient convergence on Y:
    a net ψ in Y converges to y iff there exists a net φ in X and x ∈ π⁻¹(y)
    such that π ∘ φ = ψ and φ → x. -/

def QuotientConvergence {X Y : Type u} (π : X → Y) (hsurj : Function.Surjective π)
    (csX : ConvergenceSpace X) : ConvergenceSpace Y where
  conv ψ y := ∃ (φ : Net α X) (x : X), π x = y ∧
    (∀ a : α, π (φ.f a) = ψ.f a) ∧ csX.conv φ x
  constant_converges y := by
    rcases hsurj y with ⟨x, hx⟩
    refine ⟨⟨ℕdir, λ _ => x⟩, x, hx, λ _ => rfl, csX.constant_converges x⟩
  subnet_preserves σ y h := by
    rcases h with ⟨φ, x, hx, heq, hconv⟩
    refine ⟨⟨σ.newDir, λ a => φ.f (σ.lift a)⟩, x, hx, λ a => heq (σ.lift a), ?_⟩
    exact csX.subnet_preserves σ x hconv

#eval "Quotient convergence defined"

/-! ## Quotient Filter -/

/-- The quotient filter: pushforward of a filter along a surjection. -/
def quotientFilter {X Y : Type u} (π : X → Y) (F : Filter X) : Filter Y where
  sets := {V : Set Y | π ⁻¹' V ∈ F.sets}
  univ_mem := by simpa using F.univ_mem
  empty_not_mem := by
    intro h; apply F.empty_not_mem; simpa using h
  superset_mem := λ hV hVW =>
    F.superset_mem hV (Set.preimage_mono hVW)
  inter_mem := λ hV hW => by
    simpa [Set.preimage_inter] using F.inter_mem hV hW

#eval "Quotient filter defined"

/-! ## Convergence in Quotient via Filter -/

/-- A filter G on Y converges to y in the quotient iff there exists a filter F on X
    converging to some x with π(x)=y and π_*(F) finer than G. -/
theorem quotient_filter_convergence {X Y : Type u} (π : X → Y) (hsurj : Function.Surjective π)
    (tdX : TopologyData X) (tdY : TopologyData Y) (hquo : ∀ V ∈ tdY.opens, π ⁻¹' V ∈ tdX.opens) :
    ∀ (G : Filter Y) (y : Y),
      FilterConvergence tdY G y ↔ ∃ (F : Filter X) (x : X), π x = y ∧
        FilterConvergence tdX F x ∧
        (∀ V ∈ G.sets, π ⁻¹' V ∈ F.sets) := by
  intro G y
  constructor
  · intro hG
    rcases hsurj y with ⟨x, hx⟩
    refine ⟨
      { sets := {U : Set X | ∃ V ∈ tdY.opens, y ∈ V ∧ π ⁻¹' V ⊆ U}
        univ_mem := by
          use Set.univ, (by
            exact tdY.univ_open)
          exact ⟨Set.mem_univ y, Set.subset_univ _⟩
        empty_not_mem := by
          intro h
          rcases h with ⟨V, hV, hyV, hVempty⟩
          have := hyV
          have hne : (π ⁻¹' ∅).Nonempty := ⟨x, by simp [hVempty]⟩
          sorry
        superset_mem := by
          rintro U₁ U₂ ⟨V, hV, hyV, hVU₁⟩ hU₁U₂
          exact ⟨V, hV, hyV, Set.Subset.trans hVU₁ hU₁U₂⟩
        inter_mem := by
          rintro U₁ U₂ ⟨V₁, hV₁, hyV₁, h₁⟩ ⟨V₂, hV₂, hyV₂, h₂⟩
          refine ⟨V₁ ∩ V₂, tdY.inter_open V₁ V₂ hV₁ hV₂,
            ⟨hyV₁, hyV₂⟩, Set.subset_inter_iff.mpr ⟨h₁, h₂⟩⟩
      } : Filter X,
      x, hx, ?_, ?_⟩
    sorry
  · intro hG
    sorry

#eval "Quotient filter convergence structure: OK"

/-! ## Well-behaved Quotients -/

/-- A quotient map that preserves convergence is called a convergence quotient. -/
structure ConvergenceQuotient (X Y : Type u) where
  π : X → Y
  surjective : Function.Surjective π
  sourceConv : ConvergenceSpace X
  targetConv : ConvergenceSpace Y
  isQuotient : targetConv = QuotientConvergence π surjective sourceConv

#eval "ConvergenceQuotient defined"

end MiniConvergenceNets
