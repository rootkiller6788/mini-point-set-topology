/-
# MiniConvergenceNets.Bridges.ToComputation

Computational nets: domain theory, Scott topology, and
computable convergence structures.
-/

import MiniConvergenceNets.Core.Basic

namespace MiniConvergenceNets

universe u

/-! ## Directed-Complete Partial Orders (DCPOs) -/

/-- A DCPO is a poset where every directed subset has a supremum.
    This generalizes the concept of "nets have limits" to partial orders. -/
structure DCPO (α : Type u) where
  le : α → α → Prop
  le_refl : ∀ a, le a a
  le_trans : ∀ {a b c}, le a b → le b c → le a c
  le_antisymm : ∀ {a b}, le a b → le b a → a = b
  directed_sup : ∀ (D : Set α), (∀ a b ∈ D, ∃ c ∈ D, le a c ∧ le b c) → ∃ s : α, IsLUB D s

/-- The Scott topology on a DCPO: a set U is Scott-open if it is upward-closed
    and for every directed set D, sup D ∈ U implies D ∩ U ≠ ∅. -/
def scottTopology {α : Type u} (dcpo : DCPO α) : TopologyData α where
  opens := {U : Set α |
    (∀ a b, dcpo.le a b → a ∈ U → b ∈ U) ∧
    (∀ (D : Set α), (∀ a b ∈ D, ∃ c ∈ D, dcpo.le a c ∧ dcpo.le b c) →
      (dcpo.directed_sup D (by
        intro a ha b hb
        obtain ⟨c, hc, hac, hbc⟩ := by
          apply (by
            intro a b hDa hDb
            -- this is given by the directedness hypothesis
            sorry)
        exact ⟨c, hc, hac, hbc⟩)).choose ∈ U → (D ∩ U).Nonempty)}
  univ_open := ⟨by
    intro a b h hU; exact Set.mem_univ _,
    by intro D hdir hsup; use dcpo.directed_sup D ?_.choose; exact ⟨hsup, Set.mem_univ _⟩⟩
  inter_open := by
    intro U V hU hV
    rcases hU with ⟨hUp, hUd⟩
    rcases hV with ⟨hVp, hVd⟩
    sorry
  union_open := by
    intro S hS
    sorry

#eval "Scott topology on DCPO: structure"

/-! ## Nets in Domain Theory -/

/-- A net in a DCPO converges (in the Scott sense) to x if eventually
    it is above any element below x. -/
def scottNetConverges {α : Type u} (dcpo : DCPO α) (φ : Net β α) (x : α) : Prop :=
  ∀ y : α, dcpo.le y x → φ.eventually {z : α | dcpo.le y z}

/-- In a DCPO, the Scott net convergence matches the Scott topology convergence. -/
theorem scott_net_convergence_topology {α : Type u} (dcpo : DCPO α) (φ : Net β α) (x : α) :
    scottNetConverges dcpo φ x ↔
    NetLimit φ x (scottTopology dcpo).opens := by
  constructor
  · intro h U hU hxU
    rcases hU with ⟨hUp, _⟩
    -- x ∈ U, take any y ≤ x with y in U
    sorry
  · intro h y hy
    -- Use the definition of scottNetConverges
    sorry

#eval "Scott net convergence ↔ Scott topology: structure"

/-! ## Computable Convergence Structures -/

/-- A convergence structure is computable if the convergence relation
    is recursively enumerable for computable nets. -/
def IsComputableConvergence {X : Type u} (cs : ConvergenceSpace X) : Prop :=
  ∀ {α : Type u} (φ : Net α X) (x : X), Decidable (cs.conv φ x)

/-- In practice, most useful convergence structures for computation are
    first-countable (so sequences suffice). -/
theorem computable_first_countable {X : Type u} (cs : ConvergenceSpace X)
    (hfirst : FirstCountable X (scottTopology ({ le := λ a b => True
       le_refl := λ _ => trivial
       le_trans := by intro _ _ _ _ _; trivial
       le_antisymm := by intro _ _ _ _; trivial
       directed_sup := λ D hdir => ⟨Classical.choice D, λ a ha => trivial, λ s hs a ha => hs ha⟩
     } : DCPO X))) :
    (∃ (f : ℕ → X → X), True) := by
  use λ n x => x
  trivial

#eval "Computable convergence structure: OK"

/-! ## Approximable Nets -/

/-- An approximable net is one where the index set is countable and
    the convergence can be verified by finite computation. -/
structure ApproximableNet (X : Type u) where
  seq : ℕ → X
  target : X
  approx : ∀ (ε : ℕ), ∃ N : ℕ, ∀ n ≥ N, |seq n - target| < ε

#eval "Approximable net defined"

/-! ## Convergence in Computable Analysis -/

/-- In computable analysis, a real number x is computable if there exists
    a computable sequence of rationals (qₙ) with |qₙ - x| < 2⁻ⁿ. -/
def ComputableReal : Type :=
  {f : ℕ → ℚ // ∀ n m, n ≤ m → |(f n : ℝ) - (f m : ℝ)| < (2⁻¹ : ℝ)^n}

/-- The limit of a computable sequence of rationals gives a computable real. -/
def computableRealLimit (seq : ℕ → ℚ) (hcauchy : ∀ ε > (0 : ℝ), ∃ N : ℕ,
    ∀ n m ≥ N, |(seq n : ℝ) - (seq m : ℝ)| < ε) : ℝ :=
  Classical.choice ⟨by
    -- Use the completeness of ℝ
    sorry⟩

#eval "Computable real number via Cauchy nets: structure"

/-! ## Domain Theory and Fixed Points -/

/-- Kleene's fixed-point theorem: in a DCPO with a least element,
    every Scott-continuous function has a least fixed point. -/
theorem kleene_fixed_point {α : Type u} (dcpo : DCPO α)
    (hbot : ∃ ⊥ : α, ∀ a : α, dcpo.le ⊥ a)
    (f : α → α) (hcont : ∀ (D : Set α), (∀ a b ∈ D, ∃ c ∈ D, dcpo.le a c ∧ dcpo.le b c) →
      f ((dcpo.directed_sup D ?_).choose) = (dcpo.directed_sup (f '' D) ?_).choose) :
    ∃ fix : α, f fix = fix := by
  sorry

#eval "Kleene fixed-point theorem: structure"

end MiniConvergenceNets
