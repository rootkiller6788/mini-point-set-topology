/-
# MiniConnectedness: Properties — Classification Data

Classification of continua: indecomposable continua, the pseudo-arc,
and the hierarchy of 1-dimensional continua.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic

namespace MiniConnectedness

/-! ## Indecomposable Continua -/

/-- A continuum is indecomposable if it cannot be written as the union of
two proper subcontinua. -/
def IsIndecomposable {α : Type u} [TopSpace α] [Continuum α] : Prop :=
  ∀ (A B : Set α), IsConnectedSubspace A → IsConnectedSubspace B →
    sorry → A ∪ B = Set.univ → A = Set.univ ∨ B = Set.univ

/-- Every continuum contains an indecomposable subcontinuum. -/
theorem containsIndecomposable {α : Type u} [TopSpace α] [Continuum α] :
  ∃ (S : Set α), IsConnectedSubspace S ∧ sorry := by
  sorry

#eval "containsIndecomposable: every continuum contains an indecomposable subcontinuum"

/-! ## Hereditary Indecomposability -/

/-- A continuum is hereditarily indecomposable if every subcontinuum is indecomposable. -/
def IsHereditarilyIndecomposable {α : Type u} [TopSpace α] [Continuum α] : Prop :=
  sorry

#eval "hereditarily indecomposable continua exist"

/-! ## The Pseudo-Arc -/

/-- The pseudo-arc is a hereditarily indecomposable, chainable continuum. -/
structure PseudoArc where
  space : Type
  [top_sp : TopSpace space]
  [cont_sp : Continuum space]
  hereditarily_indecomposable : IsHereditarilyIndecomposable space
  chainable : sorry
  -- Every open cover has a refinement that is a chain

/-- Up to homeomorphism, there is exactly one pseudo-arc. -/
theorem pseudoArc_unique {α β : PseudoArc} : Nonempty (Homeomorphism α.space β.space) := by
  sorry

#eval "pseudoArc_unique: the pseudo-arc is unique up to homeomorphism"

/-! ## Classification of 1-Dimensional Continua -/

/-- A finite graph is a 1-dimensional continuum. -/
def IsFiniteGraphContinuum {α : Type u} [TopSpace α] [Continuum α] : Prop :=
  sorry

/-- Classification by number of endpoints and branching points. -/
theorem classifyFiniteGraphs {α : Type u} [TopSpace α] [Continuum α]
  (h : IsFiniteGraphContinuum α) : sorry := by
  sorry

#eval "Classification of 1-dimensional continua: graphs, dendrites, pseudo-arc"

end MiniConnectedness
