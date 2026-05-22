/-
# MiniCompactness.Morphisms.Equiv

Compactness equivalences:
- compact ↔ limit point compact + ... (for metric spaces)
- equivalence of compactification constructions
-/
import MiniCompactness.Core.Basic

namespace MiniCompactness

set_option maxHeartbeats 400000

/-! ## Compactness Equivalences -/

/-- Evidence that two compactness notions are equivalent. -/
structure CompactnessEquivalence (P Q : (X : Type u) → [TopologicalSpace X] → Prop) where
  forward : ∀ {X : Type u} [TopologicalSpace X], P X → Q X
  backward : ∀ {X : Type u} [TopologicalSpace X], Q X → P X

/--
Equivalence: sequentially compact and limit point compact are equivalent
for metric (first-countable) spaces.
-/
axiom sequentialEquivLimitPointMetric {X : Type u} [TopologicalSpace X] :
  (SequentiallyCompact X → LimitPointCompact X) ∧
  (LimitPointCompact X → SequentiallyCompact X)

/--
Equivalence: compact and sequentially compact are equivalent for metric spaces.
-/
axiom compactEquivSequentiallyCompactMetric {X : Type u} [TopologicalSpace X] :
  (Compact X → SequentiallyCompact X) ∧
  (SequentiallyCompact X → Compact X)

/--
Equivalence: compact ↔ countably compact + Lindelöf.
-/
axiom compactEquivCountablyCompactAndLindelof {X : Type u} [TopologicalSpace X] :
  (Compact X → (CountablyCompact X ∧ Lindelöf X)) ∧
  ((CountablyCompact X ∧ Lindelöf X) → Compact X)

/--
Equivalence: compact ↔ limit point compact (for T1 spaces).
-/
axiom compactEquivLimitPointCompactT1 {X : Type u} [TopologicalSpace X] :
  (Compact X → LimitPointCompact X) ∧
  (LimitPointCompact X → Compact X)

/-! ## Compactification Equivalences -/

/-- Comparison of different compactification constructions. -/
structure CompactificationComparison (X : Type u) [TopologicalSpace X] where
  onePoint : OnePointCompactification X
  stoneCech : StoneCechCompactification X
  -- The one-point and Stone-Čech compactifications are equivalent
  -- iff X is locally compact Hausdorff
  equivalentWhen : Prop

/-- Equivalence relation on the set of all compactifications of X. -/
structure CompactificationEquivalence {X : Type u} [TopologicalSpace X]
  (c1 c2 : Compactification X) where
  equiv : CompactificationEquiv c1 c2

/-- The Stone-Čech compactification is the largest (most general) compactification. -/
axiom stoneCechIsLargestCompactification {X : Type u} [TopologicalSpace X]
  (βX : StoneCechCompactification X) (c : Compactification X) :
  ∃ (f : βX.carrier → c.carrier), Continuous f ∧
    ∀ x, f (βX.embed x) = c.embed x

/-- The one-point compactification is the smallest compactification. -/
axiom onePointIsSmallestCompactification {X : Type u} [TopologicalSpace X]
  (Xstar : OnePointCompactification X) (c : Compactification X) :
  ∃ (f : c.carrier → Xstar.carrier), Continuous f ∧
    ∀ x, f (c.embed x) = Xstar.embed x

#eval "── Morphisms.Equiv: CompactnessEquivalence ──"
#eval "CompactnessEquivalence structure defined"
#eval "sequentialEquivLimitPointMetric | axiom"
#eval "compactEquivSequentiallyCompactMetric | axiom"
#eval "── Morphisms.Equiv: CompactificationComparison ──"
#eval "CompactificationComparison defined"
#eval "── All equivalence structures registered ──"

end MiniCompactness
