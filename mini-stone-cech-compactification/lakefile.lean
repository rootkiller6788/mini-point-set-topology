import Lake
open Lake DSL

package «mini-stone-cech-compactification» where

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
require «mini-topological-spaces» from "../mini-topological-spaces"
require «mini-compactness» from "../mini-compactness"
require «mini-separation-axioms» from "../mini-separation-axioms"

@[default_target]
lean_lib «MiniStoneCechCompactification» where
  roots := #[`MiniStoneCechCompactification]

/-- Build all test executables --/
@[default_target]
lean_exe «mini-stone-cech-test» where
  root := `test.basic
  supportInterpreter := true

lean_exe benchCoreCoverage where
  root := `bench.CoreCoverage
  supportInterpreter := true

lean_exe benchPrinceton where
  root := `bench.Princeton
  supportInterpreter := true

lean_exe benchCambridgePartIII where
  root := `bench.CambridgePartIII
  supportInterpreter := true

lean_exe benchHarvard where
  root := `bench.Harvard
  supportInterpreter := true

lean_exe benchMIT where
  root := `bench.MIT
  supportInterpreter := true

lean_exe benchOxfordPartC where
  root := `bench.OxfordPartC
  supportInterpreter := true
