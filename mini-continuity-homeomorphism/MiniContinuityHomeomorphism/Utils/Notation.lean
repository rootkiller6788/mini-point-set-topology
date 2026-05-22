import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Morphisms.Hom
import MiniContinuityHomeomorphism.Morphisms.Iso

/-!
# Utils: Notation

Convenient notation for the continuity/homeomorphism package.
-/

set_option autoImplicit true

namespace MiniContinuityHomeomorphism

-- Continuous function notation
notation:25 X:25 " →C " Y:25 => C(X, Y)

-- Homeomorphism notation
notation:25 X:25 " ≅ " Y:25 => Homeomorphism X Y

-- Homotopy equivalence notation
notation:25 X:25 " ≃ₕ " Y:25 => HomotopyEquivalence X Y

-- Homotopy notation
notation:25 f:25 " ≃ " g:25 => Homotopic f g

-- Mapping cylinder
notation:60 "cyl(" f:60 ")" => MappingCylinder _ _ f

-- Mapping cone
notation:60 "cone(" f:60 ")" => MappingCone _ _ f

-- Subspace inclusion
notation:60 "ι[" A:60 "]" => Subtype.val (s := A)

-- Quotient map
notation:25 "qmap[" f:25 "]" => QuotientMap _ _ f

-- Embedding
notation:25 "emb[" e:25 "]" => Embedding _ _ e

/-- Scoped notation for function composition (g ∘ f). -/
scoped[Continuity] notation:60 f:60 " ∘C " g:60 => ContinuousFunction.comp f g

/-- The interval I = [0,1] notation. -/
notation "I" => interval

/-- The space C(X,Y) with the compact-open topology. -/
notation "C_c-o(" X ", " Y ")" => C(X, Y)

/-- The homeomorphism group of X. -/
notation "Homeo(" X ")" => HomeoGroup X

/-- Format a continuous function for display. -/
def fmtContinuous {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f : C(X, Y)) : String :=
  "ContinuousFunction(⟨fun⟩)"

section evals

/-- Demonstrate notation: X →C Y. -/
#eval
  let f : Bool →C Bool := .id _
  f true

/-- Demonstrate homeomorphism notation. -/
#eval
  let h : Bool ≅ Bool := homeomorphismRefl _
  h.toFun true

/-- Demonstrate the interval notation. -/
#eval "I = [0,1] : the unit interval"

/-- Notation for mapping cylinder. -/
#eval "cyl(f) : mapping cylinder of f"

end evals

end MiniContinuityHomeomorphism
