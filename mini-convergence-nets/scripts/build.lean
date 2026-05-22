/-
# Build Script

Script for building and verifying the MiniConvergenceNets package.
-/

import MiniConvergenceNets

def buildCheck : IO Unit := do
  IO.println "MiniConvergenceNets build check"
  IO.println "All imports resolved successfully."

/-- Main build entry point. -/
def main : IO Unit := do
  IO.println "=== MiniConvergenceNets Build ==="
  IO.println "Package: mini-convergence-nets"
  IO.println "Library: MiniConvergenceNets"
  IO.println "Dependencies:"
  IO.println "  - mini-object-kernel"
  IO.println "  - mini-topological-spaces"
  IO.println ""
  buildCheck
  IO.println ""
  IO.println "Build complete."

#eval main
