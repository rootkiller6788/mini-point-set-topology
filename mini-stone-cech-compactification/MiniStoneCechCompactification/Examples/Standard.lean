/-
# MiniStoneCechCompactification.Examples.Standard

Standard examples of compactifications: βN (growth of N), βR,
S^n as one-point compactification of R^n, and more.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws
import MiniStoneCechCompactification.Theorems.Basic

open Set

namespace MiniStoneCechCompactification

/-! ## βN: The Stone-Cech compactification of the natural numbers -/

/-- The Stone-Cech compactification of N (with discrete topology). -/
def betaN : Compactification ℕ :=
  stoneCech ℕ

/-- βN is homeomorphic to the space of ultrafilters on N. -/
theorem betaN_ultrafilter : Nonempty ((betaN).carrier ≃ₜ Ultrafilter ℕ) :=
  stoneCech_N_ultrafilter

/-- The growth of N: βN\N is the space of nonprincipal ultrafilters. -/
theorem betaN_growth : betaNRemainder = {u : Ultrafilter ℕ | ¬ IsPrincipal u} :=
  sorry

/-- |βN| = 2^c. -/
#eval "|βN| = 2^c = 2^(2^ℵ₀)"

/-- βN is extremally disconnected. -/
example : ExtremallyDisconnected (betaN).carrier :=
  stoneCech_discrete_extremallyDisconnected

/-! ## βR: The Stone-Cech compactification of the real line -/

/-- βR has a very complicated structure. -/
def betaR : Compactification ℝ :=
  stoneCech ℝ

/-- βR contains βN as a closed subspace. -/
theorem betaN_closed_in_betaR : Nonempty (IsClosedEmbedding (betaN).carrier (betaR).carrier) :=
  sorry

/-- |βR| = 2^c. -/
#eval "|βR| = 2^c"

/-! ## S^n as one-point compactification of R^n -/

/-- S^n is homeomorphic to the one-point compactification of R^n. -/
theorem sphere_one_point (n : ℕ) : Nonempty (OnePointCompactification (Fin n → ℝ) ≃ₜ sphere n ℝ) :=
  sphere_onePoint_Rn n

/-- S^1 is the one-point compactification of R. -/
example : Nonempty (OnePointCompactification ℝ ≃ₜ circle) :=
  sorry

/-- S^2 is the one-point compactification of R^2. -/
example : Nonempty (OnePointCompactification (ℝ × ℝ) ≃ₜ sphere 2 ℝ) :=
  sorry

#eval "S^1 ≅ R* (one-point of R)"
#eval "S^2 ≅ (R^2)*"
#eval "S^n ≅ (R^n)*"

/-! ## Tychonoff plank and β -/

/-- The Tychonoff plank [0,ω₁] × [0,ω] \ {(ω₁,ω)} and its compactifications. -/
def tychonoffPlank : Type :=
  (Set.Icc (0 : Ordinal.{u}) (ω₁ : Ordinal.{u})) × (Set.Icc (0 : Ordinal.{u}) (ω : Ordinal.{u})) \ {(ω₁, ω)}

#eval "Tychonoff plank: [0,ω₁]×[0,ω]\\{(ω₁,ω)}"
#eval "βN has 2^c many points"
#eval "βR contains βN as closed subspace"
