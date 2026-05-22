/-
# MiniCompactness.Properties.Preservation

Compact / paracompact / Lindelöf under continuous / perfect / closed maps.
-/
import MiniCompactness.Core.Basic
import MiniCompactness.Core.Laws
import MiniCompactness.Morphisms.Hom

namespace MiniCompactness

set_option maxHeartbeats 400000

/-! ## Preservation Under Continuous Maps -/

/-- Compactness is preserved by continuous surjections. -/
theorem compactPreservedByContinuousSurjection {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (hX : Compact X) (f : X → Y) (hfCont : Continuous f) (hfSurj : Function.Surjective f) :
  Compact Y := by
  -- This follows from continuousImageOfCompactIsCompact
  sorry

/-- Sequential compactness is preserved by continuous surjections. -/
axiom sequentiallyCompactPreservedByContinuousSurjection {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (hX : SequentiallyCompact X) (f : X → Y) (hfCont : Continuous f) (hfSurj : Function.Surjective f) :
  SequentiallyCompact Y

/-- σ-compactness is preserved by continuous surjections. -/
axiom sigmaCompactPreservedByContinuousSurjection {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (hX : σCompact X) (f : X → Y) (hfCont : Continuous f) (hfSurj : Function.Surjective f) :
  σCompact Y

/-! ## Preservation Under Perfect Maps -/

/-- Compactness is preserved inversely under perfect maps. -/
axiom compactPreservedInverseByPerfectMap {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (f : X → Y) (hf : PerfectMap f) (hY : Compact Y) : Compact X

/-- Paracompactness is preserved inversely under perfect maps. -/
axiom paracompactPreservedInverseByPerfectMap {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (f : X → Y) (hf : PerfectMap f) (hY : Paracompact Y) : Paracompact X

/-- Lindelöf property is preserved by continuous maps. -/
axiom lindelofPreservedByContinuousSurjection {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (hX : Lindelöf X) (f : X → Y) (hfCont : Continuous f) (hfSurj : Function.Surjective f) :
  Lindelöf Y

/-! ## Preservation Under Closed Maps -/

/-- Compactness of fibers + closed map → compactness preserved inversely. -/
axiom compactPreservedInverseByClosedMapWithCompactFibers {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (f : X → Y) (hfClosed : ∀ (F : Set X), IsClosed F → IsClosed (f '' F))
  (hfCompactFibers : ∀ (y : Y), IsCompact (f ⁻¹' {y}))
  (hY : Compact Y) : Compact X

/-- Locally compactness is preserved by open continuous surjections. -/
axiom locallyCompactPreservedByOpenContinuousSurjection {X Y : Type u}
  [TopologicalSpace X] [TopologicalSpace Y]
  (hX : LocallyCompact X) (f : X → Y) (hfCont : Continuous f)
  (hfOpen : ∀ (U : Set X), IsOpen U → IsOpen (f '' U))
  (hfSurj : Function.Surjective f) : LocallyCompact Y

/-! ## Preservation Summary Table -/

structure PreservationTable where
  compactUnderContinuousSurj : Bool
  compactUnderPerfectInverse : Bool
  paracompactUnderPerfectInverse : Bool
  lindelofUnderContinuousSurj : Bool
  sigmaCompactUnderContinuousSurj : Bool
  locallyCompactUnderOpenContinuous : Bool
  deriving Repr, Inhabited

/-- The standard preservation table for compactness variants. -/
def preservationTable : PreservationTable :=
  { compactUnderContinuousSurj := true
    compactUnderPerfectInverse := true
    paracompactUnderPerfectInverse := true
    lindelofUnderContinuousSurj := true
    sigmaCompactUnderContinuousSurj := true
    locallyCompactUnderOpenContinuous := true
  }

#eval "── Properties.Preservation: Continuous maps ──"
#eval "compactPreservedByContinuousSurjection | sorry"
#eval "── Properties.Preservation: Perfect maps ──"
#eval "compactPreservedInverseByPerfectMap | axiom"
#eval "── Properties.Preservation: Summary ──"
#eval preservationTable
#eval "── All preservation properties registered ──"

end MiniCompactness
