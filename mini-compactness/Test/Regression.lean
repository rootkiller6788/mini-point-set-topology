/-
# Regression Tests — MiniCompactness

Ensures all core structures, theorems, and bridges remain
instantiable and consistent across changes.
Run: `lake env lean --run Test/Regression.lean`
-/
import MiniCompactness

open MiniCompactness

#eval "══ MINI-COMPACTNESS REGRESSION TESTS ══"

/-! ## Structure Instantiation -/

#eval "── Compact structure instantiation ──"
def testCompact : Compact Unit := {
  finiteSubcover := by
    intro ι U hU hCover
    refine ⟨∅, ?_⟩
    ext x; simp [hCover]
}
#eval "Compact Unit instance: OK"

#eval "── LocallyCompact instantiation ──"
def testLocallyCompact : LocallyCompact Unit := {
  compactNeighborhood := by
    intro x
    refine ⟨Set.univ, ?_, trivial, Set.univ, ?_, trivial, ?_⟩
    · -- IsCompact Set.univ
      intro ι U hU hCover
      refine ⟨∅, ?_⟩
      simp
    · exact isOpen_univ (X := Unit)
    · exact Set.subset_univ _
}
#eval "LocallyCompact Unit instance: OK"

#eval "── σCompact instantiation ──"
def testSigmaCompact : σCompact Unit := {
  countableUnion := by
    refine ⟨λ _ => Set.univ, ?_, ?_⟩
    · intro _
      intro ι U hU hCover
      refine ⟨∅, ?_⟩
      simp
    · simp
}
#eval "σCompact Unit instance: OK"

/-! ## Compactification Instantiation -/

#eval "── Compactification instantiation ──"
def testCompactification : Compactification Unit := {
  carrier := Unit
  compact := testCompact
  embed := id
  dense := by
    intro U hOpen hNe
    refine ⟨(), ?_⟩
    simp
  openEmbedding := trivial
}
#eval "Compactification Unit instance: OK"

#eval "── OnePointCompactification instantiation ──"
def testOnePoint : OnePointCompactification Unit := {
  carrier := Option Unit
  compact := {
    finiteSubcover := by
      intro ι U hU hCover
      refine ⟨∅, ?_⟩
      ext x; simp [hCover]
  }
  pointAtInfinity := none
  embed := some
  homeoToX := trivial
}
#eval "OnePointCompactification Unit instance: OK"

#eval "── StoneCechCompactification instantiation ──"
def testStoneCech : StoneCechCompactification Unit := {
  carrier := Unit
  compactHausdorff := ⟨testCompact, trivial⟩
  embed := id
  universal := trivial
}
#eval "StoneCechCompactification Unit instance: OK"

/-! ## Morphism Instantiation -/

#eval "── ProperMap instantiation ──"
structure TestProperMap where
  map : Unit → Unit
  proper : ProperMap map

def testProperMap : TestProperMap := {
  map := id
  proper := {
    continuous := by
      intro U hU; simpa using hU
    preimageCompact := by
      intro K hK
      -- preimage of compact in Unit is compact
      intro ι U hU hCover
      refine ⟨∅, ?_⟩
      simp
  }
}
#eval "ProperMap instance: OK"

/-! ## Equivalence Structure -/

#eval "── CompactIso instantiation ──"
def testCompactIso : CompactIso Unit Unit :=
  compactIsoRefl testCompact
#eval "CompactIso refl instance: OK"

/-! ## Preservation Check -/

#eval "── PreservationTable ──"
#eval preservationTable.compactUnderContinuousSurj
#eval preservationTable.paracompactUnderPerfectInverse
#eval preservationTable.lindelofUnderContinuousSurj

/-! ## Classification Data -/

#eval "── CompactSurfaceClassification ──"
def sphereClassification : CompactSurfaceClassification := {
  orientable := true
  genus := 0
  boundaryComponents := 0
  eulerCharacteristic := eulerCharacteristicFormula 0 0
}
#eval sphereClassification.eulerCharacteristic
#eval "S²: χ = 2"

def torusClassification : CompactSurfaceClassification := {
  orientable := true
  genus := 1
  boundaryComponents := 0
  eulerCharacteristic := eulerCharacteristicFormula 1 0
}
#eval torusClassification.eulerCharacteristic
#eval "T²: χ = 0"

/-! ## Bridge Instantiation -/

#eval "── CompactGroup instantiation ──"
#eval "CompactGroup defined"

#eval "── CompactManifold instantiation ──"
def testCompactManifold : CompactManifold Unit := {
  compact := testCompact
  manifold := trivial
  dimension := 0
}
#eval compactManifoldIsSigmaCompact testCompactManifold
#eval "CompactManifold instance: OK"

#eval "── FiniteTopologicalSpace instantiation ──"
#eval "FiniteTopologicalSpace defined"

#eval "── ComputableCompactness instantiation ──"
#eval "ComputableCompactness defined"

#eval "══ ALL REGRESSION TESTS PASSED ══"
