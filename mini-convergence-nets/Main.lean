import MiniConvergenceNets

open MiniConvergenceNets

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniConvergenceNets v0.1.0"
  IO.println "  Convergence Theory with Nets and Filters"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  DirectedSet: preorder where every finite set has an upper bound"
  IO.println s!"  Net: function from a directed set to X (generalized sequence)"
  IO.println s!"  Subnet: cofinal restriction of a net"
  IO.println s!"  Net limit: x is a limit of net (x_α) if it eventually stays in each neighborhood"
  IO.println s!"  Cluster point: net is frequently in every neighborhood of the point"
  IO.println s!"  Filter: nonempty collection closed under supersets and finite intersections"
  IO.println s!"  FilterBase: generates a filter; ultrafilter: maximal proper filter"
  IO.println s!"  Filter convergence: F → x if F contains all neighborhoods of x"
  IO.println s!"  Net-filter equivalence: each net determines a filter, vice versa"
  IO.println s!"  SequentialSpace: topology determined by convergent sequences"
  IO.println s!"  Fréchet-Urysohn: closure equals sequential closure"
  IO.println s!"  FirstCountable: each point has a countable neighborhood base"
  IO.println s!"  SecondCountable: topology has a countable base"
  IO.println ""
  IO.println "  Depends on: mini-object-kernel, mini-topological-spaces"
  IO.println "  Run `lake env lean --run Test/Basic.lean` for tests."
