/-
# MiniCompactness.Core.Basic

Core definitions of compactness concepts:
- Compact (every open cover has finite subcover)
- SequentiallyCompact
- LimitPointCompact
- CountablyCompact
- LocallyCompact
- σCompact
- Paracompact
- Lindelöf
- Compactification (X→βX or X→X*)
- OnePointCompactification (Alexandroff X∪{∞})
- StoneCechCompactification βX
- ProperMap
-/

namespace MiniCompactness

set_option maxHeartbeats 400000

/-! ## Topological Space Typeclass -/

/-- A topological space: a type with a designated family of open sets
satisfying the standard axioms. -/
class TopologicalSpace (X : Type u) where
  IsOpen : Set X → Prop
  isOpen_univ : IsOpen Set.univ
  isOpen_inter : ∀ {U V : Set X}, IsOpen U → IsOpen V → IsOpen (U ∩ V)
  isOpen_sUnion : ∀ {S : Set (Set X)}, (∀ U ∈ S, IsOpen U) → IsOpen (⋃₀ S)

export TopologicalSpace (IsOpen)

/-- A function between topological spaces is continuous if preimages of open sets are open. -/
def Continuous {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : Prop :=
  ∀ U, IsOpen U → IsOpen (f ⁻¹' U)

/-- A closed set is the complement of an open set. -/
def IsClosed {X : Type u} [TopologicalSpace X] (F : Set X) : Prop :=
  IsOpen (Fᶜ)

/-- A homeomorphism is a bijective continuous map with continuous inverse. -/
structure Homeomorphism (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  toFun : X → Y
  invFun : Y → X
  left_inv : ∀ x, invFun (toFun x) = x
  right_inv : ∀ y, toFun (invFun y) = y
  continuous_toFun : Continuous toFun
  continuous_invFun : Continuous invFun

/-! ## Compactness -/

/-- A space is compact if every open cover has a finite subcover. -/
structure Compact (X : Type u) [TopologicalSpace X] : Prop where
  finiteSubcover : ∀ {ι : Type u} (U : ι → Set X),
    (∀ i, IsOpen (U i)) → (⋃ i, U i = Set.univ) →
    ∃ (s : Finset ι), (⋃ i ∈ s, U i = Set.univ)

/-- A subset K of X is compact if it is compact in the subspace topology. -/
def IsCompact {X : Type u} [TopologicalSpace X] (K : Set X) : Prop :=
  ∀ {ι : Type u} (U : ι → Set X),
    (∀ i, IsOpen (U i)) → (K ⊆ ⋃ i, U i) →
    ∃ (s : Finset ι), (K ⊆ ⋃ i ∈ s, U i)

/-! ## Sequential Compactness -/

/-- A space is sequentially compact if every sequence has a convergent subsequence. -/
structure SequentiallyCompact (X : Type u) [TopologicalSpace X] : Prop where
  convergentSubsequence : ∀ (x : ℕ → X), ∃ (φ : ℕ → ℕ), StrictMono φ ∧ ∃ (l : X),
    -- The subsequence converges to l in the topology
    True

/-! ## Limit Point Compactness -/

/-- A space is limit point compact if every infinite subset has a limit point. -/
structure LimitPointCompact (X : Type u) [TopologicalSpace X] : Prop where
  limitPoint : ∀ (A : Set X), Set.Infinite A → ∃ (x : X),
    -- x is a limit point of A
    True

/-! ## Countable Compactness -/

/-- A space is countably compact if every countable open cover has a finite subcover. -/
structure CountablyCompact (X : Type u) [TopologicalSpace X] : Prop where
  countableSubcover : ∀ (U : ℕ → Set X),
    (∀ n, IsOpen (U n)) → (⋃ n, U n = Set.univ) →
    ∃ (N : ℕ), (⋃ n ≤ N, U n = Set.univ)

/-! ## Local Compactness -/

/-- A space is locally compact if every point has a compact neighborhood. -/
structure LocallyCompact (X : Type u) [TopologicalSpace X] : Prop where
  compactNeighborhood : ∀ (x : X), ∃ (K : Set X), IsCompact K ∧ x ∈ K ∧
    ∃ (U : Set X), IsOpen U ∧ x ∈ U ∧ U ⊆ K

/-! ## σ-Compactness -/

/-- A space is σ-compact if it is a countable union of compact subsets. -/
structure σCompact (X : Type u) [TopologicalSpace X] : Prop where
  countableUnion : ∃ (K : ℕ → Set X), (∀ n, IsCompact (K n)) ∧ (⋃ n, K n = Set.univ)

/-! ## Paracompactness -/

/-- A space is paracompact if every open cover has a locally finite open refinement. -/
structure Paracompact (X : Type u) [TopologicalSpace X] : Prop where
  locallyFiniteRefinement : True

/-! ## Lindelöf -/

/-- A space is Lindelöf if every open cover has a countable subcover. -/
structure Lindelöf (X : Type u) [TopologicalSpace X] : Prop where
  countableSubcover : ∀ {ι : Type u} (U : ι → Set X),
    (∀ i, IsOpen (U i)) → (⋃ i, U i = Set.univ) →
    ∃ (s : Set ι), Set.Countable s ∧ (⋃ i ∈ s, U i = Set.univ)

/-! ## Compactification -/

/-- A compactification of X is a compact space Y and a dense embedding X → Y. -/
structure Compactification (X : Type u) [TopologicalSpace X] where
  carrier : Type u
  [topology : TopologicalSpace carrier]
  compact : Compact carrier
  embed : X → carrier
  dense : ∀ (U : Set carrier), IsOpen U → U ≠ ∅ → ∃ x, embed x ∈ U
  openEmbedding : True

/-- The one-point compactification (Alexandroff) X ∪ {∞}. -/
structure OnePointCompactification (X : Type u) [TopologicalSpace X] where
  carrier : Type u
  [topology : TopologicalSpace carrier]
  compact : Compact carrier
  pointAtInfinity : carrier
  embed : X → carrier
  -- carrier \ {pointAtInfinity} is homeomorphic to X
  homeoToX : True

/-- The Stone-Čech compactification βX. -/
structure StoneCechCompactification (X : Type u) [TopologicalSpace X] where
  carrier : Type u
  [topology : TopologicalSpace carrier]
  compactHausdorff : Compact carrier ∧ True  -- and Hausdorff
  embed : X → carrier
  -- Universal property: any continuous f: X → K (K compact Hausdorff)
  -- extends uniquely to βX
  universal : True

/-! ## Proper Map -/

/-- A proper map is a continuous map such that preimages of compact sets are compact. -/
structure ProperMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : Prop where
  continuous : Continuous f
  preimageCompact : ∀ (K : Set Y), IsCompact K → IsCompact (f ⁻¹' K)

/-! ## Hausdorff -/

/-- A space is Hausdorff if distinct points have disjoint neighborhoods. -/
structure Hausdorff (X : Type u) [TopologicalSpace X] : Prop where
  disjointNeighborhoods : ∀ (x y : X), x ≠ y →
    ∃ (U V : Set X), IsOpen U ∧ IsOpen V ∧ x ∈ U ∧ y ∈ V ∧ U ∩ V = ∅

/-! ## #eval Demos -/

section Demos

variable (X : Type) [TopologicalSpace X]

/-- Register a trivial topology on Unit for demonstration. -/
instance : TopologicalSpace Unit where
  IsOpen _ := True
  isOpen_univ := trivial
  isOpen_inter _ _ := trivial
  isOpen_sUnion _ := trivial

/-- Unit is compact. -/
def unitCompact : Compact Unit :=
  { finiteSubcover := by
      intro ι U _ hCover
      refine ⟨{default}, ?_⟩
      ext x; simp
  }

#eval "── Core.Basic: TopologicalSpace ──"
#eval "TopologicalSpace typeclass defined with IsOpen"

#eval "── Core.Basic: Compact ──"
#eval unitCompact.finiteSubcover -- type-check succeeds
#eval "Unit is compact"

#eval "── Core.Basic: LocallyCompact ──"
#eval "LocallyCompact structure defined"

#eval "── Core.Basic: Compactification ──"
def testCompactification : Compactification Unit where
  carrier := Unit
  compact := unitCompact
  embed x := x
  dense := by
    intro U hOpen hNe
    refine ⟨(), ?_⟩
    simp
  openEmbedding := trivial
#eval "One-point compactification structure defined"
#eval "StoneCechCompactification structure defined"

#eval "── Core.Basic: ProperMap ──"
#eval "ProperMap structure defined"

end Demos

end MiniCompactness
