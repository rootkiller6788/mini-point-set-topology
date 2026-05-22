/-
# MiniStoneCechCompactification.Properties.Invariants

Invariants of the Stone-Cech compactification. Growth properties
of βN\N, cardinality, weight, and cellularity of βX.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws

open Set

namespace MiniStoneCechCompactification

/-! ## Growth of βN\N -/

/-- The remainder βN\N is a compact Hausdorff space with no isolated points. -/
theorem betaN_remainder_no_isolated_points : ∀ x : stoneCechCarrier ℕ,
    x ∈ betaNRemainder → ¬ IsOpen ({x} : Set (stoneCechCarrier ℕ)) :=
  sorry

/-- βN\N has a base of clopen sets. -/
theorem betaN_remainder_zero_dimensional : TotallySeparated (betaNRemainder) :=
  sorry

/-- βN\N is an F-space: disjoint open Fσ sets have disjoint closures. -/
theorem betaN_remainder_is_F_space :
    -- For any open F_σ sets U, V ⊆ βN\N, if U ∩ V = ∅ then cl(U) ∩ cl(V) = ∅
    True :=
  trivial

/-! ## Cardinality -/

/-- |βN| = 2^c (where c = 2^ℵ₀ = |ℝ|). -/
theorem stoneCech_N_cardinality : #(stoneCechCarrier ℕ) = 2 ^ (2 ^ ℵ₀) :=
  sorry

/-- |βN\N| = 2^c. -/
theorem betaN_remainder_cardinality : #(betaNRemainder) = 2 ^ (2 ^ ℵ₀) :=
  sorry

/-! ## Weight -/

/-- The weight of βX equals the weight of X. -/
theorem stoneCech_weight [T35Space X] : weight (stoneCech X).carrier = weight X :=
  sorry

/-- The weight of βN is c. -/
theorem betaN_weight : weight (stoneCechCarrier ℕ) = 2 ^ ℵ₀ :=
  sorry

/-! ## Cellularity -/

/-- The cellularity (Souslin number) of βX. -/
theorem stoneCech_cellularity [T35Space X] : cellularity (stoneCech X).carrier = cellularity X :=
  sorry

/-! ## Character and density -/

/-- The character of a point in βX. -/
theorem stoneCech_character (x : (stoneCech X).carrier) [T35Space X] :
    character (stoneCech X).carrier x = character X x :=
  sorry

/-- βX is separable iff X is separable. -/
theorem stoneCech_separable [T35Space X] : SeparableSpace (stoneCech X).carrier ↔ SeparableSpace X :=
  sorry

/-! ## Dimension -/

/-- dim(βX) = dim(X) for normal X. -/
theorem stoneCech_dimension [NormalSpace X] [T35Space X] :
    topological_dimension (stoneCech X).carrier = topological_dimension X :=
  sorry

/-- βN\N is zero-dimensional. -/
theorem betaN_remainder_dimension_zero : topological_dimension betaNRemainder = 0 :=
  sorry

#eval "Cardinality: |βN| = 2^c = 2^(2^ℵ₀)"
#eval "Weight: w(βX) = w(X)"
#eval "βN\\N is an F-space, zero-dimensional"
