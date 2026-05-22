import MiniSeparationAxioms

open MiniSeparationAxioms

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniSeparationAxioms v0.1.0"
  IO.println "  Separation Axioms in Point-Set Topology"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  T0 (Kolmogorov): distinct points have distinct closures"
  IO.println s!"  T1 (Fréchet): points are closed; distinct points have neighborhoods excluding the other"
  IO.println s!"  T2 (Hausdorff): distinct points have disjoint open neighborhoods"
  IO.println s!"  T2.5 (Urysohn): distinct points separated by closed neighborhoods"
  IO.println s!"  T3 (Regular): T1 + point and closed set separated by open sets"
  IO.println s!"  T3.5 (Tychonoff/CompletelyRegular): T1 + point separated from closed set by continuous function"
  IO.println s!"  T4 (Normal): T1 + disjoint closed sets separated by open sets"
  IO.println s!"  T5 (CompletelyNormal): every subspace is normal"
  IO.println s!"  T6 (PerfectlyNormal): T1 + every closed set is a Gδ set"
  IO.println s!"  Urysohn Lemma: T4 ⇒ T3.5 (continuous Urysohn function)"
  IO.println s!"  Tietze Extension: continuous function on closed subset extends to whole space (T4)"
  IO.println s!"  Urysohn Metrization: T3 + second countable ⇒ metrizable"
  IO.println s!"  Nagata-Smirnov / Bing Metrization theorems"
  IO.println ""
  IO.println "  Depends on: mini-object-kernel, mini-topological-spaces"
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
