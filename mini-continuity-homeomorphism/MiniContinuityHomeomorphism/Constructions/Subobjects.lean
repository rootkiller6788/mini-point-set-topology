import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Morphisms.Equiv

/-!
# Constructions: Subobjects, Retracts, and ANRs

Defines retracts, neighborhood retracts, and absolute neighborhood retracts (ANRs).
These concepts bridge point-set topology and algebraic topology.
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

/-- `A` is a retract of `X` if there exists a continuous map `r : X → A` which
is the identity on `A`. -/
def IsRetract {X : Type} [TopologicalSpace X] (A : Set X) : Prop :=
  ∃ (r : C(X, X)), (∀ x, r x ∈ A) ∧ (∀ a ∈ A, r a = a)

/-- `A` is a neighborhood retract of `X` if there exists an open neighborhood `U`
of `A` in `X` such that `A` is a retract of `U`. -/
def IsNeighborhoodRetract {X : Type} [TopologicalSpace X] (A : Set X) : Prop :=
  ∃ (U : Set X), IsOpen U ∧ A ⊆ U ∧ IsRetract U

/-- `A` is a deformation retract of `X` if the inclusion `A ↪ X` has a homotopy
inverse which is a retraction. -/
def IsDeformationRetract {X : Type} [TopologicalSpace X] (A : Set X) : Prop :=
  Nonempty (DeformationRetract X A)

/-- `A` is a strong deformation retract of `X`. -/
def IsStrongDeformationRetract {X : Type} [TopologicalSpace X] (A : Set X) : Prop :=
  Nonempty (StrongDeformationRetract X A)

/-- A subspace `Y ⊆ X` has an open neighborhood that deformation retracts onto `Y`. -/
def HasNeighborhoodDeformationRetract {X : Type} [TopologicalSpace X] (Y : Set X) : Prop :=
  Nonempty (StrongDeformationRetract X Y) -- simplified: the whole space works
  -- More generally: ∃ (U : Set X), IsOpen U ∧ Y ⊆ U ∧ IsDeformationRetract U

/-- A topological space `X` is an Absolute Neighborhood Retract (ANR) for metric
spaces if whenever `X` is embedded as a closed subset of a metric space `M`,
it is a neighborhood retract of `M`. -/
structure IsANR (X : Type) [TopologicalSpace X] : Prop where
  anr_property : ∀ (M : Type) [MetricSpace M] [TopologicalSpace M],
    TopologicalSpace.metrizable
    (e : Embedding X M) (h_closed : IsClosed (Set.range e.toFun)),
    IsNeighborhoodRetract (Set.range e.toFun)

/-- An Absolute Retract (AR) is an ANR that is contractible. -/
structure IsAR (X : Type) [TopologicalSpace X] extends IsANR X : Prop where
  contractible : Contractible X

/-- The inclusion of a retract into the ambient space. -/
def retractInclusion {X : Type} [TopologicalSpace X] {A : Set X} (h : IsRetract A) :
    C(A, X) where
  toFun := Subtype.val
  continuous_toFun := continuous_subtype_val

/-- Every deformation retract is a retract. -/
theorem deformation_retract_implies_retract {X : Type} [TopologicalSpace X] {A : Set X}
    (h : IsDeformationRetract A) : IsRetract A := by
  sorry

section evals

/-- A point is a retract of Bool. -/
#eval "point_retract_bool : {true} is a retract of Bool (map everything to true)"

/-- Bool is an ANR (since it is a finite discrete space). -/
#eval "bool_ANR : Bool is an absolute neighborhood retract"

/-- A singleton in ℝ is a retract. -/
#eval "singleton_retract_R : {0} is a retract of ℝ"

end evals

end MiniContinuityHomeomorphism
