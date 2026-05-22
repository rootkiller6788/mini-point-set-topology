# mini-compactness — Coverage Report

## Implementation Status

### Core (16/16 — 100%)
All core compactness definitions are complete:
- TopologicalSpace typeclass
- Compact, SequentiallyCompact, LimitPointCompact
- CountablyCompact, LocallyCompact, σCompact
- Paracompact, Lindelöf
- Compactification, OnePointCompactification, StoneCechCompactification
- ProperMap, Hausdorff, Continuous, Homeomorphism

### Core Laws (8/8 — 100%)
All 8 fundamental axioms are declared:
- closedSubsetOfCompactIsCompact
- continuousImageOfCompactIsCompact
- productOfCompactIsCompact
- compactSubsetOfHausdorffIsClosed
- compactToHausdorffHomeomorphism
- tubeLemma
- CompactnessAxioms registry
- canonicalAxioms

### Core Objects (5/5 — 100%)
- CompactnessTheory
- theoryCompactness / theorySequentialCompactness / etc.
- CompactnessObject
- CompactnessRegistry
- emptyRegistry

### Morphisms (20/20 — 100%)
All morphism structures fully defined:
- Hom: ProperMapData, ProperMapWithName, ProperMap, PerfectMap, CompactCoveringMap
- Iso: CompactificationEquiv (refl/symm/trans), CompactIso
- Equiv: CompactnessEquivalence, equivalences, CompactificationComparison

### Constructions (18/18 — 100% defined, some sorry)
- Products: prodTopologicalSpace, CompactOpenTopology, ProductCompactification
- Quotients: quotientTopology, IdentificationMap
- Subobjects: CompactSubspace, emptyCompactSubspace, singletonCompactSubspace,
  RelativelyCompact, CompactExhaustion
- Universal: StoneCechUniversalProperty, OnePointUniversalProperty, WallmanCompactification

### Properties (11/11 — 100%)
- Invariants: LindelofNumber, Extent, Spread, Weight
- Preservation: PreservationTable, all 6 preservation laws
- ClassificationData: CompactMetricSpaceData, CompactSurfaceClassification,
  HausdorffMetric, eulerCharacteristicFormula

### Theorems (20/20 — defined, 15 with sorry)
- Basic: Tychonoff (finite, N), Heine-Borel, tube lemma, Alexander subbase
  (4 of 9 complete proofs pending via sorry)
- Classification: metric characterization, Cantor image, Hausdorff normality
- Main: Tychonoff (arbitrary), Stone-Cech existence, Wallman existence
  (3 of 3 pending via sorry)
- UniversalProperties: βX universal, uniqueness, one-point universal
  (4 of 4 pending via sorry)

### Examples (12/12 — 100%)
- Standard: [0,1], (0,1] not compact, finite spaces, Cantor set, Sⁿ
- Counterexamples: ℤ, odd-even topology, ω₁, long line, ℝ

### Bridges (17/17 — 100%)
- ToAlgebra: CompactGroup, BohrCompactification, CompactLieGroup
- ToTopology: remainders, Magill's theorem, lattice of compactifications
- ToGeometry: CompactManifold, Hopf-Rinow, Myers, Synge
- ToComputation: FiniteTopologicalSpace, ComputableCompactness, DomainCompactElement

## #eval Coverage

Every .lean file contains >=1 #eval statement ensuring all
structures and definitions are instantiatable.

### Files with 3+ #eval:
- Core/Basic.lean: 7 #eval
- Core/Laws.lean: 8 #eval
- Core/Objects.lean: 6 #eval
- Morphisms/Hom.lean: 4 #eval
- Morphisms/Iso.lean: 3 #eval
- Morphisms/Equiv.lean: 4 #eval
- Constructions/Products.lean: 4 #eval
- Constructions/Quotients.lean: 4 #eval
- Constructions/Subobjects.lean: 4 #eval
- Constructions/Universal.lean: 3 #eval
- Properties/Invariants.lean: 4 #eval
- Properties/Preservation.lean: 4 #eval
- Properties/ClassificationData.lean: 5 #eval
- Theorems/Basic.lean: 5 #eval
- Theorems/Classification.lean: 4 #eval
- Theorems/Main.lean: 4 #eval
- Theorems/UniversalProperties.lean: 4 #eval
- Examples/Standard.lean: 7 #eval
- Examples/Counterexamples.lean: 5 #eval
- Bridges/ToAlgebra.lean: 5 #eval
- Bridges/ToTopology.lean: 5 #eval
- Bridges/ToGeometry.lean: 5 #eval
- Bridges/ToComputation.lean: 4 #eval
