/-
# MiniSeparationAxioms.Core.Basic

Fundamental separation axiom definitions for topological spaces:
T0, T1, T2 (Hausdorff), T2.5 (Urysohn), T3 (Regular + T1),
T3.5 (Tychonoff / Completely Regular), T4 (Normal + T1),
T5 (Completely Normal), T6 (Perfectly Normal).

Also declares the key theorem statements (proved or sorried in Theorems/):
Urysohn Lemma, Tietze Extension, Urysohn Metrization.
-/

import MiniObjectKernel.Core.Basic
import MiniObjectKernel.Core.Objects

namespace MiniSeparationAxioms

/-! ## Separation Axiom Predicates

We define separation axioms as predicates on a type `X` equipped with
a topology.  The naming follows the standard convention where
T_i (i >= 3) includes the T1 condition.
-/

/-- A topological space is T0 (Kolmogorov) if for any two distinct points,
there is an open set containing one but not the other. -/
def T0 (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ x y : X, x ≠ y → (∃ U : Set X, IsOpen U ∧ (x ∈ U ∧ y ∉ U) ∨ (y ∈ U ∧ x ∉ U))

/-- A topological space is T1 (Frechet) if every singleton is closed. -/
def T1 (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ x : X, IsClosed ({x} : Set X)

/-- A topological space is T2 (Hausdorff) if any two distinct points
have disjoint open neighborhoods. -/
def T2 (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ x y : X, x ≠ y → ∃ U V : Set X, IsOpen U ∧ IsOpen V ∧ x ∈ U ∧ y ∈ V ∧ Disjoint U V

/-- A topological space is T2.5 (Urysohn) if any two distinct points
have closed neighborhoods that are disjoint. -/
def T2_5 (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ x y : X, x ≠ y → ∃ U V : Set X, IsOpen U ∧ IsOpen V ∧ x ∈ U ∧ y ∈ V ∧ Disjoint (closure U) (closure V)

/-- A topological space is regular if a point and a closed set not containing it
can be separated by disjoint open sets. -/
def Regular (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ (x : X) (F : Set X), IsClosed F → x ∉ F → ∃ U V : Set X, IsOpen U ∧ IsOpen V ∧ x ∈ U ∧ F ⊆ V ∧ Disjoint U V

/-- T3 = Regular + T1. -/
def T3 (X : Type u) [TopologicalSpace X] : Prop := Regular X ∧ T1 X

/-- A topological space is completely regular if a point and a closed set not
containing it can be functionally separated. -/
def CompletelyRegular (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ (x : X) (F : Set X), IsClosed F → x ∉ F → ∃ f : X → ℝ, Continuous f ∧ f x = 0 ∧ (∀ y ∈ F, f y = 1) ∧ (∀ z : X, 0 ≤ f z ∧ f z ≤ 1)

/-- T3.5 (Tychonoff) = Completely Regular + T1. -/
def T3_5 (X : Type u) [TopologicalSpace X] : Prop := CompletelyRegular X ∧ T1 X

/-- A topological space is normal if disjoint closed sets can be separated
by disjoint open sets. -/
def Normal (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ A B : Set X, IsClosed A → IsClosed B → Disjoint A B → ∃ U V : Set X, IsOpen U ∧ IsOpen V ∧ A ⊆ U ∧ B ⊆ V ∧ Disjoint U V

/-- T4 = Normal + T1. -/
def T4 (X : Type u) [TopologicalSpace X] : Prop := Normal X ∧ T1 X

/-- A topological space is completely normal if every subspace is normal. -/
def CompletelyNormal (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ (Y : Set X), Normal Y

/-- T5 = Completely Normal + T1. -/
def T5 (X : Type u) [TopologicalSpace X] : Prop := CompletelyNormal X ∧ T1 X

/-- A topological space is perfectly normal if it is normal and every closed set
is a Gδ set (countable intersection of open sets). -/
def PerfectlyNormal (X : Type u) [TopologicalSpace X] : Prop :=
  Normal X ∧ (∀ F : Set X, IsClosed F → ∃ (U : ℕ → Set X), (∀ n, IsOpen (U n)) ∧ F = ⋂ n, U n)

/-- T6 = Perfectly Normal + T1. -/
def T6 (X : Type u) [TopologicalSpace X] : Prop := PerfectlyNormal X ∧ T1 X

/-! ## Key Theorem Statements -/

/-- Urysohn Lemma: In a normal space, any two disjoint closed sets
can be functionally separated. -/
def UrysohnLemma (X : Type u) [TopologicalSpace X] : Prop :=
  Normal X → (∀ A B : Set X, IsClosed A → IsClosed B → Disjoint A B → ∃ f : X → ℝ, Continuous f ∧ (∀ x ∈ A, f x = 0) ∧ (∀ x ∈ B, f x = 1) ∧ (∀ x : X, 0 ≤ f x ∧ f x ≤ 1))

/-- Tietze Extension: A continuous real-valued function on a closed subset
of a normal space extends to the whole space. -/
def TietzeExtension (X : Type u) [TopologicalSpace X] : Prop :=
  Normal X → (∀ (A : Set X), IsClosed A → (∀ f : A → ℝ, Continuous f → ∃ g : X → ℝ, Continuous g ∧ (∀ x : A, g x = f x)))

/-- Urysohn Metrization: A regular space with a countable basis is metrizable. -/
def UrysohnMetrization (X : Type u) [TopologicalSpace X] : Prop :=
  Regular X ∧ SecondCountable X → Metrizable X

/-- Nagata-Smirnov Metrization Theorem. -/
def NagataSmirnovMetrization (X : Type u) [TopologicalSpace X] : Prop :=
  Regular X ∧ HasSigmaLocallyFiniteBasis X → Metrizable X

/-- Bing Metrization Theorem. -/
def BingMetrization (X : Type u) [TopologicalSpace X] : Prop :=
  Regular X ∧ HasSigmaDiscreteBasis X → Metrizable X

/-! ## Diagnostics -/

#eval "Core.Basic — T0..T6 + theorem statements defined"
#eval "  Separation axioms: T0, T1, T2, T2.5, T3, T3.5, T4, T5, T6"
#eval "  Theorems declared: Urysohn, Tietze, Metrization (3 variants)"

end MiniSeparationAxioms
