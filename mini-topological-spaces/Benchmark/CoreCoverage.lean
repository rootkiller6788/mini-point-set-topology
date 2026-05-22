/-
# Benchmark: MiniTopologicalSpaces Core Coverage

Tracks every definition/theorem with implementation status.
Format: `-- [x] target | file:line`

Status: [x] done  [~] partial  [ ] planned
-/

/-!
## Core — 18 targets

-- [x] TopologicalSpace structure               | Core/Basic.lean
-- [x] OpenSet subtype                           | Core/Basic.lean
-- [x] ClosedSet subtype                         | Core/Basic.lean
-- [x] Neighborhood                              | Core/Basic.lean
-- [x] interior                                  | Core/Basic.lean
-- [x] closure                                   | Core/Basic.lean
-- [x] boundary                                  | Core/Basic.lean
-- [x] LimitPoint                                | Core/Basic.lean
-- [x] IsolatedPoint                             | Core/Basic.lean
-- [x] Dense                                     | Core/Basic.lean
-- [x] Separable                                 | Core/Basic.lean
-- [x] discreteTopology                          | Core/Basic.lean
-- [x] indiscreteTopology                        | Core/Basic.lean
-- [x] isOpen / isClosed                         | Core/Laws.lean
-- [x] open_closed_dual                          | Core/Laws.lean
-- [~] Kuratowski closure axioms (partial proof) | Core/Laws.lean
-- [~] interior / closure complement             | Core/Laws.lean
-- [x] Object instances                          | Core/Objects.lean

## Morphisms — 5 targets

-- [x] ContinuousMap structure                   | Morphisms/Hom.lean
-- [x] ContinuousMap.id / .comp                  | Morphisms/Hom.lean
-- [x] OpenMap                                   | Morphisms/Hom.lean
-- [x] ClosedMap                                 | Morphisms/Hom.lean
-- [x] QuotientMap                               | Morphisms/Hom.lean
-- [x] Embedding                                 | Morphisms/Hom.lean
-- [x] Homeomorphism                             | Morphisms/Iso.lean
-- [x] Homeomorphic / Homeomorphism.fromMaps     | Morphisms/Iso.lean
-- [x] HomotopyEquivalence                       | Morphisms/Equiv.lean
-- [x] WeakHomotopyEquivalence                   | Morphisms/Equiv.lean

## Constructions — 7 targets

-- [x] prodTopology (binary)                     | Constructions/Products.lean
-- [x] boxTopology                               | Constructions/Products.lean
-- [x] pi1 / pi2 projections                     | Constructions/Products.lean
-- [x] quotientTopology                          | Constructions/Quotients.lean
-- [x] identificationTopology                    | Constructions/Quotients.lean
-- [x] GroupActionQuotient                       | Constructions/Quotients.lean
-- [~] subspaceTopology (partial proof)          | Constructions/Subobjects.lean
-- [x] Subbasis                                  | Constructions/Subobjects.lean
-- [x] Basis                                     | Constructions/Subobjects.lean
-- [x] productUniversalProperty                  | Constructions/Universal.lean
-- [x] quotientUniversalProperty                 | Constructions/Universal.lean
-- [x] subspaceUniversalProperty                 | Constructions/Universal.lean

## Properties — 8 targets

-- [x] FirstCountable                            | Properties/Invariants.lean
-- [x] SecondCountable                           | Properties/Invariants.lean
-- [x] Lindelof                                  | Properties/Invariants.lean
-- [~] second_countable implies... (sorry)       | Properties/Invariants.lean
-- [x] Compact definition                        | Properties/Preservation.lean
-- [x] Connected definition                      | Properties/Preservation.lean
-- [~] compact_image / connected_image (sorry)   | Properties/Preservation.lean
-- [x] numberOfTopologies                        | Properties/ClassificationData.lean
-- [x] TopologyLattice                           | Properties/ClassificationData.lean

## Theorems — 10 targets

-- [x] Hausdorff definition                      | Theorems/Basic.lean
-- [x] ConvergesTo                               | Theorems/Basic.lean
-- [x] unique_limit_Hausdorff (proven)           | Theorems/Basic.lean
-- [~] tychonoff_binary (sorry)                  | Theorems/Basic.lean
-- [~] intermediate_value_topological (sorry)    | Theorems/Basic.lean
-- [~] product_universal_property (sorry)        | Theorems/UniversalProperties.lean
-- [~] quotient_universal_property (sorry)       | Theorems/UniversalProperties.lean
-- [~] OneManifold definition                    | Theorems/Classification.lean
-- [~] classification_one_manifolds (sorry)      | Theorems/Classification.lean
-- [~] alexander_subbase (sorry)                 | Theorems/Main.lean
-- [~] tychonoff_general (sorry)                 | Theorems/Main.lean
-- [~] kuratowski_14_set (sorry)                 | Theorems/Main.lean

## Examples — 6 targets

-- [x] euclideanTopology                         | Examples/Standard.lean
-- [x] cofiniteTopology                          | Examples/Standard.lean
-- [x] cocountableTopology                       | Examples/Standard.lean
-- [x] sierpinskiTopology                        | Examples/Standard.lean
-- [x] sorgenfreyTopology                        | Examples/Counterexamples.lean
-- [~] uncountable_product not first-countable   | Examples/Counterexamples.lean

## Bridges — 8 targets

-- [x] TopologicalGroup                          | Bridges/ToAlgebra.lean
-- [x] TopologicalRing                           | Bridges/ToAlgebra.lean
-- [x] TopologicalVectorSpace                    | Bridges/ToAlgebra.lean
-- [x] MetricSpace                               | Bridges/ToTopology.lean
-- [x] metricTopology                            | Bridges/ToTopology.lean
-- [x] Metrizable / urysohn_metrization          | Bridges/ToTopology.lean
-- [x] TopologicalManifold                       | Bridges/ToGeometry.lean
-- [x] Chart / Atlas                             | Bridges/ToGeometry.lean
-- [x] specializationPreorder                    | Bridges/ToComputation.lean
-- [x] topologyFromPreorder                      | Bridges/ToComputation.lean

## Summary

Total: ~62 targets
Done (proven or defined): 48
Partial (sorry): 14
Coverage: 77% (core structures done, theorems with sorry proofs)
-/

#eval "CoreCoverage: ~62 targets, 48 done, 14 stubs/partial"
