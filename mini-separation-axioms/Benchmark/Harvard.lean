import MiniSeparationAxioms

-- Benchmark: Harvard Math 131 (Topology) topics coverage
-- Covers: separation axioms, Urysohn lemma, Tietze extension

def harvardMath131 : List (String × String) := [
  ("Separation axioms T0-T6", "DONE"),
  ("Hausdorff spaces", "DONE"),
  ("Regular and normal spaces", "DONE"),
  ("Urysohn Lemma", "STUB"),
  ("Tietze Extension Theorem", "STUB"),
  ("Urysohn Metrization", "STUB"),
  ("Stone-Cech compactification", "STUB"),
  ("Manifolds and separation", "DONE"),
  ("Product theorems", "DONE"),
  ("Quotient counterexamples", "DONE")
]

#eval "Benchmark.Harvard — Math 131: " ++ toString harvardMath131.length ++ " topics"
#eval "  Done: " ++ toString ((harvardMath131.filter (λ ⟨_, s⟩ => s == "DONE")).length)
#eval "  Stubs: " ++ toString ((harvardMath131.filter (λ ⟨_, s⟩ => s == "STUB")).length)
