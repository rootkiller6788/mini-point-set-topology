import MiniContinuityHomeomorphism

/-!
# Documentation: Overview

`MiniContinuityHomeomorphism` is a self-contained Lean 4 package providing the
theory of continuity, homeomorphisms, embeddings, quotient maps, and homotopy.

## Package Structure

```
mini-continuity-homeomorphism/
  lakefile.lean          — Lake 4 package configuration
  Main.lean              — Entry point with demonstrations
  MiniContinuityHomeomorphism.lean — Root module
  MiniContinuityHomeomorphism/
    Core/
      Basic.lean         — ContinuousFunction, Homeomorphism, Embedding, etc.
      Laws.lean          — Composition, pasting lemma, equivalence relation
      Objects.lean       — Object-level reflection for metatheory
    Morphisms/
      Hom.lean           — C(X,Y), compact-open topology, Homotopy
      Iso.lean           — Homeomorphism group Homeo(X), isotopy
      Equiv.lean         — Homotopy equivalence, deformation retracts
    Constructions/
      Products.lean      — Product maps, diagonal, evaluation map
      Quotients.lean     — Mapping cylinder, mapping cone, adjunction space
      Subobjects.lean    — Retracts, neighborhood retracts, ANRs
      Universal.lean     — Universal properties of quotients and embeddings
    Properties/
      Invariants.lean    — Topological/homotopy invariants
      Preservation.lean  — Preservation theorems
      ClassificationData.lean — Classification data and invariants
    Theorems/
      Basic.lean         — Pasting lemma, tube lemma, lifting properties
      Classification.lean — Surface classification, mapping class groups
      Main.lean          — Invariance of Domain, Brouwer, Borsuk-Ulam
      UniversalProperties.lean — Universal properties of Top and hTop
    Examples/
      Standard.lean      — Standard continuous maps
      Counterexamples.lean — Important counterexamples
    Bridges/
      ToAlgebra.lean     — Fundamental groupoid, group actions
      ToTopology.lean    — Function spaces, compact-open, Ascoli
      ToGeometry.lean    — Whitney/Nash embedding theorems
      ToComputation.lean — Digital topology, finite spaces
    Utils/
      Notation.lean      — Convenient notation definitions
      Tactics.lean       — Custom tactics and helper lemmas
  test/                  — Test files (3)
  bench/                 — Benchmark files (6)
  comp/                  — Comparison files (vsClassical + vsHoTT)
  docs/                  — Documentation files (3)
  scripts/               — Build and verification scripts (2)
```

## Dependencies
- `mini-object-kernel` — Object/theory metalevel framework
- `mini-topological-spaces` — Topological space definitions

## Key Types
- `ContinuousFunction X Y` (`X →C Y`) — continuous maps
- `Homeomorphism X Y` (`X ≅ Y`) — homeomorphisms
- `Homotopy f g` — homotopies between maps
- `HomotopyEquivalence X Y` (`X ≃ₕ Y`) — homotopy equivalence
- `Embedding X Y` — embeddings (homeomorphisms onto image)
- `QuotientMap X Y f` — quotient/identification maps
- `OpenMap f`, `ClosedMap f`, `Proper f` — map properties

#eval "overview_documentation : MiniContinuityHomeomorphism package overview"
