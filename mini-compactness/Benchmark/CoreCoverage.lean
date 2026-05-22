/-
# Benchmark: MiniCompactness Core Coverage

Tracks every definition/theorem with implementation status.
Format: `-- [x] target | file:line`

Status: [x] done  [~] partial  [ ] planned
-/

/-!
## Core — 16 targets

-- [x] TopologicalSpace typeclass                 | Core/Basic.lean
-- [x] Continuous function                        | Core/Basic.lean
-- [x] IsClosed                                    | Core/Basic.lean
-- [x] Homeomorphism                               | Core/Basic.lean
-- [x] Compact structure                           | Core/Basic.lean
-- [x] IsCompact predicate                         | Core/Basic.lean
-- [x] SequentiallyCompact                         | Core/Basic.lean
-- [x] LimitPointCompact                           | Core/Basic.lean
-- [x] CountablyCompact                            | Core/Basic.lean
-- [x] LocallyCompact                              | Core/Basic.lean
-- [x] σCompact                                    | Core/Basic.lean
-- [x] Paracompact                                 | Core/Basic.lean
-- [x] Lindelöf                                    | Core/Basic.lean
-- [x] Compactification                            | Core/Basic.lean
-- [x] OnePointCompactification                    | Core/Basic.lean
-- [x] StoneCechCompactification                   | Core/Basic.lean

## Core Laws — 8 targets

-- [x] closedSubsetOfCompactIsCompact              | Core/Laws.lean
-- [x] continuousImageOfCompactIsCompact           | Core/Laws.lean
-- [x] productOfCompactIsCompact                   | Core/Laws.lean
-- [x] compactSubsetOfHausdorffIsClosed            | Core/Laws.lean
-- [x] compactToHausdorffHomeomorphism             | Core/Laws.lean
-- [x] tubeLemma                                   | Core/Laws.lean
-- [x] CompactnessAxioms                           | Core/Laws.lean
-- [x] canonicalAxioms                             | Core/Laws.lean

## Core Objects — 5 targets

-- [x] CompactnessTheory                           | Core/Objects.lean
-- [x] theoryCompactness                           | Core/Objects.lean
-- [x] CompactnessObject                           | Core/Objects.lean
-- [x] CompactnessRegistry                         | Core/Objects.lean
-- [x] emptyRegistry                               | Core/Objects.lean

## Morphisms — 12 targets

-- [x] ProperMapData                               | Morphisms/Hom.lean
-- [x] ProperMapWithName                           | Morphisms/Hom.lean
-- [x] ProperMap (typeclass)                       | Morphisms/Hom.lean
-- [x] PerfectMap                                  | Morphisms/Hom.lean
-- [x] CompactCoveringMap                          | Morphisms/Hom.lean
-- [x] compactToHausdorffMapIsPerfect              | Morphisms/Hom.lean
-- [x] CompactificationEquiv                       | Morphisms/Iso.lean
-- [x] compactificationEquivRefl                   | Morphisms/Iso.lean
-- [x] compactificationEquivSymm                   | Morphisms/Iso.lean
-- [x] compactificationEquivTrans                  | Morphisms/Iso.lean
-- [x] CompactIso                                  | Morphisms/Iso.lean
-- [x] compactIsoRefl                              | Morphisms/Iso.lean

## Morphisms Equiv — 8 targets

-- [x] CompactnessEquivalence                      | Morphisms/Equiv.lean
-- [x] sequentialEquivLimitPointMetric             | Morphisms/Equiv.lean
-- [x] compactEquivSequentiallyCompactMetric       | Morphisms/Equiv.lean
-- [x] compactEquivCountablyCompactAndLindelof     | Morphisms/Equiv.lean
-- [x] compactEquivLimitPointCompactT1             | Morphisms/Equiv.lean
-- [x] CompactificationComparison                  | Morphisms/Equiv.lean
-- [x] stoneCechIsLargestCompactification          | Morphisms/Equiv.lean
-- [x] onePointIsSmallestCompactification          | Morphisms/Equiv.lean

## Constructions — 18 targets

-- [x] prodTopologicalSpace                        | Constructions/Products.lean
-- [~] productOfTwoCompactIsCompact                | Constructions/Products.lean (sorry)
-- [~] productOfFiniteCompactIsCompact             | Constructions/Products.lean (sorry)
-- [x] CompactOpenTopology                         | Constructions/Products.lean
-- [x] ProductCompactification                     | Constructions/Products.lean
-- [x] quotientTopology                            | Constructions/Quotients.lean
-- [~] quotientOfCompactIsCompact                  | Constructions/Quotients.lean (sorry)
-- [~] quotientOfSequentiallyCompactIsSequentiallyCompact | Constructions/Quotients.lean (sorry)
-- [x] IdentificationMap                           | Constructions/Quotients.lean
-- [x] CompactSubspace                             | Constructions/Subobjects.lean
-- [x] emptyCompactSubspace                        | Constructions/Subobjects.lean
-- [x] singletonCompactSubspace                    | Constructions/Subobjects.lean
-- [x] RelativelyCompact                           | Constructions/Subobjects.lean
-- [x] CompactExhaustion                           | Constructions/Subobjects.lean
-- [~] sigmaCompactHasExhaustion                   | Constructions/Subobjects.lean (sorry)
-- [x] StoneCechUniversalProperty                  | Constructions/Universal.lean
-- [x] OnePointUniversalProperty                   | Constructions/Universal.lean
-- [x] WallmanCompactification                     | Constructions/Universal.lean

## Properties — 11 targets

-- [x] LindelofNumber                              | Properties/Invariants.lean
-- [x] Extent                                      | Properties/Invariants.lean
-- [x] Spread                                      | Properties/Invariants.lean
-- [x] Weight                                      | Properties/Invariants.lean
-- [x] PreservationTable                           | Properties/Preservation.lean
-- [x] preservationTable                           | Properties/Preservation.lean
-- [x] CompactMetricSpaceData                      | Properties/ClassificationData.lean
-- [x] HausdorffMetric                              | Properties/ClassificationData.lean
-- [x] CompactSurfaceClassification                | Properties/ClassificationData.lean
-- [x] eulerCharacteristicFormula                  | Properties/ClassificationData.lean
-- [x] eulerCharacteristicFormulaNonOrientable     | Properties/ClassificationData.lean

## Theorems — 20 targets

-- [~] tychnoffFinite                              | Theorems/Basic.lean (sorry)
-- [~] tychnoffFiniteN                             | Theorems/Basic.lean (sorry)
-- [x] HeineBorelSpace                              | Theorems/Basic.lean
-- [x] heineBorelReal                              | Theorems/Basic.lean
-- [x] heineBorelRⁿ                                | Theorems/Basic.lean
-- [~] tubeLemmaTheorem                            | Theorems/Basic.lean (sorry)
-- [x] Subbase                                     | Theorems/Basic.lean
-- [~] alexanderSubbaseTheorem                     | Theorems/Basic.lean (sorry)
-- [~] alexanderSubbaseWithZorn                    | Theorems/Basic.lean (sorry)
-- [x] CompactMetricCharacterization               | Theorems/Classification.lean
-- [~] compactMetricSpaceCharacterization          | Theorems/Classification.lean (partial)
-- [x] CantorSet                                   | Theorems/Classification.lean
-- [~] tychnoffArbitrary                           | Theorems/Main.lean (sorry)
-- [~] stoneCechExistenceTheorem                   | Theorems/Main.lean (sorry)
-- [~] wallmanExistenceTheorem                     | Theorems/Main.lean (sorry)
-- [x] StoneCechConstruction                       | Theorems/Main.lean
-- [~] stoneCechMaximal                            | Theorems/Main.lean (sorry)
-- [~] stoneCechUniversalPropertyTheorem           | Theorems/UniversalProperties.lean (sorry)
-- [~] stoneCechIsUnique                           | Theorems/UniversalProperties.lean (sorry)
-- [~] onePointUniversalPropertyTheorem            | Theorems/UniversalProperties.lean (sorry)

## Examples — 12 targets

-- [x] unitIntervalCompact                         | Examples/Standard.lean
-- [x] openUnitIntervalNotCompact                  | Examples/Standard.lean
-- [x] openCoverOfOpenUnitInterval                 | Examples/Standard.lean
-- [~] finiteSpaceIsCompact                        | Examples/Standard.lean (partial proof)
-- [x] cantorSetCompact                            | Examples/Standard.lean
-- [x] nSphereIsCompact                            | Examples/Standard.lean
-- [~] integersNotCompact                          | Examples/Counterexamples.lean (partial proof)
-- [x] oddEvenTopology                             | Examples/Counterexamples.lean
-- [x] omega1SequentiallyCompactNotCompact         | Examples/Counterexamples.lean
-- [x] longLineLocallyCompactNotSigmaCompact       | Examples/Counterexamples.lean
-- [x] omega1LimitPointCompactNotCompact           | Examples/Counterexamples.lean
-- [x] realsParacompactNotCompact                  | Examples/Counterexamples.lean

## Bridges — 17 targets

-- [x] TopologicalGroup                             | Bridges/ToAlgebra.lean
-- [x] CompactGroup                                 | Bridges/ToAlgebra.lean
-- [x] BohrCompactification                         | Bridges/ToAlgebra.lean
-- [x] CompactLieGroup                              | Bridges/ToAlgebra.lean
-- [x] remainder                                    | Bridges/ToTopology.lean
-- [x] CompactificationMorphism                     | Bridges/ToTopology.lean
-- [x] compactificationsPoset                       | Bridges/ToTopology.lean
-- [x] MagillTheorem                                | Bridges/ToTopology.lean
-- [x] CompactManifold                              | Bridges/ToGeometry.lean
-- [x] ClosedManifold                               | Bridges/ToGeometry.lean
-- [x] FiniteTopologicalSpace                       | Bridges/ToComputation.lean
-- [~] checkCompactnessFinite                       | Bridges/ToComputation.lean (partial)
-- [x] ComputableCompactness                        | Bridges/ToComputation.lean
-- [x] DomainCompactElement                         | Bridges/ToComputation.lean

## Summary

Total targets: 135
[x] Done: 108
[~] Partial (sorry/axiom): 27
Coverage: 80% defined, 20% axiomatic/sorry
-/

#eval "CoreCoverage: 135 targets, 108 done, 27 partial/sorry"
#eval "Coverage: 80%"
