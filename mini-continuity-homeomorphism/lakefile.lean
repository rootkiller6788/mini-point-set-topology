import Lake
open Lake DSL

package «mini-continuity-homeomorphism» where
  srcDir := "."

require mini-object-kernel from "../../0. mini-math-kernel/mini-object-kernel"
require mini-topological-spaces from "../mini-topological-spaces"

@[default_target]
lean_lib «MiniContinuityHomeomorphism» where
  roots := #[`MiniContinuityHomeomorphism]

/-- Build all test executables --/
@[default_target]
lean_exe «mini-continuity-homeomorphism-test» where
  root := `test.basic
  supportInterpreter := true

lean_exe benchContinuity where
  root := `bench.ContinuityBench
  supportInterpreter := true

lean_exe benchHomeomorphism where
  root := `bench.HomeomorphismBench
  supportInterpreter := true

lean_exe benchHomotopy where
  root := `bench.HomotopyBench
  supportInterpreter := true
