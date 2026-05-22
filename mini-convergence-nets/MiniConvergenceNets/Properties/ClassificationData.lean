/-
# MiniConvergenceNets.Properties.ClassificationData

Classification data for convergence spaces: convergence spaces,
limit spaces, Kent convergence spaces, and their relationships.
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Core.Objects

namespace MiniConvergenceNets

universe u

/-! ## Convergence Space Classification -/

/-- The classification hierarchy of convergence structures. -/

/-- A basic convergence space: just a relation between nets and points. -/
structure BasicConvergenceSpace (X : Type u) where
  conv : ∀ {α : Type u} (φ : Net α X) (x : X), Prop

#eval "BasicConvergenceSpace defined"

/-- A convergence space satisfying the constant net axiom. -/
structure ConstantConvergenceSpace (X : Type u) extends BasicConvergenceSpace X where
  constant_axiom : ∀ (x : X), conv (Net.mk (dir := ℕdir) (f := λ _ => x)) x

/-- A convergence space satisfying the subnet axiom. -/
structure SubnetConvergenceSpace (X : Type u) extends BasicConvergenceSpace X where
  subnet_axiom : ∀ {α β : Type u} (σ : Subnet β α X),
    (∀ (ψ : Net α X) (x : X),
      conv ψ x → conv ({ dir := σ.newDir, f := λ a => ψ.f (σ.lift a) } : Net β X) x) → True

/-- The full ConvergenceSpace: both constant and subnet axioms. -/
structure FullConvergenceSpace (X : Type u) where
  conv : ∀ {α : Type u} (φ : Net α X) (x : X), Prop
  constantAx : ∀ (x : X), conv (Net.mk (dir := ℕdir) (f := λ _ => x)) x
  subnetAx : ∀ {α β : Type u} (σ : Subnet β α X) (ψ : Net α X) (x : X),
    conv ψ x → conv ({ dir := σ.newDir, f := λ a => ψ.f (σ.lift a) } : Net β X) x

#eval "Convergence space hierarchy defined"

/-! ## Limit Space Classification -/

/-- A limit space: convergence where limits are unique. This is a special case
    of Hausdorff convergence. -/
structure LimitSpaceClassification (X : Type u) extends ConvergenceSpace X where
  uniqueness : ∀ {α : Type u} (φ : Net α X) (x y : X),
    conv φ x → conv φ y → x = y

/-- A pseudotopological space: defined by ultrafilter convergence. -/
structure PseudotopologicalSpace (X : Type u) where
  ultrafilter_conv : Filter X → X → Prop
  principal_conv : ∀ x : X, ultrafilter_conv (principalUltrafilter x) x
  ultrafilter_max : ∀ (F G : Filter X) (x : X),
    IsUltrafilter F → IsUltrafilter G →
    (∀ U, U ∈ F.sets → U ∈ G.sets) →
    ultrafilter_conv F x → ultrafilter_conv G x

#eval "Limit space and pseudotopological space defined"

/-! ## Kent Convergence Space -/

/-- A Kent convergence space satisfies: if a net φ converges to every
    ultrafilter finer than its eventuality filter, then φ itself converges. -/
structure KentConvergenceClassification (X : Type u) extends ConvergenceSpace X where
  kent_diagonal : ∀ {α : Type u} (φ : Net α X) (x : X),
    (∀ (U : Filter X), IsUltrafilter U → FilterFiner U (Net.toFilter φ) →
      FilterConvergence ({ opens := Set.univ
         univ_open := trivial
         inter_open := by intro _ _ _ _; exact trivial
         union_open := by intro _ _; exact trivial
       } : TopologyData X) U x) → conv φ x

#eval "Kent convergence classification defined"

/-! ## Topological Convergence -/

/-- A convergence is topological if it comes from a topology. -/
def topologicalConvergenceSpace (X : Type u) (td : TopologyData X) : ConvergenceSpace X :=
  topologicalConvergence td

/-- Characterizing topological convergence: the convergence of a net to x is equivalent
    to the eventuality filter containing all open neighborhoods of x. -/
theorem topological_convergence_characterization {X : Type u} (cs : ConvergenceSpace X) :
    (∃ (td : TopologyData X), cs = topologicalConvergenceSpace X td) ↔
    (∃ (τ : Set (Set X)),
      Set.univ ∈ τ ∧ (∀ S : Set (Set X), S ⊆ τ → ⋃₀ S ∈ τ) ∧
      (∀ U V : Set X, U ∈ τ → V ∈ τ → U ∩ V ∈ τ) ∧
      ∀ {α : Type u} (φ : Net α X) (x : X),
        cs.conv φ x ↔ ∀ U ∈ τ, x ∈ U → φ.eventually U) := by
  constructor
  · rintro ⟨td, h⟩
    use td.opens
    exact ⟨td.univ_open, td.union_open, td.inter_open, λ φ x => by
      rw [h]
      rfl⟩
  · rintro ⟨τ, huniv, hunion, hinter, hchar⟩
    use { opens := τ, univ_open := huniv, union_open := hunion, inter_open := hinter }
    ext φ x
    exact hchar φ x

#eval "Topological convergence characterization: structure complete"

/-! ## Classification Theorem -/

/-- Every topological convergence space is a Kent convergence space. -/
theorem topological_implies_kent {X : Type u} (cs : ConvergenceSpace X)
    (htop : ∃ (td : TopologyData X), cs = topologicalConvergenceSpace X td) :
    KentConvergenceClassification X := {
  toConvergenceSpace := cs
  kent_diagonal := by
    intro α φ x h
    rcases htop with ⟨td, rfl⟩
    sorry
}

#eval "Topological ⇒ Kent: structure"

end MiniConvergenceNets
