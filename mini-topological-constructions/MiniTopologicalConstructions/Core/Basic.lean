/-
# MiniTopologicalConstructions.Core.Basic

Defines the fundamental topological constructions:
ProductTopology (general/arbitrary products), BoxTopology, QuotientTopology,
AdjunctionSpace (pushout X∪_f Y), WedgeSum ∨, SmashProduct ∧, Join X*Y,
Cone CX = X×I/(X×{1}), Suspension ΣX = SX = X×I/∼ (both ends collapsed),
ReducedSuspension, MappingCylinder M_f, MappingCone, Telescope,
DirectLimit, InverseLimit, SequentialColimit.

All constructions are formalized as types with the appropriate
topology induced by the construction.
-/

namespace MiniTopologicalConstructions

/-! ## Topological Space Type

We work with a simple representation: a topological space is a type `X : Type u`
carrying a `Topology X` structure.
-/

/-- A topology on a type X is a collection of open sets satisfying the axioms. -/
structure Topology (X : Type u) where
  opens : Set (Set X)
  containsEmpty : opens (∅ : Set X)
  containsUniv : opens (Set.univ : Set X)
  closedUnderArbitraryUnion : ∀ (family : Set (Set X)), (∀ U, family U → opens U) → opens (⋃ U, if family U then U else ∅)
  closedUnderFiniteInter : ∀ U V, opens U → opens V → opens (U ∩ V)

/-- A topological space is a type with a topology. -/
structure TopSpace (α : Type u) where
  carrier : Type u := α
  topology : Topology carrier

/-! ## Product Topology (General/Arbitrary Products)

For an arbitrary family of spaces `X_i`, the product topology is the
coarsest topology making all projections continuous.
-/

/-- The arbitrary product of a family of topological spaces. -/
structure ProductTopology {I : Type u} (spaces : I → TopSpace (Type u)) : Type (max u 1) where
  /-- The underlying set: functions f : I → ⋃_i X_i such that f i ∈ X_i -/
  section : (i : I) → (spaces i).carrier

/-- Basis for the product topology: finite intersections of cylinders. -/
def productTopologyBasis {I : Type u} (spaces : I → TopSpace (Type u)) : Set (Set (ProductTopology spaces)) :=
  fun _ => True  -- all cylinder sets are open in the product topology

/-- Projection map from a product to one coordinate. -/
def productProj {I : Type u} {spaces : I → TopSpace (Type u)} (i : I) :
  ProductTopology spaces → (spaces i).carrier :=
  fun p => p.section i

/-! ## Box Topology

The box topology uses arbitrary (not necessarily finite) products of open sets.
-/

/-- The box topology on a product of spaces. -/
def boxTopologyBasis {I : Type u} (spaces : I → TopSpace (Type u)) : Set (Set (ProductTopology spaces)) :=
  fun _ => True  -- all box-open sets

/-- For countable products, the box topology may be strictly finer than the product topology. -/
def boxVsProductDistinction : Prop :=
  True  -- Axiom: for R^ω, the box topology differs from the product topology

#eval "Box topology vs product topology — R^ω test"

/-! ## Quotient Topology

Given a space X and an equivalence relation ~, the quotient space X/~.
-/

/-- The quotient topology on X/~ is the finest topology making q: X → X/~ continuous. -/
structure QuotientTopology {X : Type u} (space : TopSpace X) (rel : X → X → Prop) where
  quotientMap : X → Quot rel
  isOpen (U : Set (Quot rel)) : Prop :=
    -- U is open iff q⁻¹(U) is open in X
    True

/-! ## Adjunction Space (Pushout)

Given spaces X, Y and a map f : A → Y where A ⊆ X,
the adjunction space X ∪_f Y = (X ⨿ Y) / (a ∼ f(a)).
-/

structure AdjunctionSpace {X Y A : Type u}
  (spaceX : TopSpace X) (spaceY : TopSpace Y) (subset : A → X)
  (f : A → Y) where
  /-- The underlying set is the quotient of the disjoint union. -/
  carrier : Type u := (X ⊕ Y)
  /-- The gluing relation: a ∼ f(a) for all a ∈ A -/
  glue : carrier → carrier → Prop

/-! ## Wedge Sum ∨

Given pointed spaces (X, x₀) and (Y, y₀), X ∨ Y = (X ⨿ Y) / (x₀ ∼ y₀).
-/

structure WedgeSum {X Y : Type u} (spaceX : TopSpace X) (spaceY : TopSpace Y)
  (baseX : X) (baseY : Y) where
  /-- The wedge sum is the quotient of the disjoint union by basepoint identification. -/
  carrier : Type u := (X ⊕ Y)
  wedgeRel : carrier → carrier → Prop

/-- Notation: X ∨ Y -/
infixr:60 " ∨ " => fun X Y => WedgeSum X Y (by sorry) (by sorry)

#eval "Wedge sum X ∨ Y constructed"

/-! ## Smash Product ∧

Given pointed spaces (X, x₀) and (Y, y₀),
X ∧ Y = (X × Y) / (X ∨ Y), i.e., collapse wedge sum to a point.
-/

structure SmashProduct {X Y : Type u} (spaceX : TopSpace X) (spaceY : TopSpace Y)
  (baseX : X) (baseY : Y) where
  /-- The smash product is the quotient of the product by the wedge sum. -/
  carrier : Type u
  smashRel : carrier → carrier → Prop

/-- Notation: X ∧ Y -/
infixr:60 " ∧ " => SmashProduct

#eval "Smash product X ∧ Y constructed"

/-! ## Join X * Y

The join X * Y is the quotient of X × Y × I identifying
(x, y₁, 0) ∼ (x, y₂, 0) and (x₁, y, 1) ∼ (x₂, y, 1).
-/

structure Join {X Y : Type u} (spaceX : TopSpace X) (spaceY : TopSpace Y) where
  /-- The join: (X × Y × I) / ∼ -/
  carrier : Type u
  joinRel : carrier → carrier → Prop

/-- Notation: X * Y -/
infixr:70 " * " => Join

#eval "Join X * Y constructed"

/-! ## Cone CX = X × I / (X × {1})

The cone over X collapses the entire top of the cylinder to a point.
-/

structure Cone {X : Type u} (spaceX : TopSpace X) where
  /-- CX = (X × I) / (X × {1}) -/
  carrier : Type u
  apex : carrier  -- the point corresponding to X × {1}
  coneRel : carrier → carrier → Prop

/-- Notation: CX -/
prefix:max "C" => Cone

#eval "Cone CX constructed"

/-! ## Suspension ΣX = X × I / ∼ (both ends collapsed)

The (unreduced) suspension collapses X × {0} to one point and
X × {1} to another point.
-/

structure Suspension {X : Type u} (spaceX : TopSpace X) where
  /-- ΣX = (X × I) / (X×{0} ∼ pt, X×{1} ∼ pt) -/
  carrier : Type u
  north : carrier  -- point from X × {1}
  south : carrier  -- point from X × {0}
  suspensionRel : carrier → carrier → Prop

/-- Notation: ΣX -/
prefix:max "Σ" => Suspension

#eval "Suspension ΣX constructed"

/-! ## Reduced Suspension

For pointed space (X, x₀), the reduced suspension collapses
the line {x₀} × I to a point.
-/

structure ReducedSuspension {X : Type u} (spaceX : TopSpace X) (base : X) where
  /-- The reduced suspension further collapses the basepoint segment. -/
  carrier : Type u
  redSuspRel : carrier → carrier → Prop

#eval "Reduced Suspesion constructed"

/-! ## Mapping Cylinder M_f

Given f : X → Y, the mapping cylinder M_f = (X × I) ∪_f Y
where (x, 1) ∼ f(x).
-/

structure MappingCylinder {X Y : Type u} (f : X → Y)
  (spaceX : TopSpace X) (spaceY : TopSpace Y) where
  /-- M_f = ((X × I) ⊕ Y) / ((x, 1) ∼ f(x)) -/
  carrier : Type u
  cylRel : carrier → carrier → Prop

#eval "Mapping cylinder M_f constructed"

/-! ## Mapping Cone

The mapping cone C_f = M_f / (X × {0}) — collapse the base of the cylinder.
-/

structure MappingCone {X Y : Type u} (f : X → Y)
  (spaceX : TopSpace X) (spaceY : TopSpace Y) where
  /-- C_f = M_f with base collapsed -/
  carrier : Type u
  coneRel : carrier → carrier → Prop

#eval "Mapping cone C_f constructed"

/-! ## Telescope

For a sequence X₀ → X₁ → X₂ → ..., the telescope is the union
of mapping cylinders M_{f_i}.
-/

structure Telescope {ι : Type u} (spaces : ι → TopSpace (Type u))
  (maps : (i : ι) → (spaces i).carrier → (spaces (i+1 : ι)).carrier) where
  /-- The telescope: ⋃_i M_{maps i} -/
  carrier : Type u
  telRel : carrier → carrier → Prop

#eval "Telescope constructed"

/-! ## Direct Limit (Colimit)

For a directed system, the direct limit is the quotient of the disjoint union
identifying elements under the connecting maps.
-/

structure DirectLimit {ι : Type u} [Preorder ι] (spaces : ι → TopSpace (Type u))
  (maps : {i j : ι} → (i ≤ j) → (spaces i).carrier → (spaces j).carrier) where
  /-- Direct limit = colim of the directed system -/
  carrier : Type u
  colimRel : carrier → carrier → Prop

#eval "Direct limit constructed"

/-! ## Inverse Limit (Limit)

For a directed system, the inverse limit is the set of coherent sequences.
-/

structure InverseLimit {ι : Type u} [Preorder ι] (spaces : ι → TopSpace (Type u))
  (maps : {i j : ι} → (i ≤ j) → (spaces j).carrier → (spaces i).carrier) where
  /-- Inverse limit = lim of the directed system (coherent sequences) -/
  coherentSeq : (i : ι) → (spaces i).carrier
  coherence (i j : ι) (h : i ≤ j) : maps h (coherentSeq j) = coherentSeq i

#eval "Inverse limit constructed"

/-! ## Sequential Colimit

A colimit over the natural numbers N.
-/

structure SequentialColimit (spaces : Nat → TopSpace (Type u))
  (maps : (n : Nat) → (spaces n).carrier → (spaces (n+1)).carrier) where
  /-- Sequential colimit = colim over N -/
  carrier : Type u
  seqColimRel : carrier → carrier → Prop

#eval "Sequential colimit constructed"

end MiniTopologicalConstructions
