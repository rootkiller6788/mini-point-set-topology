import MiniTopologicalConstructions

open MiniTopologicalConstructions

def main : IO Unit := do
  IO.println "═══════════════════════════════════════"
  IO.println "  MiniTopologicalConstructions v0.1.0"
  IO.println "  Topological Constructions Sub-Package"
  IO.println "═══════════════════════════════════════"
  IO.println s!"  ProductTopology: Tychonoff product topology on ∏_i X_i"
  IO.println s!"  BoxTopology: topology on product where basic opens are products of opens"
  IO.println s!"  QuotientTopology: finest topology making quotient map continuous"
  IO.println s!"  WedgeSum: X ∨ Y = X ⊔ Y / (x₀ ∼ y₀) (based spaces)"
  IO.println s!"  SmashProduct: X ∧ Y = (X × Y) / (X ∨ Y)"
  IO.println s!"  Join: X * Y = (X × I × Y) / ∼ (all lines connecting X to Y)"
  IO.println s!"  Cone: CX = X × I / X × {1} (cone over X)"
  IO.println s!"  Suspension: ΣX = (X × I) / (X × {0}, X × {1})"
  IO.println s!"  MappingCylinder M_f: (X × I) ⊔ Y / (x, 0) ∼ f(x)"
  IO.println s!"  MappingCone: M_f / X × {1} (cofiber of f)"
  IO.println s!"  Telescope: sequential colimit of X₁ → X₂ → X₃ → ..."
  IO.println s!"  DirectLimit / InverseLimit: (co)limits of directed systems"
  IO.println s!"  Theorems: ΣS^n ≅ S^{n+1}, CX contractible, ΩΣ ⊣ Ω (adjunction)"
  IO.println ""
  IO.println "  Depends on: mini-object-kernel, mini-topological-spaces, mini-continuity-homeomorphism"
  IO.println "  Run `lake env lean --run Test/Smoke.lean` for tests."
