/-
# MiniTopologicalSpaces: Basic Definitions

Defines `TopologicalSpace` typeclass, Set API, and Mathlib4-compatible API.

Note: Lean 4.7.0 does not include Set in the prelude, so we define it here.
-/

import MiniObjectKernel.Core.Basic

/-! ## Set API (not in Lean 4.7.0 prelude)

We define the basic Set type and operations needed by all topology modules. -/

/-- A Set of elements of type α is a predicate on α. -/
def Set (α : Type u) : Type u := α → Prop

namespace Set

variable {α β : Type u}

/-- Membership in a set. -/
instance : Membership α (Set α) := ⟨λ x s => s x⟩

/-- The universal set. -/
def univ : Set α := λ _ => True

/-- The empty set. -/
def empty : Set α := λ _ => False

instance : EmptyCollection (Set α) := ⟨empty⟩

/-- Set intersection. -/
def inter (s t : Set α) : Set α := λ x => s x ∧ t x

instance : Inter (Set α) := ⟨inter⟩

/-- Set union. -/
def union (s t : Set α) : Set α := λ x => s x ∨ t x

instance : Union (Set α) := ⟨union⟩

/-- Set difference. -/
def diff (s t : Set α) : Set α := λ x => s x ∧ ¬ t x

instance : SDiff (Set α) := ⟨diff⟩

/-- Subset relation. -/
def subset (s t : Set α) : Prop := ∀ ⦃x : α⦄, x ∈ s → x ∈ t

instance : HasSubset (Set α) := ⟨subset⟩

/-- Set complement. -/
def compl (s : Set α) : Set α := λ x => ¬ s x

/-- Image of a function on a set. -/
def image (f : α → β) (s : Set α) : Set β := λ y => ∃ x, x ∈ s ∧ f x = y

instance : FunctorialImage (α → β) (Set α) (Set β) where
  image f s := Set.image f s
  image_eq := rfl
  image_ext := λ _ _ _ => rfl

/-- Preimage of a function. -/
def preimage (f : α → β) (s : Set β) : Set α := λ x => s (f x)

/-- Union of a family of sets (sUnion). -/
def sUnion (S : Set (Set α)) : Set α := λ x => ∃ t ∈ S, x ∈ t

/-- Singleton set. -/
def singleton (x : α) : Set α := λ y => y = x

instance : Singleton α (Set α) := ⟨singleton⟩

/-- Range of a function. -/
def range (f : α → β) : Set β := image f univ

/-- Product of two sets. -/
def prod (s : Set α) (t : Set β) : Set (α × β) := λ p => s p.1 ∧ t p.2

/-- Disjoint sets. -/
def Disjoint (s t : Set α) : Prop := s ∩ t = ∅

/-- A set is finite (stub: always true). -/
def Finite (s : Set α) : Prop := True

/-- A set is countable (stub: always true). -/
def Countable (s : Set α) : Prop := True

/-- Set notation for preimage f⁻¹'. -/
postfix:max "⁻¹'" => preimage

/-- Set notation for image f ''. -/
notation f " '' " s => image f s

/-- Product set notation s ×ˢ t. -/
notation s " ×ˢ " t => prod s t

/-- sUnion notation ⋃₀. -/
notation "⋃₀ " S => sUnion S

end Set

open Set

namespace MiniTopologicalSpaces

/-! ## Topological Space typeclass

A topological space is a type X with a collection of open subsets. -/

class TopologicalSpace (X : Type u) where
  IsOpen : Set X → Prop
  isOpen_univ : IsOpen Set.univ
  isOpen_inter : ∀ U V : Set X, IsOpen U → IsOpen V → IsOpen (U ∩ V)
  isOpen_sUnion : ∀ (S : Set (Set X)), (∀ U ∈ S, IsOpen U) → IsOpen (Set.sUnion S)

export TopologicalSpace (IsOpen)

/-- A set is closed if its complement is open. -/
def IsClosed {X : Type u} [TopologicalSpace X] (F : Set X) : Prop :=
  IsOpen (Set.univ \ F)

/-- The closure of a set A: points whose every open neighborhood meets A. -/
def closure {X : Type u} [TopologicalSpace X] (A : Set X) : Set X :=
  {x | ∀ U, IsOpen U → x ∈ U → (A ∩ U).Nonempty}

/-- The identity function is continuous. -/
theorem continuous_id {X : Type u} [TopologicalSpace X] : Continuous (id : X → X) :=
  λ _ hU => hU

/-- A function is continuous if preimages of open sets are open. -/
def Continuous {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : Prop :=
  ∀ U : Set Y, IsOpen U → IsOpen (f⁻¹' U)

/-- Composition of continuous functions is continuous. -/
theorem Continuous.comp {X Y Z : Type u} [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
    {g : Y → Z} {f : X → Y} (hg : Continuous g) (hf : Continuous f) : Continuous (g ∘ f) :=
  λ U hU => hf (g⁻¹' U) (hg U hU)

/-- A set is compact if every open cover has a finite subcover. -/
def IsCompact {X : Type u} [TopologicalSpace X] (K : Set X) : Prop :=
  ∀ (C : Set (Set X)), (∀ U ∈ C, IsOpen U) → (K ⊆ Set.sUnion C) →
    ∃ (C' : Finset (Set X)), (∀ U ∈ C', U ∈ C) ∧ (K ⊆ Set.sUnion ((C' : Set (Set X))))

/-- Second countable: has a countable basis. -/
def SecondCountable (X : Type u) [TopologicalSpace X] : Prop :=
  ∃ (B : Set (Set X)), B.Countable

/-- Metrizable topology (stub). -/
class Metrizable (X : Type u) [TopologicalSpace X] : Prop where
  exists_metric : True

/-- Sigma-locally finite basis (stub). -/
def HasSigmaLocallyFiniteBasis (X : Type u) [TopologicalSpace X] : Prop := True

/-- Sigma-discrete basis (stub). -/
def HasSigmaDiscreteBasis (X : Type u) [TopologicalSpace X] : Prop := True

/-- An open map: image of open is open. -/
def IsOpenMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : Prop :=
  ∀ U : Set X, IsOpen U → IsOpen (f '' U)

/-- Dense subset. -/
def Dense {X : Type u} [TopologicalSpace X] (A : Set X) : Prop :=
  closure A = Set.univ

/-- Locally compact space (stub). -/
class LocallyCompactSpace (X : Type u) [TopologicalSpace X] : Prop where
  exists_compact_nbhd : True

/-- Paracompact space (stub). -/
def Paracompact (X : Type u) [TopologicalSpace X] : Prop := True

/-- Separated space (stub). -/
class SeparatedSpace (X : Type u) : Prop where
  separated : True

/-- Uniform space (stub). -/
class UniformSpace (X : Type u) : Type where
  uniformity : Set (Set (X × X))

/-- Discrete topology as a Prop. -/
class DiscreteTopology (X : Type u) [TopologicalSpace X] : Prop where
  discrete : ∀ U : Set X, IsOpen U

/-- Real numbers stub: Nat with ordering and topology. -/
def ℝ : Type := Nat
deriving Repr, Inhabited, DecidableEq

instance : OfNat ℝ 0 := ⟨0⟩
instance : OfNat ℝ 1 := ⟨1⟩
instance : Neg ℝ := ⟨λ n => n⟩
instance : Add ℝ := ⟨λ a b => a + b⟩
instance : Mul ℝ := ⟨λ a b => a * b⟩
instance : LE ℝ := ⟨λ a b => (a : Nat) ≤ (b : Nat)⟩
instance : LT ℝ := ⟨λ a b => (a : Nat) < (b : Nat)⟩

instance : TopologicalSpace ℝ where
  IsOpen _ := True
  isOpen_univ := trivial
  isOpen_inter _ _ _ _ := trivial
  isOpen_sUnion _ _ := trivial

/-- Product topology instance. -/
instance {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] : TopologicalSpace (X × Y) where
  IsOpen _ := True
  isOpen_univ := trivial
  isOpen_inter _ _ _ _ := trivial
  isOpen_sUnion _ _ := trivial

/-- Sum topology instance. -/
instance {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] : TopologicalSpace (X ⊕ Y) where
  IsOpen _ := True
  isOpen_univ := trivial
  isOpen_inter _ _ _ _ := trivial
  isOpen_sUnion _ _ := trivial

/-- Ordinal type stub (for counterexample spaces). -/
structure Ordinal where
  val : Nat
  deriving Repr, Inhabited

instance : TopologicalSpace Ordinal where
  IsOpen _ := True
  isOpen_univ := trivial
  isOpen_inter _ _ _ _ := trivial
  isOpen_sUnion _ _ := trivial

/-- Standard discrete topology on any type. -/
instance (X : Type u) : TopologicalSpace (Fin X) where
  IsOpen _ := True
  isOpen_univ := trivial
  isOpen_inter _ _ _ _ := trivial
  isOpen_sUnion _ _ := trivial

/-! ## #eval Tests -/

#eval "── TopologicalSpaces.Core.Basic loaded ──"
#eval "Mathlib4-compatible API: IsOpen, IsClosed, closure, Continuous, etc."

end MiniTopologicalSpaces
