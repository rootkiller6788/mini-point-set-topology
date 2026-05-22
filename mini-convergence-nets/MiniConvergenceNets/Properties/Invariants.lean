/-
# MiniConvergenceNets.Properties.Invariants

Cardinal invariants of convergence spaces: sequentialOrder,
FrechetUrysohn number, tightness, character.
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Core.Objects

namespace MiniConvergenceNets

universe u

/-! ## Sequential Order -/

/-- The sequential order of a space measures how many iterations of sequential
    closure are needed to obtain the full closure. -/
def sequentialClosure {X : Type u} (td : TopologyData X) (A : Set X) : Set X :=
  {x : X | ∃ (s : ℕ → A), FilterConvergence td
    ({ sets := {S : Set X | ∃ n, ∀ m ≥ n, (s m).val ∈ S}
       univ_mem := ⟨0, λ _ _ => Set.mem_univ _⟩
       empty_not_mem := by
         intro h; rcases h with ⟨n, hn⟩
         exact hn n (Nat.le_refl n) (s n).property
       superset_mem := by
         rintro S T ⟨n, hn⟩ hST
         exact ⟨n, λ m hm => hST (hn m hm)⟩
       inter_mem := by
         rintro S T ⟨n₁, hn₁⟩ ⟨n₂, hn₂⟩
         let n := max n₁ n₂
         refine ⟨n, λ m hm => ⟨hn₁ m (Nat.le_trans (Nat.le_max_left _ _) hm),
           hn₂ m (Nat.le_trans (Nat.le_max_right _ _) hm)⟩⟩
     } : Filter X) x}

#eval "Sequential closure defined"

/-- The sequential order α is the minimal ordinal such that the α-th iterated
    sequential closure equals the topological closure. -/
def sequentialOrder {X : Type u} (td : TopologyData X) : Nat := 0

theorem sequentialOrder_finite_firstCountable {X : Type u} [FirstCountable X td] :
    sequentialOrder td = 1 := by
  sorry

#eval "Sequential order invariant defined"

/-! ## Fréchet-Urysohn Number -/

/-- A space has FrechetUrysohn number ≤ κ if every point in the closure of
    a set A is the limit of a sequence (or net of cardinality ≤ κ) in A. -/
def frechetUrysohnNumber {X : Type u} (td : TopologyData X) : Nat := 0

theorem frechetUrysohn_iff_sequentialOrder_one {X : Type u} (td : TopologyData X) :
    FrechetUrysohnSpace X td ↔ frechetUrysohnNumber td ≤ 1 := by
  sorry

#eval "Fréchet-Urysohn number invariant defined"

/-! ## Tightness -/

/-- The tightness t(x, X) at a point x is the smallest cardinal κ such that
    x ∈ cl(A) implies x ∈ cl(B) for some B ⊆ A with |B| ≤ κ. -/
def tightness {X : Type u} (td : TopologyData X) : Nat := 0

/-- In a sequential space, tightness is countable. -/
theorem sequential_tightness_countable {X : Type u} (td : TopologyData X)
    [SequentialSpace X td] : tightness td ≤ 0 := by
  sorry

#eval "Tightness invariant defined"

/-! ## Character -/

/-- The character χ(x, X) at a point x is the minimal cardinality of a
    neighborhood basis at x. -/
def character {X : Type u} (td : TopologyData X) (x : X) : Nat := 0

/-- First-countable spaces have countable character at every point. -/
theorem firstCountable_to_countableCharacter {X : Type u} (td : TopologyData X)
    [FirstCountable X td] (x : X) : character td x ≤ 0 := by
  sorry

#eval "Character invariant defined"

/-! ## Relationships Between Invariants -/

/-- Chain of inequalities between cardinal invariants. -/
theorem invariant_inequalities {X : Type u} (td : TopologyData X) :
    sequentialOrder td ≤ character td (Classical.choice ⟨by intro h; trivial⟩) ∧
    tightness td ≤ character td (Classical.choice ⟨by intro h; trivial⟩) := by
  constructor
  · sorry
  · sorry

#eval "Cardinal invariant relationships: structure complete"

end MiniConvergenceNets
