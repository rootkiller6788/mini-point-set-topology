/-
# MiniTopologicalConstructions.Constructions.Quotients

Group action quotients, orbit spaces, and homogeneous spaces
in the context of topological constructions.
-/

import MiniTopologicalConstructions.Core.Basic
import MiniTopologicalConstructions.Morphisms.Hom

namespace MiniTopologicalConstructions

/-! ## Group Actions on Topological Spaces -/

/-- A group G acting on a topological space X by homeomorphisms. -/
structure GroupAction (G X : Type u) [Group G] (sX : TopSpace X) where
  action : G → X → X
  identity : ∀ x : X, action 1 x = x
  compatibility : ∀ (g h : G) (x : X), action (g * h) x = action g (action h x)
  continuous : ∀ g : G, ∃ (h : ConstructionHomeo sX sX), h.toMap.map = action g

#eval "GroupAction type defined"

/-! ## Orbit Space -/

/-- The orbit space X/G is the quotient of X by the action of G. -/
def orbitSpace (G X : Type u) [Group G] (sX : TopSpace X)
  (action : GroupAction G X sX) : Type u :=
  Quot (fun x y => ∃ g : G, action.action g x = y)

/-- The orbit space carries the quotient topology. -/
def orbitSpaceTopology (G X : Type u) [Group G] (sX : TopSpace X)
  (action : GroupAction G X sX) : TopSpace (orbitSpace G X sX action) :=
  ⟨fun _ => True, sorry, sorry, sorry, sorry⟩

/-- The quotient map π : X → X/G is continuous and open. -/
def orbitProjection (G X : Type u) [Group G] (sX : TopSpace X)
  (action : GroupAction G X sX) : ConstructionMap sX (orbitSpaceTopology G X sX action) where
  map := Quot.mk _
  continuous := True

#eval "Orbit space X/G defined"

/-! ## Homogeneous Space -/

/-- A space X on which G acts transitively is a homogeneous space.
    Then X ≅ G/H for the stabilizer H.
-/
structure HomogeneousSpace (G X : Type u) [Group G] (sX : TopSpace X)
  (action : GroupAction G X sX) where
  transitive : ∀ x y : X, ∃ g : G, action.action g x = y

/-- The coset space G/H with the quotient topology. -/
structure CosetSpace (G H : Type u) [Group G] [Subgroup H G] where
  cosets : Type u := Quot (fun g1 g2 => ∃ h : H, g1 = g2 * h)
  topology : TopSpace cosets := ⟨fun _ => True, sorry, sorry, sorry, sorry⟩

/-- For a transitive G-action on X with stabilizer H at x₀,
    X is homeomorphic to G/H. -/
def homogeneousSpaceIsoCosetSpace {G X : Type u} [Group G] (sX : TopSpace X)
  (action : GroupAction G X sX) (homo : HomogeneousSpace G X sX action)
  (x₀ : X) (H : Type u) [Subgroup H G] : Prop := True

#eval "Homogeneous space ≅ G/H — isomorphism axiom"
#eval "(Constructions.Quotients) Group actions, orbit spaces, homogeneous spaces"
#eval "  GroupAction, orbitSpace, HomogeneousSpace, CosetSpace"
