import MiniTopologicalSpaces

open MiniTopologicalSpaces

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniTopologicalSpaces v0.1.0"
  IO.println "  Point-Set Topology Sub-Package"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  TopologicalSpace: open sets axiomatization"
  IO.println s!"  ContinuousMap, OpenMap, ClosedMap, QuotientMap"
  IO.println s!"  Homeomorphism, Homotopy equivalence"
  IO.println s!"  ProductTopology, QuotientTopology, SubspaceTopology"
  IO.println s!"  Separation, Countability, Compactness, Connectedness"
  IO.println s!"  Object instance: TopologicalSpace via Object typeclass"
  IO.println ""
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
