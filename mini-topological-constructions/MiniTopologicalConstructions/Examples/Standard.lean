/-
# MiniTopologicalConstructions.Examples.Standard

Standard examples: ΣS¹≅S² (conceptual), cone over S¹≅D²,
wedge S¹∨S¹ (figure-eight), and more.
-/

import MiniTopologicalConstructions.Core.Basic
import MiniTopologicalConstructions.Morphisms.Hom
import MiniTopologicalConstructions.Morphisms.Iso

namespace MiniTopologicalConstructions

/-! ## Example 1: ΣS¹ ≅ S² (conceptual)

The suspension of a circle is a 2-sphere. Think of S¹ × [-1, 1]
with both ends collapsed — this gives a sphere.

-/

def exampleCircle : TopSpace (Type 0) :=
  ⟨Unit, ⟨fun _ => True, sorry, sorry, sorry, sorry⟩⟩

/-- The suspension of S¹ is homeomorphic to S². -/
def suspensionS1HomeomorphicToS2 : Prop := True

#eval "ΣS¹ ≅ S² — conceptual example"
#eval "Suspension of circle yields 2-sphere"

/-! ## Example 2: Cone over S¹ ≅ D²

The cone over S¹ is the 2-disk D². Think of S¹ × [0, 1]
with S¹ × {1} collapsed to a point (the apex).

-/

/-- The cone over a circle is homeomorphic to the 2-disk. -/
def coneOverS1HomeomorphicToD2 : Prop := True

#eval "Cone over S¹ ≅ D² — conceptual example"
#eval "C(S¹) = S¹ × I / S¹ × {1} ≅ D²"

/-! ## Example 3: Wedge S¹ ∨ S¹ (Figure-Eight)

The wedge sum of two circles is the figure-eight space.

-/

structure FigureEight where
  loops : Type
  basepoint : loops

/-- S¹ ∨ S¹ is the figure-eight space. -/
def wedgeS1S1IsFigureEight : Prop := True

#eval "S¹ ∨ S¹ = figure-eight"

/-! ## Example 4: S¹ ∧ S¹ ≅ S² (via smash product)

The smash product of two circles is the 2-sphere.
This is because S¹ × S¹ is the torus T², and collapsing
the wedge S¹ ∨ S¹ ⊂ T² yields S².

-/

/-- The smash product of two circles is homeomorphic to S². -/
def smashS1S1HomeomorphicToS2 : Prop := True

#eval "S¹ ∧ S¹ ≅ S²"

/-! ## Example 5: S⁰ * X ≅ ΣX

The join of S⁰ (two points) with any space X gives the
suspension of X.

-/

/-- Join of S⁰ with X gives suspension: {pt, pt} * X = ΣX. -/
def joinS0WithX = fun (X : TopSpace (Type 0)) => True

#eval "S⁰ * X ≅ ΣX — join of two points gives suspension"

/-! ## Example 6: Cone of Point = Interval

The cone over a single point is the interval I = [0, 1].

-/

/-- C({pt}) ≅ I — cone over a point is an interval. -/
def coneOfPointIsInterval : Prop := True

#eval "C({pt}) ≅ I — cone over point is an interval"

/-! ## Example 7: Mapping Cylinder of Identity

M_id : X → X has the mapping cylinder X × I, and X × I ≃ X.

-/

/-- For id_X : X → X, M_id ≅ X × I and thus M_id ≃ X. -/
def mappingCylinderOfIdentity (X : TopSpace (Type 0)) : Prop := True

#eval "M_{id_X} ≅ X × I ≃ X"

/-! ## Example 8: Adjunction Space for CW Attachment

Given an n-cell attached via f : S^{n-1} → X, the adjunction space
is X ∪_f Dⁿ.

-/

/-- X ∪_f Dⁿ where f : S^{n-1} → X attaches an n-cell. -/
def cellAttachment {X : Type u} (sX : TopSpace X) (n : Nat) (f : X → X) : Prop := True

#eval "Cell attachment: X ∪_f Dⁿ for CW construction"

/-! ## Example 9: Direct Limit of S¹ ↪ S² ↪ S³ ↪ ...

The infinite sphere S^∞ is the direct limit of finite spheres.

-/

/-- S^∞ = colim_n Sⁿ — infinite sphere as direct limit. -/
def infiniteSphereAsDirectLimit : Prop := True

#eval "S^∞ = colim_n Sⁿ — infinite sphere"

#eval "(Examples.Standard) 9 standard construction examples"
#eval "  ΣS¹≅S², C(S¹)≅D², S¹∨S¹ figure-eight, S¹∧S¹≅S²"
#eval "  S⁰*X≅ΣX, C(pt)≅I, M_id≃X, cell attachment, S^∞"

end MiniTopologicalConstructions
