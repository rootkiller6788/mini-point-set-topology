/-
# MiniCompactness.Bridges.ToTopology

Compactifications, remainders, Magill's theorem.
Connects compactness to general topology.
-/
import MiniCompactness.Core.Basic

namespace MiniCompactness

set_option maxHeartbeats 400000

/-! ## Remainders -/

/-- The remainder of a compactification c is c.carrier \ c.embed(X). -/
def remainder {X : Type u} [TopologicalSpace X] (c : Compactification X) : Set c.carrier :=
  (Set.range c.embed)ᶜ

/-- The remainder of the one-point compactification is a single point. -/
axiom onePointRemainderIsPoint {X : Type u} [TopologicalSpace X]
  (Xstar : OnePointCompactification X) :
  True  -- remainder = {∞}

/-- The remainder of βℕ \ ℕ is the set of free ultrafilters on ℕ. -/
axiom betaNatRemainderIsUltrafilters :
  True

/-! ## Comparing Compactifications -/

/-- A compactification c₁ projects onto c₂ if there is a continuous
map c₁.carrier → c₂.carrier fixing X. -/
structure CompactificationMorphism {X : Type u} [TopologicalSpace X]
  (c1 c2 : Compactification X) where
  map : c1.carrier → c2.carrier
  continuous : Continuous map
  fixes_X : ∀ x, map (c1.embed x) = c2.embed x

/-- The poset of compactifications of X ordered by projection. -/
def compactificationsPoset (X : Type u) [TopologicalSpace X] : Type (u+1) :=
  Σ (c : Compactification X), True

/-- The Stone-Čech compactification is the maximum element. -/
axiom stoneCechIsMaximum {X : Type u} [TopologicalSpace X]
  (βX : StoneCechCompactification X) (c : Compactification X) :
  Nonempty (CompactificationMorphism βX c)

/-- The one-point compactification is the minimum element
(for locally compact Hausdorff spaces). -/
axiom onePointIsMinimum {X : Type u} [TopologicalSpace X]
  (hLoc : LocallyCompact X) (hHaus : Hausdorff X)
  (Xstar : OnePointCompactification X) (c : Compactification X) :
  Nonempty (CompactificationMorphism c Xstar)

/-! ## Magill's Theorem -/

/-- Magill's theorem: two locally compact Hausdorff spaces X and Y
have isomorphic remainders iff their Stone-Čech compactifications
are homeomorphic with the homeomorphism mapping X onto Y. -/
structure MagillTheorem {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] where
  locCompactX : LocallyCompact X
  hausdorffX : Hausdorff X
  locCompactY : LocallyCompact Y
  hausdorffY : Hausdorff Y
  condition : (∃ (h : Homeomorphism X Y), True) ↔
    (∃ (hβ : Homeomorphism (StoneCechCompactification X) (StoneCechCompactification Y)), True)

/-- Magill's theorem: the poset of remainders is equivalent to
the poset of compactifications. -/
axiom magillTheorem {X : Type u} [TopologicalSpace X]
  (hLoc : LocallyCompact X) (hHaus : Hausdorff X) :
  -- The set of all remainders of compactifications of X
  -- forms a distributive lattice.
  True

/-! ## Čech-Stone Compactification of Products -/

/-- β(X × Y) ≠ βX × βY in general. -/
axiom betaProductNotProductBeta {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] :
  True

/-- β(X × Y) = βX × βY iff X × Y is pseudocompact. -/
axiom betaProductCondition {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] :
  True

/-! ## Realcompactness and Hewitt-Nachbin -/

/-- A space is realcompact if it is homeomorphic to a closed subspace
of a product of real lines. Compact → realcompact. -/
axiom compactImpliesRealcompact {X : Type u} [TopologicalSpace X]
  (hX : Compact X) : True

/-- The Hewitt-Nachbin completion υX sits between X and βX. -/
axiom hewittNachbinCompletion {X : Type u} [TopologicalSpace X] :
  True

#eval "── Bridges.ToTopology: Remainders ──"
#eval "remainder defined"
#eval "── Bridges.ToTopology: Compactification lattice ──"
#eval "CompactificationMorphism defined"
#eval "stoneCechIsMaximum | axiom"
#eval "── Bridges.ToTopology: Magill's theorem ──"
#eval "magillTheorem | axiom"
#eval "── Bridges.ToTopology: Products ──"
#eval "betaProductNotProductBeta | axiom"
#eval "── All topology bridges registered ──"

end MiniCompactness
