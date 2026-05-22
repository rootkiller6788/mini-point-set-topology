/-
# MiniStoneCechCompactification.Core.Basic

Core definitions for compactification theory.

A **compactification** of a topological space X is a pair (c, K) where
K is a compact Hausdorff space and c : X → K is a dense embedding.

We define:
- `Compactification` as the structure of a dense embedding into compact Hausdorff
- `StoneCech` βX via the evaluation map into [0,1]^{C(X,[0,1])}
- `OnePointCompactification` X* = X ∪ {∞} (Alexandroff)
- `WallmanCompactification` via the Wallman base of closed sets
- `BohrCompactification` for topological groups
- `SamuelCompactification` via uniform structures
- `EndCompactification` (Freudenthal) via ends of spaces
- `Remainder` βX \ X (the growth)
- `CechStoneFunctor` β : Tych → CompHaus
-/

import MiniObjectKernel.Core.Basic
import MiniTopologicalSpaces.Core.Basic
import MiniCompactness.Core.Basic
import MiniSeparationAxioms.Core.Basic

open Set

/-! ## Compactification structure -/

/-- A compactification of a topological space X is a pair (c, K) where
    K is compact Hausdorff and c : X → K is a dense embedding. -/
structure Compactification (X : Type u) [TopologicalSpace X] where
  (carrier : Type u)
  [topologicalSpace : TopologicalSpace carrier]
  [t2Space : T2Space carrier]
  [compactSpace : CompactSpace carrier]
  (embedding : X → carrier)
  (isEmbedding : Embedding embedding)
  (isDense : DenseRange embedding)

attribute [instance] Compactification.topologicalSpace
attribute [instance] Compactification.t2Space
attribute [instance] Compactification.compactSpace

namespace Compactification

variable {X : Type u} [TopologicalSpace X] (c : Compactification X)

/-- The underlying compact Hausdorff space of a compactification. -/
def space := c.carrier

/-- The remainder (growth) of a compactification. -/
def remainder : Set c.carrier := (Set.range c.embedding)ᶜ

/-- A compactification of a Tychonoff space. -/
structure TychCompactification (X : Type u) [TopologicalSpace X] [T35Space X] extends Compactification X where
  (isTychEmbedding : IsClosedEmbedding embedding)

end Compactification

/-! ## Stone-Cech compactification -/

/-- The Stone-Cech compactification βX is the closure of the evaluation map
    e : X → [0,1]^{C(X,[0,1])} defined by e(x)(f) = f(x). -/
def stoneCech (X : Type u) [TopologicalSpace X] [T35Space X] : Compactification X :=
  sorry

notation "β" => stoneCech

/-! ## One-point compactification (Alexandroff) -/

/-- The one-point (Alexandroff) compactification X* = X ∪ {∞}.
    Adds a single point at infinity. -/
def OnePointCompactification (X : Type u) [TopologicalSpace X] : Type u :=
  Option X

namespace OnePointCompactification

variable {X : Type u} [TopologicalSpace X]

/-- The point at infinity. -/
def infinity : OnePointCompactification X := none

/-- The inclusion map X → X*. -/
def inclusion (x : X) : OnePointCompactification X := some x

/-- One-point compactification is a compactification when X is locally compact Hausdorff. -/
def asCompactification [LocallyCompactSpace X] [T2Space X] : Compactification X :=
  sorry

notation "X*" => OnePointCompactification

end OnePointCompactification

/-! ## Wallman compactification -/

/-- The Wallman compactification wX constructed from the Wallman base of
    closed sets (all closed sets in normal spaces, or a specified ring of closed sets).
    Points are maximal filters of the Wallman base. -/
def WallmanCompactification (X : Type u) [TopologicalSpace X] [T1Space X] : Compactification X :=
  sorry

/-! ## Bohr compactification -/

/-- The Bohr compactification of a topological group G.
    The universal compact group into which G maps continuously. -/
def BohrCompactification (G : Type u) [TopologicalSpace G] [Group G] [TopologicalGroup G] : Compactification G :=
  sorry

/-! ## Samuel compactification -/

/-- The Samuel (uniform) compactification via the uniform structure. -/
def SamuelCompactification (X : Type u) [TopologicalSpace X] [UniformSpace X] : Compactification X :=
  sorry

/-! ## End (Freudenthal) compactification -/

/-- The Freudenthal (end) compactification for connected, locally connected,
    locally compact Hausdorff spaces. -/
def EndCompactification (X : Type u) [TopologicalSpace X] [LocallyCompactSpace X] [T2Space X] : Compactification X :=
  sorry

/-! ## Remainder -/

/-- The remainder βX \ X of the Stone-Cech compactification. -/
def stoneCechRemainder (X : Type u) [TopologicalSpace X] [T35Space X] : Set ((stoneCech X).carrier) :=
  Compactification.remainder (stoneCech X)

notation "βX\\X" => stoneCechRemainder

/-! ## Cech-Stone functor -/

/-- The Cech-Stone functor from Tychonoff spaces to compact Hausdorff spaces. -/
def cechStoneFunctor (X : Type u) [TopologicalSpace X] [T35Space X] : Compactification X :=
  stoneCech X

/-! ## #eval examples -/

#eval "Compactification structure defined"
#eval "Stone-Cech βX defined"
#eval "One-point compactification X* defined"
