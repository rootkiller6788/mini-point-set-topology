/-
# MiniStoneCechCompactification.Theorems.Basic

Basic theorems of compactification theory. Stone-Cech existence and
uniqueness, the one-point compactification, and Wallman-Sanin.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws
import MiniStoneCechCompactification.Constructions.Universal

open Set

namespace MiniStoneCechCompactification

variable {X : Type u} [TopologicalSpace X] [T35Space X]

/-! ## Stone-Cech existence and uniqueness -/

/-- **Stone-Cech existence theorem**: Every Tychonoff space has a
    Stone-Cech compactification. -/
theorem stoneCech_exists : Nonempty (Compactification X) := by
  refine ⟨stoneCech X⟩

/-- **Stone-Cech uniqueness theorem**: The Stone-Cech compactification
    is unique up to equivalence of compactifications. -/
theorem stoneCech_unique (c : Compactification X)
    (h_universal : ∀ {K : Type u} [TopologicalSpace K] [T2Space K] [CompactSpace K]
      (f : X → K) (hf : Continuous f), ∃! g : c.carrier → K, Continuous g ∧ g ∘ c.embedding = f) :
    c ≅c stoneCech X :=
  sorry

/-! ## One-point compactification -/

/-- The one-point compactification of a locally compact Hausdorff space
    is a compact Hausdorff space. -/
theorem onePoint_compactHausdorff [LocallyCompactSpace X] [T2Space X] :
    T2Space (OnePointCompactification X) ∧ CompactSpace (OnePointCompactification X) :=
  sorry

/-- X* = βX when X \ K is compact for some compact K.
    More precisely: if X \ K is compact for a compact subset K ⊆ X,
    then the one-point compactification equals the Stone-Cech compactification. -/
theorem onePoint_eq_stoneCech_when_complement_compact [LocallyCompactSpace X] [T2Space X]
    (K : Set X) (hK : IsCompact K) (hcomp : IsCompact (Kᶜ)) :
    Nonempty ((OnePointCompactification.asCompactification (X := X)).carrier ≃ₜ (stoneCech X).carrier) :=
  sorry

/-- S^n ≅ (R^n)* as compactifications. -/
theorem sphere_onePoint_Rn (n : ℕ) : Nonempty (OnePointCompactification (Fin n → ℝ) ≃ₜ sphere n ℝ) :=
  sorry

/-! ## Wallman-Sanin compactification -/

/-- **Wallman-Shanin theorem**: Every T1 space has a Wallman compactification.
    For a normal T1 space, the Wallman compactification is equal to
    the Stone-Cech compactification. -/
theorem wallman_exists [T1Space X] : Nonempty (Compactification X) := by
  refine ⟨WallmanCompactification X⟩

/-- For normal spaces, the Wallman compactification equals βX. -/
theorem wallman_eq_stoneCech [NormalSpace X] [T1Space X] [T35Space X] :
    Nonempty ((WallmanCompactification X).carrier ≃ₜ (stoneCech X).carrier) :=
  sorry

/-! ## Compactification of normal spaces -/

/-- A T1 space X is normal iff its Wallman compactification is Hausdorff. -/
theorem normal_iff_wallman_hausdorff [T1Space X] :
    NormalSpace X ↔ T2Space (WallmanCompactification X).carrier :=
  sorry

#eval "Stone-Cech existence and uniqueness (up to equivalence)"
#eval "One-point = β when X\\K compact for compact K"
#eval "Wallman = β for normal spaces (Wallman-Shanin)"
