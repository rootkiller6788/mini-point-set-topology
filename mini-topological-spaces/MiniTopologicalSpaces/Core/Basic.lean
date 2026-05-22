/-
# MiniTopologicalSpaces: Basic Definitions

Defines `TopologicalSpace` via the open sets axiomatization and
all fundamental derived concepts: OpenSet, ClosedSet, Neighborhood,
Interior, Closure, Boundary, LimitPoint, IsolatedPoint, Dense, Separable.
-/

import MiniObjectKernel.Core.Basic

namespace MiniTopologicalSpaces

open MiniObjectKernel

/-! ## Topological Space (Open Sets Axiomatization)

A topological space consists of a type `X` and a collection of
"open" subsets satisfying:
1. The empty set and the whole space are open.
2. Arbitrary unions of open sets are open.
3. Finite intersections of open sets are open.
-/

structure TopologicalSpace (X : Type u) where
  opens : Set (Set X)
  contains_univ : Set.univ ∈ opens
  contains_empty : ∅ ∈ opens
  closed_under_union : ∀ (𝒰 : Set (Set X)), (∀ U ∈ 𝒰, U ∈ opens) → (⋃₀ 𝒰) ∈ opens
  closed_under_inter : ∀ U V, U ∈ opens → V ∈ opens → U ∩ V ∈ opens

attribute [instance] TopologicalSpace.opens

/-! ## Open and Closed Sets -/

def OpenSet (X : Type u) [t : TopologicalSpace X] :=
  {U : Set X // U ∈ t.opens}

def ClosedSet (X : Type u) [t : TopologicalSpace X] :=
  {F : Set X // (Set.univ \ F) ∈ t.opens}

/-! ## Neighborhood -/

def Neighborhood (X : Type u) [t : TopologicalSpace X] (x : X) :=
  {N : Set X // ∃ U ∈ t.opens, x ∈ U ∧ U ⊆ N}

/-! ## Interior -/

def interior (X : Type u) [t : TopologicalSpace X] (A : Set X) : Set X :=
  ⋃₀ {U | U ∈ t.opens ∧ U ⊆ A}

/-! ## Closure -/

def closure (X : Type u) [t : TopologicalSpace X] (A : Set X) : Set X :=
  {x : X | ∀ U, U ∈ t.opens → x ∈ U → (A ∩ U).Nonempty}

/-! ## Boundary -/

def boundary (X : Type u) [t : TopologicalSpace X] (A : Set X) : Set X :=
  closure X A ∩ closure X (Set.univ \ A)

/-! ## Limit Point -/

def LimitPoint (X : Type u) [t : TopologicalSpace X] (A : Set X) (x : X) : Prop :=
  ∀ U, U ∈ t.opens → x ∈ U → (A ∩ U) \ {x} ≠ ∅

/-! ## Isolated Point -/

def IsolatedPoint (X : Type u) [t : TopologicalSpace X] (A : Set X) (x : X) : Prop :=
  x ∈ A ∧ ∃ U ∈ t.opens, x ∈ U ∧ A ∩ U = {x}

/-! ## Dense and Separable -/

def Dense (X : Type u) [t : TopologicalSpace X] (A : Set X) : Prop :=
  closure X A = Set.univ

def Separable (X : Type u) [t : TopologicalSpace X] : Prop :=
  ∃ (D : Set X), D.Countable ∧ Dense X D

/-! ## Discrete topology (for eval tests) -/

def discreteTopology (X : Type u) : TopologicalSpace X where
  opens := Set.univ
  contains_univ := by trivial
  contains_empty := by trivial
  closed_under_union 𝒰 h := by
    apply Set.mem_univ
  closed_under_inter U V hU hV := by
    apply Set.mem_univ

/-! ## Indiscrete topology (for eval tests) -/

def indiscreteTopology (X : Type u) : TopologicalSpace X where
  opens := {∅, Set.univ}
  contains_univ := by simp
  contains_empty := by simp
  closed_under_union 𝒰 h := by
    by_cases h𝒰 : ∃ U ∈ 𝒰, U = Set.univ
    · obtain ⟨U, hU, hUeq⟩ := h𝒰
      have : ⋃₀ 𝒰 = Set.univ := by
        ext x; constructor <;> (intro; apply Set.mem_univ)
      -- Actually: if any U = univ, the union is univ, which is open
      simp [this]
    · -- All U in 𝒰 are empty, so the union is empty
      have : ⋃₀ 𝒰 = (∅ : Set X) := by
        ext x; constructor
        · intro hx
          rcases hx with ⟨U, hU, hxU⟩
          have hUempty : U = (∅ : Set X) := by
            have hUmem : U ∈ ({∅, Set.univ} : Set (Set X)) := h hU
            simp at hUmem
            rcases hUmem with (hUeq | hUeq)
            · exact hUeq
            · exact (h𝒰 ⟨U, hU, hUeq⟩).elim
          rw [hUempty] at hxU
          exact hxU.elim
        · intro hx
          exact hx.elim
      simp [this]
  closed_under_inter U V hU hV := by
    have hUmem : U ∈ ({∅, Set.univ} : Set (Set X)) := hU
    have hVmem : V ∈ ({∅, Set.univ} : Set (Set X)) := hV
    simp at hUmem hVmem
    rcases hUmem with (hUeq | hUeq)
    · rcases hVmem with (hVeq | hVeq)
      · simp [hUeq, hVeq]
      · simp [hUeq, hVeq]
    · rcases hVmem with (hVeq | hVeq)
      · simp [hUeq, hVeq]
      · simp [hUeq, hVeq]

/-! ## #eval Tests -/

#eval "── Core.Basic: discreteTopology ──"
#eval (discreteTopology Nat).contains_univ
#eval (indiscreteTopology Nat).contains_empty
#eval "Discrete and indiscrete topologies defined"

end MiniTopologicalSpaces
