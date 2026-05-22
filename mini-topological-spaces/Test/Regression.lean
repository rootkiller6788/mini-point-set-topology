/-
# Regression Tests -- MiniTopologicalSpaces

Regression tests ensuring no breaking changes.
-/

import MiniTopologicalSpaces

open MiniTopologicalSpaces

/-! ## Core.Basic: All Definitions Exist -/

#check TopologicalSpace
#check OpenSet
#check ClosedSet
#check Neighborhood
#check interior
#check closure
#check boundary
#check LimitPoint
#check IsolatedPoint
#check Dense
#check Separable
#check discreteTopology
#check indiscreteTopology

/-! ## Core.Laws: All Definitions Exist -/

#check isOpen
#check isClosed
#check open_closed_dual
#check closed_open_dual
#check kuratowski_empty
#check kuratowski_subset
#check kuratowski_idempotent
#check kuratowski_union
#check interior_complement
#check closure_complement

/-! ## Core.Objects: Object Instances Exist -/

#check (inferInstance : Object (TopologicalSpace Nat))
#check (inferInstance : Object (OpenSet Nat))
#check (inferInstance : Object (ClosedSet Nat))

/-! ## Morphisms: Hom -/

#check ContinuousMap
#check ContinuousMap.id
#check ContinuousMap.comp
#check OpenMap
#check ClosedMap
#check QuotientMap
#check Embedding

/-! ## Morphisms: Iso -/

#check Homeomorphism
#check Homeomorphic
#check Homeomorphism.fromMaps
#check Homeomorphism.bijective

/-! ## Morphisms: Equiv -/

#check HomotopyEquivalence
#check HomotopyEquivalent
#check WeakHomotopyEquivalence

/-! ## Constructions: Products -/

#check prodTopology
#check boxTopology
#check pi1
#check pi2

/-! ## Constructions: Quotients -/

#check quotientTopology
#check identificationTopology
#check GroupActionQuotient

/-! ## Constructions: Subobjects -/

#check subspaceTopology
#check Subbasis
#check Basis
#check generateFromSubbasis
#check generateFromBasis

/-! ## Constructions: Universal -/

#check productUniversalProperty
#check quotientUniversalProperty
#check subspaceUniversalProperty

/-! ## Properties: Invariants -/

#check FirstCountable
#check SecondCountable
#check Lindelof
#check second_countable_implies_first_countable

/-! ## Properties: Preservation -/

#check Compact
#check Connected
#check compact_image
#check connected_image
#check separable_image

/-! ## Properties: ClassificationData -/

#check numberOfTopologies
#check TopologyLattice
#check finer
#check coarser

/-! ## Theorems: Basic -/

#check Hausdorff
#check ConvergesTo
#check unique_limit_Hausdorff
#check tychonoff_binary
#check urysohn_lemma
#check intermediate_value_topological

/-! ## Theorems: UniversalProperties -/

#check product_universal_property
#check quotient_universal_property
#check subspace_universal_property
#check terminalInTop

/-! ## Theorems: Classification -/

#check OneManifold
#check S1
#check classification_one_manifolds
#check classification_compact_one_manifolds

/-! ## Theorems: Main -/

#check alexander_subbase
#check tychonoff_general
#check kuratowski_14_set

/-! ## Examples: Standard -/

#check euclideanTopology
#check cofiniteTopology
#check cocountableTopology
#check sierpinskiTopology

/-! ## Examples: Counterexamples -/

#check sorgenfreyTopology
#check uncountable_product_not_first_countable
#check quotient_of_Hausdorff_not_Hausdorff

/-! ## Bridges: ToAlgebra -/

#check TopologicalGroup
#check TopologicalRing
#check TopologicalVectorSpace
#check ContinuousGroupAction

/-! ## Bridges: ToTopology -/

#check MetricSpace
#check metricTopology
#check Metrizable
#check T1Space
#check Regular
#check urysohn_metrization

/-! ## Bridges: ToGeometry -/

#check TopologicalManifold
#check HalfSpace
#check ManifoldWithBoundary
#check Chart
#check Atlas

/-! ## Bridges: ToComputation -/

#check specializationPreorder
#check topologyFromPreorder
#check PersistentHomologyParams
#check computePersistence

#eval "══ ALL REGRESSION CHECKS PASSED ══"
