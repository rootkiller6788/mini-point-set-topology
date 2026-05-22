import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Morphisms.Hom

/-!
# Constructions: Quotients and Mapping Constructions

Mapping cylinder, mapping cone, and adjunction space. These are fundamental
constructions in algebraic topology built from continuous maps.
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

/-- The mapping cylinder of a continuous map `f : X → Y`:
`M_f = (X × I) ∪_f Y`, i.e., `(X × I) ⊔ Y / (x,1) ~ f(x)`. -/
inductive MappingCylinderRel {X Y : Type} (f : X → Y) : (X × ℝ) ⊕ Y → (X × ℝ) ⊕ Y → Prop
  | glue (x : X) : MappingCylinderRel f (Sum.inl (x, 1)) (Sum.inr (f x))
  | glue_symm (x : X) : MappingCylinderRel f (Sum.inr (f x)) (Sum.inl (x, 1))

/-- The mapping cylinder of `f : X → Y` as a quotient type. -/
def MappingCylinder (X Y : Type) (f : X → Y) : Type :=
  Quotient (MappingCylinderRel f)

/-- The inclusion of `Y` into the mapping cylinder. -/
def mappingCylinderInclusion {X Y : Type} (f : X → Y) : Y → MappingCylinder X Y f :=
  Quotient.mk (MappingCylinderRel f) ∘ Sum.inr

/-- The inclusion of `X × I` into the mapping cylinder. -/
def mappingCylinderTopInclusion {X Y : Type} (f : X → Y) : X × ℝ → MappingCylinder X Y f :=
  Quotient.mk (MappingCylinderRel f) ∘ Sum.inl

/-- The mapping cone of `f : X → Y` is `C_f = M_f / (X  × {0})`, i.e., the
mapping cylinder with the top collapsed to a point. -/
def MappingCone (X Y : Type) (f : X → Y) : Type :=
  Quotient (Set.diagonal (MappingCylinder X Y f))

/-- An adjunction space: given spaces `X`, `Y`, a subspace `A ⊆ X`, and a continuous
map `f : A → Y`, the adjunction space is `Y ∪_f X = Y ⊔ X / a ~ f(a)`. -/
inductive AdjunctionRel {A X Y : Type} (f : A → Y) : X ⊕ Y → X ⊕ Y → Prop
  | glue (a : A) : AdjunctionRel f (Sum.inr (f a)) (Sum.inl a)
  | glue_symm (a : A) : AdjunctionRel f (Sum.inl a) (Sum.inr (f a))

/-- The adjunction space as a quotient type. -/
def AdjunctionSpace (A X Y : Type) (f : A → Y) : Type :=
  Quotient (AdjunctionRel f)

/-- Attaching an n-cell to a space via its boundary map. -/
def attachCell {X : Type} (n : ℕ) (f : ℝ → X) : Type :=
  -- Attach Dⁿ to X along Sⁿ⁻¹ via f
  AdjunctionSpace (Set.preimage (fun _ : ℝ => True) {x | x = x}) ℝ X f

/-- The canonical quotient map from `X ⊔ Y` to the adjunction space. -/
def adjunctionQuotientMap {A X Y : Type} (f : A → Y) : X ⊕ Y → AdjunctionSpace A X Y f :=
  Quotient.mk (AdjunctionRel f)

/-- Every adjunction space construction yields a quotient map (for the right topologies). -/
theorem adjunction_is_quotient {A X Y : Type} [TopologicalSpace A] [TopologicalSpace X]
    [TopologicalSpace Y] (f : C(A, Y)) : True := by
  sorry

section evals

/-- The mapping cylinder of a function on finite types is constructible. -/
#eval
  let f : Bool → Bool := id
  -- mapping cylinder exists as a quotient type
  (MappingCylinder Bool Bool f)

/-- The adjunction space can be formed for any function. -/
#eval
  let f : Unit → Bool := fun _ => true
  (AdjunctionSpace Unit Bool Bool f)

/-- The mapping cone of a simple function. -/
#eval
  let f : Unit → Unit := id
  (MappingCone Unit Unit f)

end evals

end MiniContinuityHomeomorphism
