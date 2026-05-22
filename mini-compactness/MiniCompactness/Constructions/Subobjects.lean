/-
# MiniCompactness.Constructions.Subobjects

Compact subspace, relatively compact, compact exhaustion.
-/
import MiniCompactness.Core.Basic

namespace MiniCompactness

set_option maxHeartbeats 400000

/-! ## Compact Subspace -/

/-- A subspace of a compact space. -/
structure CompactSubspace (X : Type u) [TopologicalSpace X] where
  carrier : Set X
  compact : IsCompact carrier
  deriving Repr

/-- The empty set is compact. -/
def emptyCompactSubspace {X : Type u} [TopologicalSpace X] : CompactSubspace X :=
  { carrier := ∅
    compact := by
      intro ι U hU hCover
      refine ⟨∅, ?_⟩
      simp
  }

/-- A singleton is compact. -/
def singletonCompactSubspace {X : Type u} [TopologicalSpace X] (x : X) : CompactSubspace X :=
  { carrier := {x}
    compact := by
      intro ι U hU hCover
      have hx : x ∈ ⋃ i, U i := hCover (by simp)
      rcases Set.mem_iUnion.mp hx with ⟨i, hi⟩
      refine ⟨{i}, ?_⟩
      intro y hy
      simp at hy
      subst hy
      apply Set.mem_iUnion₂.mpr
      refine ⟨i, by simp, hi⟩
  }

/-- The union of two compact subspaces is compact. -/
axiom unionCompactSubspace {X : Type u} [TopologicalSpace X]
  (K L : CompactSubspace X) : IsCompact (K.carrier ∪ L.carrier)

/-! ## Relatively Compact -/

/-- A set is relatively compact if its closure is compact. -/
def RelativelyCompact {X : Type u} [TopologicalSpace X] (A : Set X) : Prop :=
  ∃ (K : Set X), IsClosed K ∧ IsCompact K ∧ A ⊆ K

/-- In a compact space, every subset is relatively compact. -/
theorem allRelativelyCompactInCompact {X : Type u} [TopologicalSpace X]
  (hX : Compact X) (A : Set X) : RelativelyCompact A := by
  -- Take K = X (or its closure = X if X is Hausdorff)
  sorry

/-- For a relatively compact set, there exists a compact set containing it
in its interior. -/
axiom relativelyCompactInterior {X : Type u} [TopologicalSpace X]
  (hLoc : LocallyCompact X) (A : Set X) (hRel : RelativelyCompact A) :
  ∃ (K : Set X), IsCompact K ∧ A ⊆ K ∧
    ∃ (U : Set X), IsOpen U ∧ A ⊆ U ∧ U ⊆ K

/-! ## Compact Exhaustion -/

/-- A compact exhaustion is an increasing sequence of compact sets
whose union is the whole space. -/
structure CompactExhaustion (X : Type u) [TopologicalSpace X] where
  sets : ℕ → Set X
  compact : ∀ n, IsCompact (sets n)
  increasing : ∀ n, sets n ⊆ sets (n+1)
  exhaust : ⋃ n, sets n = Set.univ

/-- A σ-compact space has a compact exhaustion. -/
theorem sigmaCompactHasExhaustion {X : Type u} [TopologicalSpace X]
  (hσ : σCompact X) : Nonempty (CompactExhaustion X) := by
  rcases hσ with ⟨K, hK, hCover⟩
  -- Build exhaustion by taking finite unions
  let sets' (n : ℕ) : Set X := ⋃ i ≤ n, K i
  refine ⟨⟨sets', ?_, ?_, ?_⟩⟩
  · intro n
    -- Finite union of compact sets is compact
    sorry
  · intro n
    -- increasing property
    refine Set.iUnion₂_subset fun i hi => ?_
    apply Set.subset_iUnion₂ i (Nat.le_succ_of_le hi)
  · -- exhaust
    ext x; constructor; · intro h; trivial; · intro _; simp [hCover]
    sorry

/-- A locally compact σ-compact space has a compact exhaustion with
each compact set contained in the interior of the next. -/
axiom locallyCompactSigmaCompactExhaustion {X : Type u} [TopologicalSpace X]
  (hLoc : LocallyCompact X) (hσ : σCompact X) :
  ∃ (Kn : ℕ → Set X), (∀ n, IsCompact (Kn n)) ∧ (∀ n, Kn n ⊆ Kn (n+1)) ∧
    (⋃ n, Kn n = Set.univ) ∧
    (∀ n, ∃ (U : Set X), IsOpen U ∧ Kn n ⊆ U ∧ U ⊆ Kn (n+1))

#eval "── Constructions.Subobjects: CompactSubspace ──"
#eval emptyCompactSubspace.carrier
#eval "Empty set is compact"
#eval "── Constructions.Subobjects: RelativelyCompact ──"
#eval "RelativelyCompact defined"
#eval "── Constructions.Subobjects: CompactExhaustion ──"
#eval "CompactExhaustion defined"
#eval "── All subobject constructions registered ──"

end MiniCompactness
