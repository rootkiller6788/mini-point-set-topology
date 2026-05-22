/-
# MiniTopologicalSpaces: Classification Data

Classification of topologies on finite sets, lattice of topologies.
-/

import MiniTopologicalSpaces.Core.Basic

namespace MiniTopologicalSpaces

/-! ## Topologies on a Finite Set

The number of topologies on a set of n elements:
  n=0: 1 topology
  n=1: 1 topology
  n=2: 4 topologies
  n=3: 29 topologies
  n=4: 355 topologies
(These are the known values; general formula is not known.)
-/

def numberOfTopologies : Nat → Nat
  | 0 => 1
  | 1 => 1
  | 2 => 4
  | 3 => 29
  | 4 => 355
  | _ => 0  -- unknown for n ≥ 5

/-! ## Lattice of Topologies

Given a set X, the collection of all topologies on X forms a
complete lattice under inclusion of open sets.
-/

structure TopologyLattice (X : Type u) where
  carrier : Set (TopologicalSpace X)
  partial_order : String := "t₁ ≤ t₂ iff opens(t₁) ⊆ opens(t₂)"
  top : TopologicalSpace X  -- discrete topology (finest)
  bot : TopologicalSpace X  -- indiscrete topology (coarsest)

def discreteTopologyOn (X : Type u) : TopologicalSpace X := discreteTopology X
def indiscreteTopologyOn (X : Type u) : TopologicalSpace X := indiscreteTopology X

/-! ## Comparison of Topologies -/

def finer {X : Type u} (t₁ t₂ : TopologicalSpace X) : Prop :=
  t₁.opens ⊆ t₂.opens

def coarser {X : Type u} (t₁ t₂ : TopologicalSpace X) : Prop :=
  t₂.opens ⊆ t₁.opens

/-! ## Finite Topology Classification -/

structure FiniteTopologyClassification (X : Type u) [Fintype X] where
  topologies : Finset (TopologicalSpace X)
  all_topologies : ∀ (t : TopologicalSpace X), t ∈ topologies
  count : topologies.card = numberOfTopologies (Fintype.card X)

#eval "── Properties/ClassificationData: finite topologies ──"
#eval numberOfTopologies 0
#eval numberOfTopologies 1
#eval numberOfTopologies 2
#eval numberOfTopologies 3
#eval "Lattice of topologies: discrete (finest) to indiscrete (coarsest)"

end MiniTopologicalSpaces
