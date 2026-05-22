/-
# Computation: Run Topological Computations

Lean-based computational topology runner.
Run: `lake env lean --run Computation/run_compute.lean`
-/

import MiniTopologicalSpaces

open MiniTopologicalSpaces

def main : IO Unit := do
  IO.println "══ MINI-TOPOLOGICAL-SPACES COMPUTATION RUNNER ══"

  IO.println ""
  IO.println "── Finite Topology Classification ──"
  for n in [0, 1, 2, 3, 4] do
    IO.println s!"Number of topologies on {n}-element set: {numberOfTopologies n}"

  IO.println ""
  IO.println "── Standard Topology Properties ──"
  IO.println s!"Discrete topology contains_univ: {(discreteTopology ℕ).contains_univ}"
  IO.println s!"Indiscrete topology contains_empty: {(indiscreteTopology ℕ).contains_empty}"
  IO.println s!"Euclidean topology contains_univ: {euclideanTopology.contains_univ}"
  IO.println s!"Sierpinski topology contains_univ: {sierpinskiTopology.contains_univ}"
  IO.println s!"Sorgenfrey topology contains_univ: {sorgenfreyTopology.contains_univ}"

  IO.println ""
  IO.println "── Persistent Homology Demo ──"
  let params : PersistentHomologyParams := { maxDimension := 2, maxFiltration := 1.0 }
  let data := [[1.0, 2.0], [3.0, 4.0], [2.0, 1.0]]
  IO.println s!"{computePersistence data params}"

  IO.println ""
  IO.println "══ COMPUTATION COMPLETE ══"
