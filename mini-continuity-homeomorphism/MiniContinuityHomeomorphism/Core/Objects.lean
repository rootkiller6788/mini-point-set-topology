import MiniObjectKernel.Object
import MiniTopologicalSpaces.Basic
import MiniContinuityHomeomorphism.Core.Basic

/-!
# Objects of Continuity Theory

The object-level representation of continuity-based structures. Every definition
in this file corresponds to a concept in the theory of continuity and homeomorphisms,
reflected as `Object` instances for use in the metatheory.

## Covered objects
- The type `ContinuousFunction` itself as an object
- The property `IsHomeomorphism`
- The category `Cont` of topological spaces and continuous maps
- The groupoid `Homeo` of topological spaces and homeomorphisms
-/

set_option autoImplicit true

open MiniObjectKernel

namespace MiniContinuityHomeomorphism

/-- The theory of continuity and homeomorphisms. -/
def continuityTheory : Theory where
  name := "Continuity and Homeomorphism Theory"
  description := "The theory of continuous maps, homeomorphisms, embeddings, and quotient maps between topological spaces."
  axioms :=
    [("comp_continuous", "Composition of continuous maps is continuous")
    ,("homeo_equiv", "Homeomorphism is an equivalence relation")
    ,("pasting", "Pasting lemma: continuous on closed/open cover implies continuous")
    ,("invariance_domain", "Invariance of domain: continuous injection Rⁿ→Rⁿ is open")
    ,("brouwer", "Brouwer fixed point: continuous Dⁿ→Dⁿ has a fixed point")
    ]

/-- The object representing continuous functions between fixed spaces. -/
def continuousFunctionObject (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] : Object :=
  Object.mk
    (name := s!"ContinuousFunction({repr X}, {repr Y})")
    (description := "The type of continuous functions from X to Y")
    (theory := continuityTheory)

/-- The object representing homeomorphisms between fixed spaces. -/
def homeomorphismObject (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] : Object :=
  Object.mk
    (name := s!"Homeomorphism({repr X}, {repr Y})")
    (description := "The type of homeomorphisms from X to Y")
    (theory := continuityTheory)

/-- The object representing the category Top of topological spaces and continuous maps. -/
def topCategoryObject : Object :=
  Object.mk
    (name := "Top")
    (description := "The category of topological spaces and continuous maps")
    (theory := continuityTheory)

/-- The object representing the groupoid of homeomorphisms. -/
def homeoGroupoidObject : Object :=
  Object.mk
    (name := "Homeo")
    (description := "The groupoid of topological spaces and homeomorphisms")
    (theory := continuityTheory)

/-- The object representing the homotopy category hTop. -/
def hTopCategoryObject : Object :=
  Object.mk
    (name := "hTop")
    (description := "The homotopy category of topological spaces")
    (theory := continuityTheory)

section evals

/-- Verify object creation works. -/
#eval continuityTheory.name

/-- Verify object creation for continuous functions. -/
#eval (continuousFunctionObject Bool Bool).name

/-- Verify homeomorphism object. -/
#eval (homeomorphismObject Bool Bool).name

/-- Verify category objects. -/
#eval topCategoryObject.name

#eval homeoGroupoidObject.name

#eval hTopCategoryObject.name

end evals

end MiniContinuityHomeomorphism
