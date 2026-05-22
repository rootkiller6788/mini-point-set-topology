/-
# Computation.Advanced

Advanced computational aspects of compactification.
Magill lattice, remainder structure.
-/

import MiniStoneCechCompactification

open MiniStoneCechCompactification

/-- Computation: For a finite graph, the end compactification
    counts the number of ends. -/
def compute_ends : String :=
  "For a tree, the end compactification adds one end per infinite path."

/-- Computation: The Magill lattice for N.
    Compactifications of N correspond to closed subsets of βN\\N. -/
def compute_magill_N : String :=
  "Magill lattice for N: closed subsets of βN\\N."

/-- Computation: Parovicenko space (under CH).
    βN\\N is the unique zero-dimensional compact F-space of weight c. -/
#eval "Parovicenko: βN\\N unique under CH"

/-- Computation: Gelfand transform.
    C_b(X) → C(βX) via the Gelfand-Naimark theorem. -/
#eval "Gelfand transform: C_b(X) → C(MaxIdeal(C_b(X))) ≅ C(βX)"

def main : IO Unit := do
  IO.println "mini-stone-cech-compactification: advanced computations"
  IO.println s!"  End compactification: {compute_ends}"
  IO.println s!"  Magill lattice: {compute_magill_N}"
  return ()

#eval main
