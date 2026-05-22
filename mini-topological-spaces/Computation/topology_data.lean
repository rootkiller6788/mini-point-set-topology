/-
# Computation: Topology Data

Data tables and computed values for topological spaces.
-/

import MiniTopologicalSpaces

open MiniTopologicalSpaces

/-! ## Topologies on Small Sets

  |n| Number of Topologies |
  |0: 1                     |
  |1: 1                     |
  |2: 4                     |
  |3: 29                    |
  |4: 355                   |
  |5: 6942                  |
  |6: 209527                |

Note: For n ≥ 5, these values are computed but not stored
in the basic definition (returns 0 for n ≥ 5).
-/

def topologyTable : List (Nat × Nat) :=
  [(0, 1), (1, 1), (2, 4), (3, 29), (4, 355)]

#eval "── Known topology counts ──"
#eval topologyTable

/-! ## Separation Axiom Lattice

  T0 < T1 < T2 (Hausdorff) < T3 (Regular T1) < T3.5 (Tychonoff) < T4 (Normal T1)

  Metrizable => T4, but not conversely.
-/

inductive SeparationAxiom
  | T0 | T1 | T2 | T3 | T3point5 | T4 | T5 | T6

/-! ## Countability Lattice

  Second-countable => First-countable + Separable
  Second-countable => Lindelof

  Metric space:
    Second-countable <=> Separable <=> Lindelof
-/

#eval "── Topology data: separation and countability ──"
#eval "Separation: T0 < T1 < T2 (Hausdorff) < T3 < T3.5 < T4"
#eval "Countability: 2nd-countable => 1st-countable, separable, Lindelof"
