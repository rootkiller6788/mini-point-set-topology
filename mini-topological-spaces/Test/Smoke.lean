/-
# Smoke Tests -- MiniTopologicalSpaces

Run: `lake env lean --run Test/Smoke.lean`
-/

import MiniTopologicalSpaces

open MiniTopologicalSpaces

#eval "══ MINI-TOPOLOGICAL-SPACES SMOKE TESTS ══"

/-! ## Core.Basic: TopologicalSpace -/

#eval "── Core.Basic: TopologicalSpace ──"
#check TopologicalSpace Nat
#check discreteTopology
#check indiscreteTopology

/-! ## Core.Basic: OpenSet, ClosedSet, etc. -/

#eval "── Core.Basic: derived concepts ──"
#check OpenSet
#check ClosedSet
#check Neighborhood
#check interior
#check closure
#check boundary
#check Dense
#check Separable

/-! ## Core.Basic: Limit and Isolated Points -/

#eval "── Core.Basic: limit/isolated points ──"
#check LimitPoint
#check IsolatedPoint

/-! ## Core.Basic: Discrete Topology Tests -/

#eval "── Core.Basic: discrete topology properties ──"
def dt := discreteTopology ℕ
#eval dt.contains_univ
#eval dt.contains_empty

/-! ## Core.Basic: Indiscrete Topology Tests -/

#eval "── Core.Basic: indiscrete topology properties ──"
def it := indiscreteTopology ℕ
#eval it.contains_univ
#eval it.contains_empty

/-! ## Core.Laws: Duality and Kuratowski -/

#eval "── Core.Laws: open/closed duality ──"
#check open_closed_dual
#check closed_open_dual
#check kuratowski_empty
#check kuratowski_subset

/-! ## Core.Objects: Object Instances -/

#eval "── Core.Objects: Object instances ──"
open MiniObjectKernel
#check (inferInstance : Object (TopologicalSpace Nat))
#eval describe (TopologicalSpace Nat)

/-! ## Morphisms: Hom -/

#eval "── Morphisms: ContinuousMap and friends ──"
#check ContinuousMap
#check ContinuousMap.id
#check ContinuousMap.comp
#check OpenMap
#check ClosedMap
#check QuotientMap
#check Embedding

/-! ## Morphisms: Iso -/

#eval "── Morphisms: Homeomorphism ──"
#check Homeomorphism
#check Homeomorphic
#check Homeomorphism.fromMaps

/-! ## Morphisms: Equiv -/

#eval "── Morphisms: HomotopyEquivalence ──"
#check HomotopyEquivalence
#check WeakHomotopyEquivalence

/-! ## Constructions: Products -/

#eval "── Constructions: ProductTopology ──"
#check prodTopology
#check pi1
#check pi2

/-! ## Constructions: Quotients -/

#eval "── Constructions: QuotientTopology ──"
#check quotientTopology
#check identificationTopology

/-! ## Constructions: Subobjects -/

#eval "── Constructions: SubspaceTopology ──"
#check subspaceTopology
#check Subbasis
#check Basis

/-! ## Properties: Invariants -/

#eval "── Properties: countability invariants ──"
#check FirstCountable
#check SecondCountable
#check Lindelof

/-! ## Properties: Preservation -/

#eval "── Properties: preservation ──"
#check Compact
#check Connected
#check compact_image

/-! ## Properties: ClassificationData -/

#eval "── Properties: finite topologies ──"
#eval numberOfTopologies 0
#eval numberOfTopologies 2
#eval numberOfTopologies 4

/-! ## Theorems: Basic -/

#eval "── Theorems: basic ──"
#check Hausdorff
#check unique_limit_Hausdorff
#check tychonoff_binary

/-! ## Theorems: Classification -/

#eval "── Theorems: 1-manifold classification ──"
#check OneManifold
#check S1
#check classification_one_manifolds

/-! ## Theorems: Main -/

#eval "── Theorems: main results ──"
#check alexander_subbase
#check tychonoff_general
#check kuratowski_14_set

/-! ## Examples: Standard -/

#eval "── Examples: standard topologies ──"
#eval euclideanTopology.contains_univ
#eval sierpinskiTopology.contains_univ
#eval sorgenfreyTopology.contains_univ

/-! ## Bridges -/

#eval "── Bridges: all bridges ──"
#check TopologicalGroup
#check MetricSpace
#check TopologicalManifold
#check computePersistence

#eval "══ ALL MINI-TOPOLOGICAL-SPACES SMOKE TESTS PASSED ══"
