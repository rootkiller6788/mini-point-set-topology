/-
# MiniStoneCechCompactification.Morphisms.Iso

Isomorphisms of compactifications. Two compactifications are equivalent
when there is a homeomorphism between their carriers fixing X.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Morphisms.Hom

open Set

namespace MiniStoneCechCompactification

variable {X : Type u} [TopologicalSpace X]

/-! ## Equivalent compactifications -/

/-- Two compactifications are equivalent if there is a homeomorphism
    φ : c₁.carrier → c₂.carrier such that φ ∘ e₁ = e₂. -/
structure EquivalentCompactifications (c₁ c₂ : Compactification X) where
  (homeo : c₁.carrier ≃ₜ c₂.carrier)
  (fixesX : homeo ∘ c₁.embedding = c₂.embedding)

infixl:50 " ≅c " => EquivalentCompactifications

/-- Equivalence of compactifications is an equivalence relation. -/
namespace EquivalentCompactifications

  /-- Reflexivity. -/
  def refl (c : Compactification X) : c ≅c c where
    homeo := Homeomorph.refl _
    fixesX := rfl

  /-- Symmetry. -/
  def symm {c₁ c₂ : Compactification X} (h : c₁ ≅c c₂) : c₂ ≅c c₁ where
    homeo := h.homeo.symm
    fixesX := by
      apply_fun h.homeo.symm ∘ · at h.fixesX
      simp [h.fixesX]

  /-- Transitivity. -/
  def trans {c₁ c₂ c₃ : Compactification X} (h₁₂ : c₁ ≅c c₂) (h₂₃ : c₂ ≅c c₃) : c₁ ≅c c₃ where
    homeo := h₁₂.homeo.trans h₂₃.homeo
    fixesX := by
      simp [h₁₂.fixesX, h₂₃.fixesX, Function.comp.assoc]

end EquivalentCompactifications

/-! ## Ordering of compactifications -/

/-- c₁ ≤ c₂ if there is a continuous surjection π : c₂.carrier → c₁.carrier
    with π ∘ e₂ = e₁. This defines a partial order (up to equivalence)
    with βX as the maximal element and X* (for locally compact X) as minimal. -/
structure CompactificationOrder (c₁ c₂ : Compactification X) where
  (projection : c₂.carrier → c₁.carrier)
  (continuous_projection : Continuous projection)
  (surjective_projection : Surjective projection)
  (commutes : projection ∘ c₂.embedding = c₁.embedding)

infixl:50 " ≤c " => CompactificationOrder

/-- The Stone-Cech compactification is maximal. -/
theorem stoneCech_is_maximal [T35Space X] (c : Compactification X) : c ≤c stoneCech X :=
  sorry

/-- For locally compact X, the one-point compactification is minimal
    among all Hausdorff compactifications. -/
theorem onePoint_is_minimal [LocallyCompactSpace X] [T2Space X] (c : Compactification X) :
    OnePointCompactification.asCompactification ≤c c :=
  sorry

/-- The order is anti-symmetric up to equivalence. -/
theorem order_antisymm {c₁ c₂ : Compactification X} (h₁₂ : c₁ ≤c c₂) (h₂₁ : c₂ ≤c c₁) :
    c₁ ≅c c₂ :=
  sorry

#eval "Isomorphism: equivalent compactifications"
#eval "Ordering: βX maximal, X* minimal (for locally compact)"
#eval "Anti-symmetry of compactification order"
