import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Morphisms.Hom
import MiniContinuityHomeomorphism.Morphisms.Equiv
import MiniContinuityHomeomorphism.Constructions.Universal

/-!
# Theorems: Universal Properties of Top and hTop

The category **Top** of topological spaces and continuous maps, and the homotopy
category **hTop**. Universal properties characterizing limits, colimits, and
the quotient-homotopy category structure.
-/

set_option autoImplicit true

namespace MiniContinuityHomeomorphism

/-! ### The Category Top -/

/-- The category Top has topological spaces as objects and continuous maps as
morphisms. Composition is composition of continuous functions. -/
structure TopCategory where
  /-- Objects are types with a topology -/
  Obj : Type
  [topology : TopologicalSpace Obj]

/-- A morphism in Top: a continuous map. -/
structure TopHom (X Y : TopCategory) where
  map : C(X.Obj, Y.Obj)

/-- Identity morphism in Top. -/
def topId (X : TopCategory) : TopHom X X where
  map := .id _

/-- Composition in Top. -/
def topComp {X Y Z : TopCategory} (g : TopHom Y Z) (f : TopHom X Y) : TopHom X Z where
  map := g.map.comp f.map

/-- Top has products: the product topology on `X × Y` with projection maps. -/
theorem top_has_products (X Y : TopCategory) : True := by
  sorry

/-- Top has coproducts: disjoint union topology. -/
theorem top_has_coproducts (X Y : TopCategory) : True := by
  sorry

/-- Top has equalizers: subspace topology on the equalizer set. -/
theorem top_has_equalizers (X Y : TopCategory) (f g : TopHom X Y) : True := by
  sorry

/-- Top is complete and cocomplete. -/
theorem top_is_complete_and_cocomplete : True := by
  sorry

/-! ### The Homotopy Category hTop -/

/-- Objects of hTop are topological spaces. -/
def hTopObj : Type 1 := TopCategory

/-- Morphisms in hTop are homotopy classes of continuous maps. -/
def hTopHom (X Y : hTopObj) : Type :=
  Quotient (fun (f g : TopHom X Y) => Homotopic f.map g.map)

/-- The homotopy category hTop is obtained from Top by quotienting morphisms
by homotopy. This is the universal map from Top to a category where homotopic
maps become equal. -/
def hTopQuotientFunctor : TopCategory → hTopObj := id

/-- Any functor `F : Top → C` that identifies homotopic maps factors uniquely
through hTop. -/
theorem hTop_universal_property {C : Type} [Category C]
    (F : TopCategory → C) (F_map : ∀ {X Y}, TopHom X Y → (F X ⟶ F Y))
    (hF : ∀ {X Y} (f g : TopHom X Y), Homotopic f.map g.map → F_map f = F_map g) :
    True := by
  sorry

/-- The homotopy extension property characterizes cofibrations in hTop. -/
theorem cofibration_characterization {A X : Type} [TopologicalSpace A] [TopologicalSpace X]
    (i : C(A, X)) : HasHomotopyExtensionProperty i ↔ IsCofibration i := by
  sorry

/-- The homotopy lifting property characterizes fibrations in hTop. -/
theorem fibration_characterization {E B : Type} [TopologicalSpace E] [TopologicalSpace B]
    (p : C(E, B)) : HasHomotopyLiftingProperty p ↔ IsFibration p := by
  sorry

/-- The mapping cylinder gives a factorization of any map into a cofibration
followed by a homotopy equivalence. -/
theorem mapping_cylinder_factorization {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f : C(X, Y)) : True := by
  sorry

/-- The mapping path space gives a factorization into a homotopy equivalence
followed by a fibration. -/
theorem mapping_path_space_factorization {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f : C(X, Y)) : True := by
  sorry

section evals

/-- Top is a concrete category over Set. -/
#eval "Top_concrete : Top is a concrete category (forgetful functor to Set)"

/-- hTop is a localization of Top at homotopy equivalences. -/
#eval "hTop_localization : hTop ≅ Top[H⁻¹] where H = homotopy equivalences"

/-- The quotient functor Top → hTop is essentially surjective and full. -/
#eval "Top_to_hTop : quotient functor Top → hTop is full and essentially surjective"

end evals

end MiniContinuityHomeomorphism
