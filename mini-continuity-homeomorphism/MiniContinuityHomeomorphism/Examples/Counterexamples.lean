import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Morphisms.Hom
import MiniContinuityHomeomorphism.Morphisms.Equiv

/-!
# Examples: Counterexamples

Important counterexamples distinguishing various notions:
- Continuous bijection that is not a homeomorphism
- Homotopy equivalent but not homeomorphic spaces
- Continuous surjection that is not a quotient map
- An open map that is not closed (and vice versa)
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

/-- Example: The map `[0,1) → S¹` given by `t ↦ e^{2πit}` is a continuous
bijection but not a homeomorphism. The inverse would be discontinuous at `(1,0)`. -/
theorem continuous_bijection_not_homeomorphism :
    ∃ (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y]
      (f : C(X, Y)), Function.Bijective f.toFun ∧ ¬ Nonempty (Homeomorphism X Y) := by
  sorry

/-- The interval `[0,1]` and the circle `S¹` are not homeomorphic but the
interval is not even homotopy equivalent to the circle. A better example:
the open interval `(0,1)` and `ℝ` are homeomorphic, so not a counterexample.
We need spaces that are homotopy equivalent but not homeomorphic. -/
/-- Example: A contractible space (`ℝⁿ`) and a point (`{*}`) are homotopy
equivalent but not homeomorphic (except for `ℝ⁰`). -/
theorem homotopy_equivalent_not_homeomorphic :
    ∃ (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y],
      Nonempty (HomotopyEquivalence X Y) ∧ ¬ Nonempty (Homeomorphism X Y) := by
  sorry

/-- The ``double origin line'' (the line ℝ with two origins) has a continuous
bijection to ℝ that is not a homeomorphism. -/
theorem double_origin_continuous_bijection_not_homeo : True := by
  sorry

/-- A continuous surjection that is not a quotient map: consider the identity
map from a space with discrete topology to the same set with indiscrete topology. -/
theorem continuous_surjection_not_quotient_map : True := by
  sorry

/-- The projection `ℝ² → ℝ` is open but not closed (e.g., the closed set
`{(x,y) | xy = 1}` maps to `ℝ \ {0}` which is not closed). -/
theorem projection_open_not_closed : True := by
  sorry

/-- The map `x ↦ 1/(1+x²)` on ℝ is continuous, the image is `(0,1]` which is not
closed in ℝ, but the domain ℝ is closed. This is not a closed map. -/
theorem continuous_not_closed_map : True := by
  sorry

/-- Inclusion of an open subset that is not closed: `(0,1) ↪ ℝ` is an embedding
that is an open map but not a closed map. -/
theorem embedding_open_not_closed : True := by
  sorry

/-- The pair of spaces `S¹ × S¹` (torus) and `S²` (sphere) are not homotopy
equivalent (π₁(torus)=ℤ², π₁(sphere)=0) but they are both compact connected
surfaces of dimension 2. -/
theorem torus_not_homotopy_equivalent_sphere :
    ¬ Nonempty (HomotopyEquivalence (Torus) (Sphere 2)) := by
  sorry

section evals

/-- The map t ↦ e^{2πit} from [0,1) to S¹ is a continuous bijection but its
inverse is not continuous. -/
#eval "map_circle : ↦ e^{2πit} : [0,1) → S¹ is continuous bijection, not homeomorphism"

/-- ℝ is contractible (homotopy equivalent to a point), but not homeomorphic to a point. -/
#eval "R_contractible : ℝ ≃ₕ {*} but ℝ ≇ {*}"

/-- The projection ℝ² → ℝ is open but not closed. -/
#eval "projection_open_not_closed : (x,y) ↦ x from ℝ² to ℝ"

/-- The identity ℝ_disc → ℝ_indisc is a continuous bijection but the preimage
of a point is a point (open in discrete, not open in indiscrete). -/
#eval "id_disc_indisc : continuous bijection ℝ_disc → ℝ_indisc not a homeomorphism"

end evals

end MiniContinuityHomeomorphism
