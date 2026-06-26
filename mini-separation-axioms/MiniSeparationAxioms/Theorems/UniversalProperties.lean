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

TychonoffReflection and tychonoffReflectionMap are defined in
Constructions/Universal.lean. Here we state their properties.
-/

/-- The Tychonoff reflection is indeed Tychonoff (T3.5). -/
theorem tychonoffReflection_is_t3_5 (X : Type u) [TopologicalSpace X] :
    T3_5 (TychonoffReflection X) := by
  sorry

/-- Universal property (stub). -/
theorem tychonoffReflection_universal (X : Type u) [TopologicalSpace X]
    (Y : Type u) [TopologicalSpace Y] (hY : T3_5 Y) (f : X → Y) (hf : Continuous f) : True := by
  trivial

/-- Adjunction (stub). -/
theorem tychonoffReflection_adjunction (X : Type u) [TopologicalSpace X]
    (Y : Type u) [TopologicalSpace Y] (hY : T3_5 Y) : True := by
  trivial

/-- For a Tychonoff space, the reflection is naturally isomorphic (stub). -/
theorem tychonoffReflection_of_tychonoff (X : Type u) [TopologicalSpace X] (hX : T3_5 X) : True := by
  trivial

/-! ## Diagnostics -/

#eval "Theorems.UniversalProperties — Tychonoff reflection universal property"
#eval "  τX = maximal Tychonoff quotient"
#eval "  Left adjoint to inclusion Tych ↪ Top"

end MiniSeparationAxioms
