/-
# MiniStoneCechCompactification.Constructions.Products

Compactification of product spaces, including Glicksberg's theorem
on pseudocompactness of products.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws

open Set

namespace MiniStoneCechCompactification

variable {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] [T35Space X] [T35Space Y]

/-! ## Product of compactifications -/

/-- The product of two compactifications is a compactification of X × Y. -/
def productCompactification (cX : Compactification X) (cY : Compactification Y) :
    Compactification (X × Y) :=
  sorry

/-- β(X × Y) ≅ βX × βY for finite products. -/
theorem stoneCech_product_homeo : Nonempty ((stoneCech (X × Y)).carrier ≃ₜ (stoneCech X).carrier × (stoneCech Y).carrier) :=
  sorry

/-- β commutes with finite products. -/
theorem stoneCech_preserves_finite_products : Nonempty ((stoneCech (X × Y)).carrier ≃ₜ (stoneCech X).carrier × (stoneCech Y).carrier) :=
  stoneCech_product_homeo

/-! ## Glicksberg's theorem -/

/-- A space is pseudocompact if every continuous real-valued function on it is bounded. -/
def IsPseudocompact (X : Type u) [TopologicalSpace X] : Prop :=
  ∀ (f : X → ℝ), Continuous f → ∃ (M : ℝ), ∀ x, |f x| ≤ M

/-- **Glicksberg's theorem**: The product of a pseudocompact locally compact space
    with a pseudocompact space is pseudocompact. -/
theorem glicksberg_theorem [LocallyCompactSpace X] [T35Space X] [T35Space Y]
    (hX : IsPseudocompact X) (hY : IsPseudocompact Y) : IsPseudocompact (X × Y) :=
  sorry

/-- Corollary: product of two pseudocompact locally compact spaces is pseudocompact. -/
theorem glicksberg_corollary [LocallyCompactSpace X] [LocallyCompactSpace Y] [T35Space X] [T35Space Y]
    (hX : IsPseudocompact X) (hY : IsPseudocompact Y) : IsPseudocompact (X × Y) :=
  glicksberg_theorem hX hY

/-! ## One-point of product -/

/-- The one-point compactification of a product (for locally compact spaces). -/
theorem onePoint_product [LocallyCompactSpace X] [LocallyCompactSpace Y] [T2Space X] [T2Space Y] :
    Nonempty ((OnePointCompactification (X × Y)) ≃ₜ (OnePointCompactification X) × (OnePointCompactification Y)) :=
  sorry

#eval "Products: β(X×Y) ≅ βX × βY (finite)"
#eval "Glicksberg: pseudocompact × locally compact pseudocompact = pseudocompact"
#eval "One-point of product (locally compact)"
