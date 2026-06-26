import Lake
open Lake DSL

package «mini-separation-axioms» where

@[default_target]
lean_lib «MiniSeparationAxioms» where
  roots := #[`MiniSeparationAxioms]

require «mini-object-kernel» from "../../0. mini-math-kernel/mini-object-kernel"
