/-
Test.Regression — Regression tests: verifies that the implication
chain and key properties are consistent with the definitions.
-/

import MiniSeparationAxioms
import MiniSeparationAxioms.Core.Laws
import MiniSeparationAxioms.Properties.Preservation

open MiniSeparationAxioms

#eval "Test.Regression — regression checks"

/-- Check AxiomRank ordering. -/
#eval "  AxiomRank t0 < t6: " ++ toString (AxiomRank.t0 < AxiomRank.t6)
#eval "  AxiomRank t6 > t4: " ++ toString (AxiomRank.t6 > AxiomRank.t4)
#eval "  AxiomRank.toNat t0 = 0: " ++ toString (AxiomRank.toNat AxiomRank.t0 == 0)
#eval "  AxiomRank.toNat t6 = 8: " ++ toString (AxiomRank.toNat AxiomRank.t6 == 8)

/-- Check preservation table is consistent. -/
#eval "  Perfect preserves T2: " ++ toString (preservationTable .perfect .t2)
#eval "  Perfect preserves T4: " ++ toString (preservationTable .perfect .t4)
#eval "  Continuous preserves T2: " ++ toString (preservationTable .continuous .t2)
#eval "  Homeomorphism preserves T0: " ++ toString (preservationTable .homeomorphism .t0)

/-- Regression: verify SpaceClass mapping. -/
#eval "  SpaceClass.ofRank .t2 = t2Space: " ++
  toString (SpaceClass.ofRank AxiomRank.t2 == SpaceClass.t2Space)
#eval "  SpaceClass.ofRank .t4 = t4Space: " ++
  toString (SpaceClass.ofRank AxiomRank.t4 == SpaceClass.t4Space)
