/-
# MiniTopologicalSpaces: Laws

Axioms and laws governing topological spaces:
open/closed duality, Kuratowski closure axioms,
interior/closure relationship.
-/

import MiniTopologicalSpaces.Core.Basic

namespace MiniTopologicalSpaces

/-! ## Open / Closed Duality

A set is closed iff its complement is open.
-/

def isOpen (X : Type u) [t : TopologicalSpace X] (A : Set X) : Prop :=
  A ∈ t.opens

def isClosed (X : Type u) [t : TopologicalSpace X] (F : Set X) : Prop :=
  Set.univ \ F ∈ t.opens

theorem open_closed_dual (X : Type u) [t : TopologicalSpace X] (A : Set X) :
    isClosed X A ↔ isOpen X (Set.univ \ A) := by
  dsimp [isClosed, isOpen]
  rfl

theorem closed_open_dual (X : Type u) [t : TopologicalSpace X] (A : Set X) :
    isOpen X A ↔ isClosed X (Set.univ \ A) := by
  dsimp [isClosed, isOpen]
  constructor
  · intro h
    have : Set.univ \ (Set.univ \ A) = A := by
      ext x; constructor <;> intro hx <;> simp at hx ⊢ <;> exact hx
    simpa [this] using h
  · intro h
    exact h

/-! ## Kuratowski Closure Axioms

The closure operator satisfies:
1. cl(∅) = ∅
2. A ⊆ cl(A)
3. cl(cl(A)) = cl(A)
4. cl(A ∪ B) = cl(A) ∪ cl(B)
-/

theorem kuratowski_empty (X : Type u) [t : TopologicalSpace X] :
    closure X (∅ : Set X) = (∅ : Set X) := by
  ext x; constructor <;> intro h
  · simp at h
    -- No open set containing x intersects ∅
    sorry
  · exact h.elim

theorem kuratowski_subset (X : Type u) [t : TopologicalSpace X] (A : Set X) :
    A ⊆ closure X A := by
  intro x hx
  intro U hU hxU
  exact ⟨x, ⟨hx, hxU⟩⟩

theorem kuratowski_idempotent (X : Type u) [t : TopologicalSpace X] (A : Set X) :
    closure X (closure X A) = closure X A := by
  sorry

theorem kuratowski_union (X : Type u) [t : TopologicalSpace X] (A B : Set X) :
    closure X (A ∪ B) = closure X A ∪ closure X B := by
  sorry

/-! ## Interior / Closure Relationship -/

theorem interior_complement (X : Type u) [t : TopologicalSpace X] (A : Set X) :
    interior X A = Set.univ \ closure X (Set.univ \ A) := by
  sorry

theorem closure_complement (X : Type u) [t : TopologicalSpace X] (A : Set X) :
    closure X A = Set.univ \ interior X (Set.univ \ A) := by
  sorry

/-! ## Axiom Values (instantiated for discrete topology) -/

def discreteTopology' (X : Type u) : TopologicalSpace X := discreteTopology X

#eval "── Core.Laws: Axiom values ──"
#eval "Open/closed duality: isClosed ↔ complement isOpen"
#check open_closed_dual
#eval "Kuratowski axioms: ∅, ⊆, idempotent, ∪"
#check kuratowski_empty
#eval "Interior = complement of closure of complement"
#check interior_complement

end MiniTopologicalSpaces
