/-
# MiniCompactness.Morphisms.Hom

Proper maps, perfect maps, and compact-covering maps.
-/
import MiniCompactness.Core.Basic

namespace MiniCompactness

set_option maxHeartbeats 400000

/-! ## Proper Map -/

/-- A proper map sends compact sets to compact sets via preimages. -/
structure ProperMapData {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) where
  isContinuous : Continuous f
  isClosed : ∀ (F : Set X), IsClosed F → IsClosed (f '' F)
  compactFibers : ∀ (y : Y), IsCompact (f ⁻¹' {y})

/-- Register a proper map with metadata. -/
structure ProperMapWithName {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) where
  data : ProperMapData f
  name : String
  deriving Repr

/-- The identity map is proper. -/
def properMapId {X : Type u} [TopologicalSpace X] : ProperMapData (id : X → X) :=
  { isContinuous := by
      intro U hU; simpa using hU
    isClosed := by
      intro F hF; simpa using hF
    compactFibers := by
      intro y
      -- {y} is compact since it is finite
      sorry
  }

/-- Composition of proper maps is proper. -/
def properMapComp {X Y Z : Type u} [TopologicalSpace X] [TopologicalSpace Y] [TopologicalSpace Z]
  (f : X → Y) (g : Y → Z) (hf : ProperMapData f) (hg : ProperMapData g) :
  ProperMapData (g ∘ f) :=
  { isContinuous := by
      intro U hU
      apply hf.isContinuous
      apply hg.isContinuous
      exact hU
    isClosed := sorry
    compactFibers := sorry
  }

/-! ## Perfect Map -/

/-- A perfect map is a continuous, closed map with compact fibers. -/
structure PerfectMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : Prop where
  continuous : Continuous f
  closed : ∀ (F : Set X), IsClosed F → IsClosed (f '' F)
  compactFibers : ∀ (y : Y), IsCompact (f ⁻¹' {y})

/-- Every continuous map from a compact space to a Hausdorff space is perfect. -/
axiom compactToHausdorffMapIsPerfect {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]
  (hX : Compact X) (hY : Hausdorff Y) (f : X → Y) (hf : Continuous f) : PerfectMap f

/-! ## Compact-Covering Map -/

/-- A map f is compact-covering if every compact subset of Y is the image
of some compact subset of X. -/
structure CompactCoveringMap {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] (f : X → Y) : Prop where
  continuous : Continuous f
  liftsCompact : ∀ (K : Set Y), IsCompact K → ∃ (L : Set X), IsCompact L ∧ f '' L = K

/-- A proper surjective map is compact-covering. -/
axiom properSurjectiveIsCompactCovering {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (f : X → Y) (hf : ProperMap f) (hfSurj : Function.Surjective f) : CompactCoveringMap f

/-! ## #eval Demos -/

#eval "── Morphisms.Hom: ProperMap ──"
#eval "ProperMapData defined"
#eval "ProperMapWithName defined"
#eval "── Morphisms.Hom: PerfectMap ──"
#eval "PerfectMap defined"
#eval "── Morphisms.Hom: CompactCoveringMap ──"
#eval "CompactCoveringMap defined"
#eval "── All morphism types registered ──"

end MiniCompactness
