import MiniCompactness

open MiniCompactness

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniCompactness v0.1.0"
  IO.println "  Compactness in Point-Set Topology"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  Compact: every open cover has a finite subcover"
  IO.println s!"  IsCompact K: compact as a subset in the subspace topology"
  IO.println s!"  SequentiallyCompact: every sequence has a convergent subsequence"
  IO.println s!"  LimitPointCompact: every infinite subset has a limit point"
  IO.println s!"  CountablyCompact: every countable open cover has a finite subcover"
  IO.println s!"  LocallyCompact: every point has a compact neighborhood"
  IO.println s!"  σCompact: countable union of compact subsets"
  IO.println s!"  Paracompact: every open cover has a locally finite open refinement"
  IO.println s!"  Lindelöf: every open cover has a countable subcover"
  IO.println s!"  Compactification: dense embedding into a compact space"
  IO.println s!"  OnePointCompactification X∪{∞}: Alexandroff compactification"
  IO.println s!"  StoneCechCompactification βX: maximal compactification"
  IO.println s!"  ProperMap: preimages of compact sets are compact"
  IO.println s!"  Hausdorff: distinct points have disjoint neighborhoods"
  IO.println ""
  IO.println "  Depends on: mini-object-kernel"
  IO.println "  Run `lake env lean --run Test/Basic.lean` for tests."
