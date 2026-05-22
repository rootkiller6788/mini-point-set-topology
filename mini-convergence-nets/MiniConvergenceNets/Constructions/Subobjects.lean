/-
# MiniConvergenceNets.Constructions.Subobjects

Subnet, finer/coarser filter, convergence subspace.
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Core.Objects

namespace MiniConvergenceNets

universe u v

/-! ## Subnet Theory -/

/-- A subnet preserves cluster points: every cluster point of a net is also
    a cluster point of every subnet. -/
theorem subnet_cluster_point {X : Type u} (td : TopologyData X) (φ : Net α X)
    (x : X) (hcluster : NetClusterPoint φ x td.opens)
    (σ : Subnet β α X) (hσ : σ.orig = φ) :
    NetClusterPoint ({ dir := σ.newDir, f := λ a => σ.orig.f (σ.lift a) } : Net β X) x td.opens := by
  intro U hU hxU b
  rcases σ.cofinal (σ.lift b) with ⟨a, ha⟩
  rcases hcluster U hU hxU a with ⟨a', haa', ha'U⟩
  -- find b' ≥ b with σ(b') ≥ a'
  rcases σ.cofinal a' with ⟨b', hb'⟩
  refine ⟨b', ?_, ?_⟩
  · -- need b ≤ b' — cofinal gives lift b ≤ lift b' in original
    sorry
  · exact ha'U

#eval "Subnet preserves cluster points"

/-! ## Finer/Coarser Filters -/

/-- F₁ is finer than F₂ if every set in F₂ is also in F₁. -/
def FilterFiner {X : Type u} (F₁ F₂ : Filter X) : Prop :=
  ∀ s : Set X, s ∈ F₂.sets → s ∈ F₁.sets

/-- F₁ is coarser than F₂ if F₂ is finer than F₁. -/
def FilterCoarser {X : Type u} (F₁ F₂ : Filter X) : Prop :=
  FilterFiner F₂ F₁

/-- If F₁ is finer than F₂ and F₂ converges to x, then F₁ also converges to x. -/
theorem finer_converges {X : Type u} (td : TopologyData X) (F₁ F₂ : Filter X) (x : X)
    (hfiner : FilterFiner F₁ F₂) (hconv : FilterConvergence td F₂ x) : FilterConvergence td F₁ x := by
  intro U hU hxU
  exact hfiner U (hconv U hU hxU)

#eval "Finer filter preserves convergence: OK"

/-! ## Convergence Subspace -/

/-- The subspace convergence on A ⊆ X: a net in A converges to a ∈ A iff
    it converges as a net in X. -/
def subspaceConvergence {X : Type u} (csX : ConvergenceSpace X) (A : Set X) :
    ConvergenceSpace {x : X // x ∈ A} where
  conv φ x := csX.conv
    ({ dir := φ.dir, f := λ a => (φ.f a).val } : Net α X) x.val
  constant_converges x := csX.constant_converges x.val
  subnet_preserves σ x h := csX.subnet_preserves
    ({ orig := { dir := σ.orig.dir, f := λ a => (σ.orig.f a).val },
       newDir := σ.newDir,
       lift := σ.lift,
       monotone := σ.monotone,
       cofinal := σ.cofinal
     } : Subnet β α X) x.val (by
      -- show the preserved convergence
      intro U hU hxU
      have h' := h U hU hxU
      sorry
    )

#eval "Subspace convergence defined"

/-! ## Subobjects in Convergence Theory -/

/-- A sub-convergence-space is a subset with the induced convergence. -/
structure SubConvergenceSpace (X : Type u) [ConvergenceSpace X] where
  carrier : Set X
  nonempty : carrier.Nonempty
  inducedConv : ConvergenceSpace {x : X // x ∈ carrier}

/-- Every sub-convergence-space is itself a convergence space. -/
instance SubConvergenceSpace.toConvergenceSpace {X : Type u} [cs : ConvergenceSpace X]
    (S : SubConvergenceSpace X) : ConvergenceSpace S.carrier := S.inducedConv

#eval "SubConvergenceSpace defined"

end MiniConvergenceNets
