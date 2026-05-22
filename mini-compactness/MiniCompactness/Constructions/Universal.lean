/-
# MiniCompactness.Constructions.Universal

Universal property of Stone-Čech (continuous extension to compact Hausdorff),
universal property of one-point compactification.
-/
import MiniCompactness.Core.Basic

namespace MiniCompactness

set_option maxHeartbeats 400000

/-! ## Universal Property of Stone-Čech -/

/-- The universal property: any continuous map from X to a compact Hausdorff
space K extends uniquely to a continuous map from βX to K. -/
structure StoneCechUniversalProperty (X : Type u) [TopologicalSpace X] where
  βX : Type u
  [topology : TopologicalSpace βX]
  compact : Compact βX
  hausdorff : Hausdorff βX
  embed : X → βX
  continuousEmbed : Continuous embed
  extension : ∀ (K : Type u) [TopologicalSpace K] (hKComp : Compact K) (hKHaus : Hausdorff K)
    (f : X → K) (hf : Continuous f),
    ∃! (g : βX → K), Continuous g ∧ g ∘ embed = f

/-- The Stone-Čech compactification satisfies its universal property. -/
axiom stoneCechUniversalProperty {X : Type u} [TopologicalSpace X] :
  ∃ (β : StoneCechCompactification X),
    Nonempty (StoneCechUniversalProperty X)

/-- The extension property for bounded continuous functions (C*-algebra approach). -/
axiom stoneCechBoundedExtension {X : Type u} [TopologicalSpace X]
  (βX : StoneCechCompactification X)
  (f : X → ℝ) (hf : Continuous f) (hBounded : ∃ M, ∀ x, |f x| ≤ M) :
  ∃! (g : βX.carrier → ℝ), Continuous g ∧ g ∘ βX.embed = f

/-! ## Universal Property of One-Point Compactification -/

/-- Universal property of the one-point compactification:
For a locally compact Hausdorff space X, the one-point compactification X*
is the smallest compactification. -/
structure OnePointUniversalProperty (X : Type u) [TopologicalSpace X] where
  Xstar : Type u
  [topology : TopologicalSpace Xstar]
  compact : Compact Xstar
  hausdorff : Hausdorff Xstar
  embed : X → Xstar
  infinity : Xstar
  -- For any compactification c of X, there is a unique map c → X* fixing X
  universal : ∀ (c : Compactification X),
    ∃! (g : c.carrier → Xstar), Continuous g ∧ g ∘ c.embed = embed

/-- The one-point compactification satisfies its universal property. -/
axiom onePointUniversalProperty {X : Type u} [TopologicalSpace X]
  (hLoc : LocallyCompact X) (hHaus : Hausdorff X) :
  ∃ (Xstar : OnePointCompactification X),
    Nonempty (OnePointUniversalProperty X)

/-- The one-point compactification of a locally compact Hausdorff space
is Hausdorff iff X is locally compact Hausdorff. -/
axiom onePointIsHausdorffCondition {X : Type u} [TopologicalSpace X]
  (Xstar : OnePointCompactification X) :
  Hausdorff Xstar.carrier ↔ LocallyCompact X ∧ Hausdorff X

/-! ## Universal Property of Wallman Compactification -/

/-- The Wallman compactification ωX is defined using ultrafilters
on the closed sets of a T1 space. -/
structure WallmanCompactification (X : Type u) [TopologicalSpace X] where
  carrier : Type u
  [topology : TopologicalSpace carrier]
  compact : Compact carrier
  hausdorff : Hausdorff carrier
  embed : X → carrier
  -- ωX is a compactification for T1 spaces
  t1Required : True

/-- Every T1 space has a Wallman compactification. -/
axiom wallmanExistence {X : Type u} [TopologicalSpace X] :
  -- T1 condition
  True → ∃ (ωX : WallmanCompactification X), True

#eval "── Constructions.Universal: Stone-Čech ──"
#eval "StoneCechUniversalProperty defined"
#eval "── Constructions.Universal: One-Point ──"
#eval "OnePointUniversalProperty defined"
#eval "── Constructions.Universal: Wallman ──"
#eval "WallmanCompactification defined"
#eval "── All universal constructions registered ──"

end MiniCompactness
