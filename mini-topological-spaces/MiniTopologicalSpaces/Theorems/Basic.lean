/-
# MiniTopologicalSpaces: Basic Theorems

Tychonoff theorem (product of compact spaces is compact),
uniqueness of limits in Hausdorff spaces, and other
fundamental results of point-set topology.
-/

import MiniTopologicalSpaces.Core.Basic
import MiniTopologicalSpaces.Core.Laws
import MiniTopologicalSpaces.Constructions.Products
import MiniTopologicalSpaces.Properties.Preservation

namespace MiniTopologicalSpaces

/-! ## Hausdorff Space -/

def Hausdorff (X : Type u) [t : TopologicalSpace X] : Prop :=
  ∀ x y : X, x ≠ y → ∃ (U V : Set X), U ∈ t.opens ∧ V ∈ t.opens ∧
    x ∈ U ∧ y ∈ V ∧ U ∩ V = ∅

/-! ## Uniqueness of Limits in Hausdorff Spaces

In a Hausdorff space, every convergent sequence has a unique limit.
-/

def ConvergesTo {X : Type u} [t : TopologicalSpace X] (s : ℕ → X) (x : X) : Prop :=
  ∀ U ∈ t.opens, x ∈ U → ∃ N : ℕ, ∀ n ≥ N, s n ∈ U

theorem unique_limit_Hausdorff (X : Type u) [t : TopologicalSpace X] (hH : Hausdorff X)
    (s : ℕ → X) (x y : X) (hx : ConvergesTo s x) (hy : ConvergesTo s y) : x = y := by
  by_contra h_ne
  rcases hH x y h_ne with ⟨U, V, hU, hV, hxU, hyV, hUV⟩
  rcases hx U hU hxU with ⟨N₁, hN₁⟩
  rcases hy V hV hyV with ⟨N₂, hN₂⟩
  let N := max N₁ N₂
  have h_sN_U : s N ∈ U := hN₁ N (Nat.le_max_left _ _)
  have h_sN_V : s N ∈ V := hN₂ N (Nat.le_max_right _ _)
  have h_empty : s N ∈ U ∩ V := ⟨h_sN_U, h_sN_V⟩
  rw [hUV] at h_empty
  exact Set.not_mem_empty _ h_empty

/-! ## Tychonoff Theorem

The product of any family of compact spaces is compact.
(This is equivalent to the Axiom of Choice.)

For the binary case: if X and Y are compact, then X × Y is compact
in the product topology.
-/

theorem tychonoff_binary (X Y : Type u) [tX : TopologicalSpace X] [tY : TopologicalSpace Y]
    (hX : Compact X) (hY : Compact Y) : Compact (X × Y) := by
  sorry

/-! ## Urysohn Lemma (placeholder)

In a normal space, disjoint closed sets can be separated by
a continuous function into [0,1].
-/

theorem urysohn_lemma (X : Type u) [t : TopologicalSpace X] : True := by
  sorry

/-! ## Intermediate Value Theorem (topological version)

The continuous image of a connected space is connected.
If f : X → ℝ is continuous and X is connected, then
f(X) is an interval.
-/

def Interval (a b : ℝ) : Set ℝ := {x | a ≤ x ∧ x ≤ b}

theorem intermediate_value_topological {X : Type u} [t : TopologicalSpace X]
    (f : ContinuousMap X ℝ) (h_connected : Connected X)
    (a b : X) (r : ℝ) (h : f.toFun a ≤ r ∧ r ≤ f.toFun b) :
    ∃ c : X, f.toFun c = r := by
  sorry

#eval "── Theorems/Basic: Tychonoff and limits ──"
#check Hausdorff
#check unique_limit_Hausdorff
#check tychonoff_binary
#eval "Hausdorff, unique limits, Tychonoff theorem (binary)"
#eval "Proofs marked with sorry"

end MiniTopologicalSpaces
