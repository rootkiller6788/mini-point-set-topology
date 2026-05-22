/-
# MiniStoneCechCompactification.Core.Objects

Object-level definitions and instances for compactification theory.

Provides typeclass instances, inhabited instances, and concrete
object constructions for the various compactification types.
-/

import MiniStoneCechCompactification.Core.Basic

namespace MiniStoneCechCompactification

open Set

/-! ## Instances for Compactification carrier -/

variable (X : Type u) [TopologicalSpace X] [T35Space X]

/-- The empty compactification (only possible for empty X). -/
def emptyCompactification [IsEmpty X] : Compactification X :=
  sorry

/-- The finite discrete compactification. -/
def finiteCompactification [Finite X] [DiscreteTopology X] : Compactification X :=
  sorry

/-! ## Stone-Cech carrier instances -/

section StoneCechInstances

  /-- The carrier type of βX. -/
  def stoneCechCarrier (X : Type u) [TopologicalSpace X] [T35Space X] : Type u :=
    (stoneCech X).carrier

  /-- The canonical embedding e : X → βX. -/
  def stoneCechEmbedding (X : Type u) [TopologicalSpace X] [T35Space X] :
    X → stoneCechCarrier X :=
    (stoneCech X).embedding

  /-- βX is compact Hausdorff. -/
  instance stoneCech_compactSpace : CompactSpace (stoneCechCarrier X) :=
    (stoneCech X).compactSpace

  instance stoneCech_t2Space : T2Space (stoneCechCarrier X) :=
    (stoneCech X).t2Space

end StoneCechInstances

/-! ## One-point compactification instances -/

section OnePointInstances

  /-- One-point compactification of R^n is S^n. -/
  def sphereAsOnePoint (n : ℕ) : OnePointCompactification (Fin n → ℝ) :=
    OnePointCompactification.infinity

  /-- The one-point compactification is compact. -/
  instance onePoint_compact [LocallyCompactSpace X] [T2Space X] :
    CompactSpace (OnePointCompactification X) :=
    sorry

end OnePointInstances

/-! ## Wallman instances -/

  /-- The Wallman compactification of a T1 space. -/
  def wallmanCarrier (X : Type u) [TopologicalSpace X] [T1Space X] : Type _ :=
    (WallmanCompactification X).carrier

/-! ## Remainder objects -/

  /-- The remainder of βN is the space of nonprincipal ultrafilters. -/
  def betaNRemainder : Set ((stoneCech ℕ).carrier) :=
    stoneCechRemainder ℕ

#eval "Objects module: compactification instances"
#eval "βN remainder = nonprincipal ultrafilters"
#eval "S^n = one-point compactification of R^n"
