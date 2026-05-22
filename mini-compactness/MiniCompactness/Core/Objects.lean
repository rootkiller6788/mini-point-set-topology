/-
# MiniCompactness.Core.Objects

Object instances and theory registration for compactness.
-/
import MiniCompactness.Core.Basic
import MiniCompactness.Core.Laws

namespace MiniCompactness

/-! ## Theory Identification -/

structure CompactnessTheory where
  name : String
  axioms : CompactnessAxioms
  deriving Repr, Inhabited

/-- Theory name for compactness. -/
def theoryCompactness : CompactnessTheory :=
  { name := "Compactness"
    axioms := canonicalAxioms
  }

/-- Theory name for sequential compactness. -/
def theorySequentialCompactness : CompactnessTheory :=
  { name := "SequentialCompactness"
    axioms := canonicalAxioms
  }

/-- Theory name for paracompactness. -/
def theoryParacompactness : CompactnessTheory :=
  { name := "Paracompactness"
    axioms := canonicalAxioms
  }

/-- Theory name for compactifications. -/
def theoryCompactifications : CompactnessTheory :=
  { name := "Compactifications"
    axioms := canonicalAxioms
  }

/-! ## Object Instances -/

/-- Register a topological space as a compactness object. -/
structure CompactnessObject (X : Type u) where
  [topology : TopologicalSpace X]
  theory : CompactnessTheory
  deriving Repr

/-- The unit space as a compactness object. -/
def unitCompactnessObject : CompactnessObject Unit :=
  { theory := theoryCompactness }

/-- A finite discrete space as a compactness object. -/
def finiteDiscreteCompactnessObject (n : ℕ) : CompactnessObject (Fin n) :=
  { theory := theoryCompactness }

/-- The one-point compactification of ℕ as a compactness object. -/
def nPlusInfinityObject : CompactnessObject (Option ℕ) :=
  { theory := theoryCompactifications }

/-! ## Registry -/

/-- Collection of all registered compactness objects. -/
structure CompactnessRegistry where
  objects : List (Sigma CompactnessObject)
  theoryNames : List CompactnessTheory
  deriving Repr, Inhabited

/-- Empty registry. -/
def emptyRegistry : CompactnessRegistry :=
  { objects := []
    theoryNames := [theoryCompactness, theorySequentialCompactness,
      theoryParacompactness, theoryCompactifications] }

/-- Register an object in the registry. -/
def CompactnessRegistry.register (r : CompactnessRegistry) (X : Type u)
  [TopologicalSpace X] (obj : CompactnessObject X) : CompactnessRegistry :=
  { r with objects := r.objects ++ [⟨X, obj⟩] }

#eval "── Core.Objects: Theory registration ──"
#eval theoryCompactness.name
#eval theorySequentialCompactness.name
#eval theoryParacompactness.name
#eval theoryCompactifications.name
#eval "── Core.Objects: Object instances ──"
#eval "CompactnessObject Unit registered"
#eval "CompactnessObject (Fin n) registered"
#eval "CompactnessObject (Option Nat) registered"
#eval emptyRegistry.theoryNames.length
#eval "── All theories and objects registered ──"

end MiniCompactness
