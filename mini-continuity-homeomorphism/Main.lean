import MiniContinuityHomeomorphism

/-!
# Mini Continuity Homeomorphism — Main Entry Point

A self-contained Lean 4 package providing the theory of continuity,
homeomorphisms, embeddings, quotient maps, and homotopy.

## Overview
- **Core**: Continuous functions, homeomorphisms, embeddings, quotient/open/closed/proper maps
- **Morphisms**: Hom-spaces, the homeomorphism group, homotopy equivalence
- **Constructions**: Products, mapping cylinder/cone, adjunction spaces, retracts
- **Properties**: Topological/homotopy invariants, preservation theorems
- **Theorems**: Pasting lemma, tube lemma, Invariance of Domain, Brouwer Fixed Point, Borsuk-Ulam
- **Examples**: Standard maps + important counterexamples
- **Bridges**: Connections to algebra (fundamental groupoid), topology (function spaces), geometry (Whitney embedding), computation (digital topology)

## Quick Start
```lean
open MiniContinuityHomeomorphism

-- Construct a continuous function
def f : Bool →C Bool := .const true

-- Check homeomorphism
def h : Bool ≅ Bool := homeomorphismRefl _

-- Evaluate
#eval f true
```
-/

def main : IO Unit :=
  IO.println "MiniContinuityHomeomorphism — continuity, homeomorphism, and homotopy theory in Lean 4"

#eval main
