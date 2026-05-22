import MiniConnectedness

open MiniConnectedness

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniConnectedness v0.1.0"
  IO.println "  Connectedness in Point-Set Topology"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  Connected: not a disjoint union of two nonempty open sets"
  IO.println s!"  PathConnected: any two points joined by a continuous path"
  IO.println s!"  ArcConnected: path-connected with injective path (arc)"
  IO.println s!"  ConnectedComponent: maximal connected subset"
  IO.println s!"  PathComponent: maximal path-connected subset"
  IO.println s!"  TotallyDisconnected: only singleton subsets are connected"
  IO.println s!"  TotallySeparated: distinct points separated by clopen sets"
  IO.println s!"  Continua: compact connected metric spaces"
  IO.println s!"  LocallyConnected: each point has a connected neighborhood base"
  IO.println s!"  LocallyPathConnected: each point has a path-connected neighborhood base"
  IO.println s!"  Hahn-Mazurkiewicz: continuous image of [0,1] is arcwise connected and locally connected"
  IO.println s!"  Sierpinski's theorem: continuum is sum of two disjoint proper subcontinua"
  IO.println ""
  IO.println "  Depends on: mini-object-kernel, mini-topological-spaces"
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
