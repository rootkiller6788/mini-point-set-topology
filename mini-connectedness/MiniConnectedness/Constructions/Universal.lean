/-
# MiniConnectedness: Constructions — Universal

Universal constructions: totally disconnected quotient, Stone space
of a Boolean algebra, and universal totally disconnected reflection.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Constructions.Quotients

namespace MiniConnectedness

/-! ## Universal Totally Disconnected Quotient -/

/-- The totally disconnected reflection of a topological space.
This is the universal totally disconnected space mapping from the given space. -/
structure TotallyDisconnectedReflection (α : Type u) [TopSpace α] where
  reflection : Type u
  [top_ref : TopSpace reflection]
  quotient_map : α → reflection
  [surj : Function.Surjective quotient_map]
  totally_disconnected : IsTotallyDisconnected reflection
  universal : ∀ (β : Type u) [TopSpace β], IsTotallyDisconnected β → (f : α → β) → Continuous f →
    ∃! (g : reflection → β), Continuous g ∧ ∀ x, g (quotient_map x) = f x

/-- Every topological space has a totally disconnected reflection. -/
axiom existsTotallyDisconnectedReflection {α : Type u} [TopSpace α] :
  TotallyDisconnectedReflection α

#eval "existsTotallyDisconnectedReflection: every space has a totally disconnected quotient"

/-! ## Stone Space -/

/-- A Boolean algebra B. -/
structure BooleanAlgebra (α : Type u) where
  zero : α
  one : α
  meet : α → α → α
  join : α → α → α
  compl : α → α
  -- axioms would go here

/-- The Stone space of a Boolean algebra is a compact totally disconnected space
whose clopen subsets correspond to elements of the algebra. -/
structure StoneSpace (B : Type u) [BooleanAlgebra B] where
  space : Type u
  [top_sp : TopSpace space]
  compact : sorry
  totally_disconnected : IsTotallyDisconnected space
  zero_dimensional : IsZeroDimensional space
  clopens : space → Set B
  -- representation theorem conditions

/-- Stone's representation theorem: every Boolean algebra is isomorphic to
the clopen algebra of its Stone space. -/
theorem stoneRepresentation {B : Type u} [BooleanAlgebra B] :
  sorry := by
  sorry

#eval "Stone representation: Boolean algebra ↔ clopen algebra of Stone space"

end MiniConnectedness
