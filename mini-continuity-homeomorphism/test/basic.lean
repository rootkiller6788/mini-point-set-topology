import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Core.Laws
import MiniContinuityHomeomorphism.Core.Objects

/-!
# Tests: Core Basics

Tests for the fundamental definitions in `Core.Basic`, `Core.Laws`, and
`Core.Objects`.
-/

open MiniContinuityHomeomorphism

section ContinuousFunctionTests

/-- Test: Construct the identity continuous function. -/
def test_identityContinuous : C(Bool, Bool) := .id _

#eval test_identityContinuous true
#eval test_identityContinuous false

/-- Test: Construct a constant continuous function. -/
def test_constantContinuous : C(Bool, Bool) := .const true

#eval test_constantContinuous true
#eval test_constantContinuous false

/-- Test: Compose continuous functions. -/
def test_comp : C(Bool, Bool) := (C(Bool, Bool).id _).comp (C(Bool, Bool).const true)

#eval test_comp true
#eval test_comp false

end ContinuousFunctionTests

section HomeomorphismTests

/-- Test: Identity homeomorphism. -/
def test_identityHomeo : Homeomorphism Bool Bool := homeomorphismRefl Bool

#eval test_identityHomeo.toFun true
#eval test_identityHomeo.invFun true

/-- Test: Homeomorphism symmetry. -/
def test_symmHomeo : Homeomorphism Bool Bool := homeomorphismSymm test_identityHomeo

#eval test_symmHomeo.toFun true
#eval test_symmHomeo.invFun true

/-- Test: Composition of homeomorphisms. -/
def test_transHomeo : Homeomorphism Bool Bool :=
  homeomorphismTrans test_identityHomeo test_identityHomeo

#eval test_transHomeo.toFun true

end HomeomorphismTests

section ObjectTests

/-- Test: Theory construction. -/
#eval continuityTheory.name
#eval continuityTheory.description

/-- Test: Object creation. -/
#eval (continuousFunctionObject Bool Bool).name
#eval topCategoryObject.name
#eval homeoGroupoidObject.name
#eval hTopCategoryObject.name

end ObjectTests

def main : IO Unit :=
  IO.println "All Core tests completed."

#eval main
