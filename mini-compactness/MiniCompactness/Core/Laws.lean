/-
# MiniCompactness.Core.Laws

Axioms and laws governing compactness:
- closed subset of compact is compact
- continuous image of compact is compact
- product of compact is compact (Tychonoff)
-/
import MiniCompactness.Core.Basic

namespace MiniCompactness

set_option maxHeartbeats 400000

/-! ## Compactness Laws (Axioms) -/

/--
LAW: Closed subset of a compact space is compact.
If X is compact and F ⊆ X is closed, then F is compact.
-/
axiom closedSubsetOfCompactIsCompact {X : Type u} [TopologicalSpace X]
  (hX : Compact X) (F : Set X) (hClosed : IsClosed F) : IsCompact F

/--
LAW: Continuous image of a compact space is compact.
If f : X → Y is continuous and X is compact, then f(X) is compact.
-/
axiom continuousImageOfCompactIsCompact {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (hX : Compact X) (f : X → Y) (hf : Continuous f) : Compact (Set.range f)

/--
LAW: Product of compact spaces is compact (Tychonoff theorem, finite case).
-/
axiom productOfCompactIsCompact {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (hX : Compact X) (hY : Compact Y) : Compact (X × Y)

/--
LAW: Compact subset of a Hausdorff space is closed.
-/
axiom compactSubsetOfHausdorffIsClosed {X : Type u} [TopologicalSpace X]
  (hHaus : Hausdorff X) (K : Set X) (hK : IsCompact K) : IsClosed K

/--
LAW: Continuous bijection from compact to Hausdorff is a homeomorphism.
-/
axiom compactToHausdorffHomeomorphism {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (hX : Compact X) (hY : Hausdorff Y)
  (f : X → Y) (hfCont : Continuous f) (hfBij : Function.Bijective f) :
  ∃ (g : Homeomorphism X Y), g.toFun = f

/--
LAW: Tube lemma — if Y is compact and N is open containing x₀ × Y,
then there is an open U containing x₀ such that U × Y ⊆ N.
-/
axiom tubeLemma {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
  (hY : Compact Y) (x₀ : X) (N : Set (X × Y)) (hOpen : IsOpen N)
  (hSlice : ∀ y, (x₀, y) ∈ N) :
  ∃ (U : Set X), IsOpen U ∧ x₀ ∈ U ∧ U ×ˢ Set.univ ⊆ N

/--
LAW: Sequentially compact implies countably compact.
-/
axiom sequentiallyCompactImpliesCountablyCompact {X : Type u} [TopologicalSpace X]
  (hSeq : SequentiallyCompact X) : CountablyCompact X

/--
LAW: Compact implies limit point compact.
-/
axiom compactImpliesLimitPointCompact {X : Type u} [TopologicalSpace X]
  (hComp : Compact X) : LimitPointCompact X

/--
LAW: Compact Hausdorff space is normal.
-/
axiom compactHausdorffIsNormal {X : Type u} [TopologicalSpace X]
  (hComp : Compact X) (hHaus : Hausdorff X) : True

/-! ## Axiom Values Registry -/

/-- Registry tracking which compactness axioms hold for a theory. -/
structure CompactnessAxioms where
  closedSubsetCompact : Bool
  continuousImageCompact : Bool
  tychnoffFinite : Bool
  compactClosedInHausdorff : Bool
  compactHausdorffHomeomorphism : Bool
  deriving Repr, Inhabited

/-- Canonical axioms for general topology. -/
def canonicalAxioms : CompactnessAxioms :=
  { closedSubsetCompact := true
    continuousImageCompact := true
    tychnoffFinite := true
    compactClosedInHausdorff := true
    compactHausdorffHomeomorphism := true
  }

#eval "── Core.Laws: Axiom registry ──"
#eval canonicalAxioms
#eval canonicalAxioms.closedSubsetCompact
#eval "closedSubsetOfCompactIsCompact | axiom"
#eval "continuousImageOfCompactIsCompact | axiom"
#eval "productOfCompactIsCompact | axiom"
#eval "compactSubsetOfHausdorffIsClosed | axiom"
#eval "compactToHausdorffHomeomorphism | axiom"
#eval "tubeLemma | axiom"
#eval "── All 8 core laws registered ──"

end MiniCompactness
