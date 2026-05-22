/-
# MiniCompactness.Morphisms.Iso

Equivalence of compactifications and homeomorphism of compactifications.
-/
import MiniCompactness.Core.Basic

namespace MiniCompactness

set_option maxHeartbeats 400000

/-! ## Homeomorphism Between Compactifications -/

/-- An equivalence of compactifications is a homeomorphism commuting with the embeddings. -/
structure CompactificationEquiv {X : Type u} [TopologicalSpace X]
  (c1 c2 : Compactification X) where
  homeo : Homeomorphism c1.carrier c2.carrier
  commutes : ∀ x, homeo.toFun (c1.embed x) = c2.embed x
  deriving Repr

/-- Reflexivity of compactification equivalence. -/
def compactificationEquivRefl {X : Type u} [TopologicalSpace X] (c : Compactification X) :
  CompactificationEquiv c c :=
  { homeo :=
      { toFun := id
        invFun := id
        left_inv := λ _ => rfl
        right_inv := λ _ => rfl
        continuous_toFun := by
          intro U hU; simpa using hU
        continuous_invFun := by
          intro U hU; simpa using hU
      }
    commutes := λ _ => rfl
  }

/-- Symmetry of compactification equivalence. -/
def compactificationEquivSymm {X : Type u} [TopologicalSpace X]
  {c1 c2 : Compactification X} (e : CompactificationEquiv c1 c2) :
  CompactificationEquiv c2 c1 :=
  { homeo :=
      { toFun := e.homeo.invFun
        invFun := e.homeo.toFun
        left_inv := e.homeo.right_inv
        right_inv := e.homeo.left_inv
        continuous_toFun := e.homeo.continuous_invFun
        continuous_invFun := e.homeo.continuous_toFun
      }
    commutes := λ x => by
      apply e.homeo.left_inv
  }

/-- Transitivity of compactification equivalence. -/
def compactificationEquivTrans {X : Type u} [TopologicalSpace X]
  {c1 c2 c3 : Compactification X}
  (e12 : CompactificationEquiv c1 c2) (e23 : CompactificationEquiv c2 c3) :
  CompactificationEquiv c1 c3 :=
  { homeo :=
      { toFun := e23.homeo.toFun ∘ e12.homeo.toFun
        invFun := e12.homeo.invFun ∘ e23.homeo.invFun
        left_inv := λ x => by
          simp [e12.homeo.left_inv, e23.homeo.left_inv]
        right_inv := λ y => by
          simp [e12.homeo.right_inv, e23.homeo.right_inv]
        continuous_toFun := by
          intro U hU
          apply e12.homeo.continuous_toFun
          apply e23.homeo.continuous_toFun
          exact hU
        continuous_invFun := by
          intro U hU
          apply e23.homeo.continuous_invFun
          apply e12.homeo.continuous_invFun
          exact hU
      }
    commutes := λ x => by
      simp [e12.commutes, e23.commutes]
  }

/-! ## Iso Between Compact Spaces -/

/-- Two compact spaces are isomorphic if they are homeomorphic. -/
structure CompactIso (X Y : Type u) [TopologicalSpace X] [TopologicalSpace Y] where
  homeo : Homeomorphism X Y
  compactX : Compact X
  compactY : Compact Y

/-- Reflexivity: any compact space is isomorphic to itself. -/
def compactIsoRefl {X : Type u} [TopologicalSpace X] (hX : Compact X) : CompactIso X X :=
  { homeo :=
      { toFun := id
        invFun := id
        left_inv := λ _ => rfl
        right_inv := λ _ => rfl
        continuous_toFun := by
          intro U hU; simpa using hU
        continuous_invFun := by
          intro U hU; simpa using hU
      }
    compactX := hX
    compactY := hX
  }

/-! ## #eval Demos -/

#eval "── Morphisms.Iso: CompactificationEquiv ──"
#eval "CompactificationEquiv defined (refl/symm/trans)"
#eval "── Morphisms.Iso: CompactIso ──"
#eval "CompactIso defined"
#eval "── All isomorphism types registered ──"

end MiniCompactness
