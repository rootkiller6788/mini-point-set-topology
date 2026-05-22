/-
# MiniTopologicalSpaces: Bridge to Algebra

Topological groups, topological vector spaces — algebraic
structures equipped with a compatible topology.
-/

import MiniTopologicalSpaces.Core.Basic
import MiniTopologicalSpaces.Morphisms.Hom

namespace MiniTopologicalSpaces

/-! ## Topological Group

A group G equipped with a topology such that the group operations
(multiplication and inversion) are continuous.
-/

structure TopologicalGroup (G : Type u) [Group G] [t : TopologicalSpace G] where
  mul_continuous : ContinuousMap (G × G) G
  inv_continuous : ContinuousMap G G
  mul_def : mul_continuous.toFun = λ ⟨x, y⟩ => x * y
  inv_def : inv_continuous.toFun = λ x => x⁻¹

/-! ## Topological Ring

A ring R equipped with a topology making addition, negation,
and multiplication continuous.
-/

structure TopologicalRing (R : Type u) [Ring R] [t : TopologicalSpace R] where
  add_continuous : ContinuousMap (R × R) R
  neg_continuous : ContinuousMap R R
  mul_continuous : ContinuousMap (R × R) R
  add_def : add_continuous.toFun = λ ⟨x, y⟩ => x + y
  neg_def : neg_continuous.toFun = λ x => -x
  mul_def : mul_continuous.toFun = λ ⟨x, y⟩ => x * y

/-! ## Topological Vector Space

A vector space V over a topological field K, where addition
V × V → V and scalar multiplication K × V → V are continuous.
-/

structure TopologicalVectorSpace (K V : Type u) [Field K] [tK : TopologicalSpace K]
    [AddCommGroup V] [Module K V] [tV : TopologicalSpace V] where
  add_continuous : ContinuousMap (V × V) V
  smul_continuous : ContinuousMap (K × V) V

/-! ## Continuous Group Action

A group G acts continuously on a topological space X.
-/

structure ContinuousGroupAction (G X : Type u) [Group G] [tG : TopologicalSpace G]
    [tX : TopologicalSpace X] where
  action : G → X → X
  continuous : ContinuousMap (G × X) X
  action_def : continuous.toFun = λ ⟨g, x⟩ => action g x
  action_one : ∀ x, action 1 x = x
  action_mul : ∀ g h x, action (g * h) x = action g (action h x)

#eval "── Bridges/ToAlgebra: topological groups ──"
#check TopologicalGroup
#check TopologicalRing
#check TopologicalVectorSpace
#eval "Topological group, ring, vector space defined"

end MiniTopologicalSpaces
