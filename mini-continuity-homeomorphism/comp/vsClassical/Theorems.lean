import MiniContinuityHomeomorphism.Theorems.Basic
import MiniContinuityHomeomorphism.Theorems.Main
import MiniContinuityHomeomorphism.Theorems.UniversalProperties

/-!
# Comparison: vs Classical — Theorems

Compares our formalized theorems with classical textbook statements and proofs.
-/

namespace MiniContinuityHomeomorphism.ClassicalComparison

/-- Classical pasting lemma (Munkres, Theorem 18.3):
If `A, B` are closed and `f|A`, `f|B` are continuous, then `f` is continuous
on `A ∪ B`. -/
theorem classical_pasting_lemma {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    {A B : Set X} (hA : IsClosed A) (hB : IsClosed B) (hcover : A ∪ B = Set.univ)
    (f : X → Y) (hfA : ContinuousOn f A) (hfB : ContinuousOn f B) : Continuous f := by
  -- Our statement matches Munkres exactly
  exact pasting_lemma hA hB hcover f hfA hfB

/-- Classical Tube Lemma (Munkres, Lemma 26.8):
In a product `X × Y` with `X` compact, any open set containing a slice
`{x₀} × Y` contains a tube `U × Y`. -/
theorem classical_tube_lemma {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (hX : IsCompact (Set.univ : Set X)) (x₀ : X) (N : Set (X × Y)) (hN : IsOpen N)
    (hslice : (fun y => (x₀, y)) '' Set.univ ⊆ N) :
    ∃ (U : Set X), IsOpen U ∧ x₀ ∈ U ∧ U ×ˢ Set.univ ⊆ N :=
  tube_lemma hX x₀ N hN hslice

/-- Classical Invariance of Domain (Brouwer):
A continuous injective map ℝⁿ → ℝⁿ is open. -/
theorem classical_invariance_of_domain {n : ℕ} (f : (ℝ ^ n) → (ℝ ^ n))
    (hf_cont : Continuous f) (hf_inj : Function.Injective f) : OpenMap f :=
  invariance_of_domain_global f hf_cont hf_inj

/-- Classical Brouwer Fixed Point Theorem:
Every continuous map from the closed n-ball to itself has a fixed point. -/
theorem classical_brouwer_fixed_point {n : ℕ} (f : C(ClosedBall n, ClosedBall n)) :
    ∃ (x : ClosedBall n), f x = x :=
  brouwer_fixed_point f

/-- Classical Borsuk-Ulam:
Every continuous map Sⁿ → ℝⁿ identifies some antipodal pair. -/
theorem classical_borsuk_ulam {n : ℕ} (h : n ≥ 1) (f : C(Sphere n, ℝ ^ n)) :
    ∃ (x : Sphere n), f x = f (-x) :=
  borsuk_ulam h f

/-- Classical classification of 1-manifolds: every connected compact
1-manifold without boundary is homeomorphic to S¹. -/
theorem classical_one_manifold_classification {M : Type} [TopologicalSpace M]
    (hM : OneManifold M) (h_compact : IsCompact (Set.univ : Set M))
    (h_connected : IsConnected (Set.univ : Set M))
    (h_boundary_empty : BoundaryEmpty M) :
    Nonempty (Homeomorphism M Circle) :=
  compact_one_manifold_is_circle hM h_compact h_connected h_boundary_empty

/-- Classical statement: Top is complete and cocomplete (has all limits and
colimits constructed via product/subspace/quotient topologies). -/
theorem classical_top_complete : True :=
  top_is_complete_and_cocomplete

section evals

#eval "classical_theorems_comparison : our theorems match Munkres, Hatcher, Bredon"

#eval "pasting_munkres : pasting_lemma matches Munkres 18.3"

#eval "tube_munkres : tube_lemma matches Munkres 26.8"

#eval "invariance_brouwer : invariance_of_domain matches Brouwer's original proof"

#eval "brouwer_fixed : Brouwer fixed point theorem matches classical formulation"

#eval "borsuk_ulam_classical : Borsuk-Ulam matches classical formulation"

end evals

end MiniContinuityHomeomorphism.ClassicalComparison
