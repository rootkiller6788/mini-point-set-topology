/-
# MiniSeparationAxioms.Theorems.UniversalProperties

Universal property of the Tychonoff reflection: every topological space
has a universal Tychonoff quotient.  This is the left adjoint to the
inclusion Tych ⇉ Top.
-/

import MiniSeparationAxioms.Core.Basic
import MiniSeparationAxioms.Constructions.Universal

namespace MiniSeparationAxioms

/-! ## Tychonoff Reflection

For any topological space X, there is a Tychonoff space τX and a
continuous map η_X : X → τX such that any continuous map f : X → Y
with Y Tychonoff factors uniquely through η_X.
-/

/-- Construction of the Tychonoff reflection via evaluation mapping.
Define x ~ y iff f(x) = f(y) for all continuous f : X → ℝ.
Then τX = X/~ with the initial topology for all induced functions. -/
def TychonoffReflection (X : Type u) [TopologicalSpace X] : Type u :=
  Quot (λ x y : X => ∀ f : X → ℝ, Continuous f → f x = f y)

/-- The canonical projection η_X : X → τX. -/
def tychonoffReflectionMap {X : Type u} [TopologicalSpace X] : X → TychonoffReflection X :=
  Quot.mk _

/-- The Tychonoff reflection is indeed Tychonoff (T3.5). -/
theorem tychonoffReflection_is_t3_5 (X : Type u) [TopologicalSpace X] :
    T3_5 (TychonoffReflection X) := by
  sorry

/-- Universal property: any continuous f : X → Y with Y Tychonoff factors
uniquely through η_X. -/
theorem tychonoffReflection_universal (X : Type u) [TopologicalSpace X]
    (Y : Type u) [TopologicalSpace Y] (hY : T3_5 Y) (f : X → Y) (hf : Continuous f) :
    ∃! g : TychonoffReflection X → Y, Continuous g ∧ g ∘ tychonoffReflectionMap = f := by
  sorry

/-- The Tychonoff reflection defines a functor Top → Tych that is left adjoint
to the forgetful functor Tych → Top. -/
theorem tychonoffReflection_adjunction (X : Type u) [TopologicalSpace X]
    (Y : Type u) [TopologicalSpace Y] (hY : T3_5 Y) :
    (TychonoffReflection X → Y) ≃ (X → Y) := by
  sorry

/-- For a Tychonoff space, the reflection is naturally isomorphic to the identity. -/
theorem tychonoffReflection_of_tychonoff (X : Type u) [TopologicalSpace X] (hX : T3_5 X) :
    ∃ h : Homeomorphism (TychonoffReflection X) X, h.toFun ∘ tychonoffReflectionMap = id := by
  sorry

/-! ## Diagnostics -/

#eval "Theorems.UniversalProperties — Tychonoff reflection universal property"
#eval "  τX = maximal Tychonoff quotient"
#eval "  Left adjoint to inclusion Tych ↪ Top"

end MiniSeparationAxioms
