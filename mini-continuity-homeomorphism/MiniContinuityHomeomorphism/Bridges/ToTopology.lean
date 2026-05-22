import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Morphisms.Hom

/-!
# Bridge: To Topology — Function Spaces and the Compact-Open Topology

Connects continuity theory to topology via the compact-open topology on function
spaces, the exponential law, and Ascoli's theorem.
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

/-! ### Function Spaces -/

/-- The set of all functions from `X` to `Y` with the product topology
(which is the topology of pointwise convergence). -/
def pointwiseConvergenceTopology (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] :
    TopologicalSpace (X → Y) :=
  Pi.topologicalSpace

/-- The topology of compact convergence: uniform convergence on compact sets.
A subbasis is given by `{f | f(K) ⊆ U}` for `K` compact and `U` open. -/
def compactConvergenceTopology (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] :
    TopologicalSpace (X → Y) :=
  TopologicalSpace.generateFrom
    {S : Set (X → Y) |
      ∃ (K : Set X) (hK : IsCompact K) (U : Set Y) (hU : IsOpen U),
        S = {f | f '' K ⊆ U}}

/-- The compact-open topology on `C(X, Y)` is the subspace topology induced
from the compact convergence topology on `X → Y`. It coincides with the
compact convergence topology when `X` is compactly generated. -/
def compactOpenTopology' (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] :
    TopologicalSpace (C(X, Y)) :=
  TopologicalSpace.induced ContinuousFunction.toFun (compactConvergenceTopology X Y)

/-- The evaluation map `ev : C(X, Y) × X → Y` is continuous when `C(X, Y)`
carries the compact-open topology and `X` is locally compact Hausdorff. -/
theorem evaluation_continuous {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    [LocallyCompactSpace X] [T2Space X] : Continuous (evaluationMap : C(X, Y) × X → Y) := by
  sorry

/-- The exponential law: For locally compact Hausdorff `X`, there is a
homeomorphism `C(X × Y, Z) ≅ C(X, C(Y, Z))`. -/
theorem exponential_law {X Y Z : Type} [TopologicalSpace X] [TopologicalSpace Y]
    [TopologicalSpace Z] [LocallyCompactSpace X] [T2Space X] :
    Nonempty (Homeomorphism (C(X × Y, Z)) (C(X, C(Y, Z)))) := by
  sorry

/-- The composition map `C(Y, Z) × C(X, Y) → C(X, Z)` is continuous in the
compact-open topology. -/
theorem composition_continuous {X Y Z : Type} [TopologicalSpace X] [TopologicalSpace Y]
    [TopologicalSpace Z] (hY : LocallyCompactSpace Y) (hY2 : T2Space Y) :
    Continuous (fun (p : C(Y, Z) × C(X, Y)) => ContinuousFunction.comp p.1 p.2) := by
  sorry

/-! ### Ascoli's Theorem -/

/-- A family of functions is equicontinuous if for every `x` and `ε > 0`, there
is a neighborhood `U` of `x` such that all functions in the family vary by less
than `ε` on `U`. -/
def Equicontinuous {X Y : Type} [TopologicalSpace X] [MetricSpace Y]
    (F : Set (C(X, Y))) : Prop :=
  ∀ (x : X) (ε : ℝ), ε > 0 → ∃ (U : Set X), IsOpen U ∧ x ∈ U ∧
    ∀ (f : C(X, Y)), f ∈ F → ∀ (y : X), y ∈ U → dist (f x) (f y) < ε

/-- Ascoli's Theorem: In `C(X, Y)` with the compact-open topology, a set `F`
is compact iff it is closed, pointwise bounded, and equicontinuous. -/
theorem ascoli_theorem {X Y : Type} [TopologicalSpace X] [MetricSpace Y]
    (hX : IsCompact (Set.univ : Set X)) (hY : IsComplete Y)
    (F : Set (C(X, Y))) (hF_closed : IsClosed F) :
    IsCompact F ↔ (PointwiseBounded F) ∧ Equicontinuous F := by
  sorry

section evals

/-- The compact-open topology generalizes the topology of uniform convergence. -/
#eval "compact_open_topology : on compact X, compact-open = uniform convergence topology"

/-- The exponential law is a homeomorphism, not just a bijection. -/
#eval "exponential_law : C(X×Y, Z) ≅ C(X, C(Y,Z)) for locally compact Hausdorff X"

/-- Ascoli characterizes compact subsets of function spaces. -/
#eval "ascoli : F compact in C(X,Y) iff closed + pointwise bounded + equicontinuous"

end evals

end MiniContinuityHomeomorphism
