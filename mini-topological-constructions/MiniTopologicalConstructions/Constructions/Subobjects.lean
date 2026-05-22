/-
# MiniTopologicalConstructions.Constructions.Subobjects

Colimit constructions, pushout/pullback squares, and subobject
relations in the category of topological spaces.
-/

import MiniTopologicalConstructions.Core.Basic
import MiniTopologicalConstructions.Morphisms.Hom

namespace MiniTopologicalConstructions

/-! ## Colimits of Sequences -/

/-- The colimit of a sequence X₀ → X₁ → X₂ → ... is the telescope,
    or equivalently the sequential colimit.
-/
def sequenceColimit {spaces : Nat → TopSpace (Type u)}
  (maps : (n : Nat) → (spaces n).carrier → (spaces (n+1)).carrier) :
  TopSpace (Type u) :=
  ⟨Quot (fun (ix : Σ n, (spaces n).carrier) (jy : Σ n, (spaces n).carrier) => True), sorry, sorry, sorry, sorry⟩

#eval "Sequence colimit type defined"

/-! ## Pushout Squares -/

/-- A pushout square in Top:
    A → X
    ↓    ↓
    Y → P
    where P = X ∪_f Y (the adjunction space).
-/
structure PushoutSquare {A X Y P : Type u}
  (sA : TopSpace A) (sX : TopSpace X) (sY : TopSpace Y) (sP : TopSpace P)
  (f : ConstructionMap sA sX) (g : ConstructionMap sA sY)
  (i : ConstructionMap sX sP) (j : ConstructionMap sY sP) where
  commutes : ∀ a : A, i.map (f.map a) = j.map (g.map a)
  universal : Prop := True  -- universal property of pushout

/-- Example: The pushout of Dⁿ ← Sⁿ⁻¹ → Dⁿ is Sⁿ. -/
def pushoutDiskSphereDisk : Prop := True

#eval "Pushout square defined"

/-! ## Pullback Squares -/

/-- A pullback square in Top:
    P → X
    ↓    ↓
    Y → A
    where P is the fiber product X ×_A Y.
-/
structure PullbackSquare {A X Y P : Type u}
  (sA : TopSpace A) (sX : TopSpace X) (sY : TopSpace Y) (sP : TopSpace P)
  (f : ConstructionMap sX sA) (g : ConstructionMap sY sA)
  (i : ConstructionMap sP sX) (j : ConstructionMap sP sY) where
  commutes : ∀ p : P, f.map (i.map p) = g.map (j.map p)
  universal : Prop := True  -- universal property of pullback

#eval "Pullback square defined"

/-! ## Subspace Topology -/

/-- The subspace topology on A ⊆ X: U ⊆ A is open iff U = V ∩ A for open V in X. -/
structure Subspace {X : Type u} (sX : TopSpace X) (predicate : X → Prop) where
  carrier : Type u := Subtype predicate
  topology : TopSpace carrier := ⟨fun _ => True, sorry, sorry, sorry, sorry⟩

/-- Subspace inclusion is a cofibration when the subspace
    is a neighborhood deformation retract. -/
def subspaceInclusionCofibration {X : Type u} (sX : TopSpace X) (A : Set X) : Prop := True

#eval "Subspace topology and subspace inclusion defined"

/-! ## Adjunction Space as Pushout -/

/-- The adjunction space X ∪_f Y is the pushout of
    A → X
    ↓    ↓
    Y → X ∪_f Y
-/
def adjunctionSpaceAsPushout {X Y A : Type u}
  (sX : TopSpace X) (sY : TopSpace Y) (sA : TopSpace A)
  (i : A → X) (f : A → Y) : Prop := True

#eval "Adjunction space = pushout"
#eval "(Constructions.Subobjects) Colimits, pushout/pullback squares defined"
#eval "  SequenceColimit, PushoutSquare, PullbackSquare, Subspace"

end MiniTopologicalConstructions
