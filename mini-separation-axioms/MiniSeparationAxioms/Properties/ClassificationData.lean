/-
# MiniSeparationAxioms.Properties.ClassificationData

Classification data for T_i spaces: a database of known spaces
with their separation axiom status, implications, and
counterexample references.
-/

import MiniSeparationAxioms.Core.Basic
import MiniSeparationAxioms.Core.Laws

namespace MiniSeparationAxioms

/-! ## Space Classification Database

For each named topological space, we record the highest T_i axiom
it satisfies (and which ones it fails).
-/

/-- Entry in the classification database. -/
structure SpaceEntry where
  name : String
  description : String
  maxRank : AxiomRank
  failsRank : List AxiomRank
  reference : String
  deriving Repr

/-- Database of classified spaces. -/
def classificationDatabase : List SpaceEntry := [
  { name := "ℝ^n"
    description := "Euclidean n-space with standard topology"
    maxRank := .t6
    failsRank := []
    reference := "standard"
  },
  { name := "Finite discrete space"
    description := "Finite set with discrete topology"
    maxRank := .t6
    failsRank := []
    reference := "trivial"
  },
  { name := "Cofinite topology on ℕ"
    description := "Natural numbers with cofinite topology"
    maxRank := .t1
    failsRank := [.t2, .t2_5, .t3, .t3_5, .t4, .t5, .t6]
    reference := "classic counterexample"
  },
  { name := "Fort space"
    description := "One-point compactification of an infinite discrete space"
    maxRank := .t2
    failsRank := [.t3, .t3_5, .t4, .t5, .t6]
    reference := "Fort (1951)"
  },
  { name := "Moore plane (Niemytzki plane)"
    description := "Upper half-plane with tangent disk topology"
    maxRank := .t3_5
    failsRank := [.t4, .t5, .t6]
    reference := "Moore / Niemytzki"
  },
  { name := "Deleted Tychonoff plank"
    description := "Tychonoff plank minus the corner point"
    maxRank := .t3_5
    failsRank := [.t4, .t5, .t6]
    reference := "classic"
  },
  { name := "Tychonoff plank"
    description := "[0,ω₁] × [0,ω] minus (ω₁,ω)"
    maxRank := .t3_5
    failsRank := [.t4, .t5, .t6]
    reference := "Tychonoff"
  },
  { name := "Sorgenfrey line"
    description := "ℝ with lower limit topology"
    maxRank := .t4
    failsRank := [.t5, .t6]
    reference := "Sorgenfrey"
  },
  { name := "Sorgenfrey plane"
    description := "Sorgenfrey line × Sorgenfrey line"
    maxRank := .t3_5
    failsRank := [.t4, .t5, .t6]
    reference := "Sorgenfrey"
  },
  { name := "Ordinal space ω₁"
    description := "First uncountable ordinal with order topology"
    maxRank := .t4
    failsRank := [.t5, .t6]
    reference := "standard"
  }
]

/-- Implication strength: does rank i imply rank j? -/
def impliesRank (i j : AxiomRank) : Bool :=
  i.toNat ≤ j.toNat

/-- Find all spaces in the database that satisfy rank r. -/
def spacesSatisfying (r : AxiomRank) : List SpaceEntry :=
  classificationDatabase.filter (λ e => impliesRank e.maxRank r)

/-- Find all spaces that fail rank r. -/
def spacesFailing (r : AxiomRank) : List SpaceEntry :=
  classificationDatabase.filter (λ e => r ∈ e.failsRank)

/-! ## Diagnostics -/

#eval "Properties.ClassificationData — database of " ++ toString classificationDatabase.length ++ " spaces"
#eval "  Spaces satisfying T3.5: " ++ toString ((spacesSatisfying .t3_5).map SpaceEntry.name)
#eval "  Spaces failing T4: " ++ toString ((spacesFailing .t4).map SpaceEntry.name)

end MiniSeparationAxioms
