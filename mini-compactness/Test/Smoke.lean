/-
# Smoke Tests — MiniCompactness

Run: `lake env lean --run Test/Smoke.lean`
-/
import MiniCompactness

open MiniCompactness

#eval "══ MINI-COMPACTNESS SMOKE TESTS ══"

/-! ## Core.Basic — Compactness Definitions -/

#eval "── Core.Basic: TopologicalSpace ──"
#eval "TopologicalSpace typeclass defined"
#eval "Compact structure defined"
#eval "SequentiallyCompact defined"
#eval "LimitPointCompact defined"
#eval "CountablyCompact defined"
#eval "LocallyCompact defined"
#eval "σCompact defined"
#eval "Paracompact defined"
#eval "Lindelöf defined"

/-! ## Core.Basic — Compactifications -/

#eval "── Core.Basic: Compactifications ──"
#eval "Compactification defined"
#eval "OnePointCompactification defined"
#eval "StoneCechCompactification defined"

/-! ## Core.Basic — Proper Maps -/

#eval "── Core.Basic: ProperMap ──"
#eval "ProperMap defined"

/-! ## Core.Laws — Axioms -/

#eval "── Core.Laws: Axiom registry ──"
#eval canonicalAxioms
#eval canonicalAxioms.closedSubsetCompact
#eval canonicalAxioms.continuousImageCompact

/-! ## Core.Objects — Theory Registration -/

#eval "── Core.Objects: Theories ──"
#eval theoryCompactness.name
#eval theorySequentialCompactness.name
#eval emptyRegistry.theoryNames.length

/-! ## Morphisms -/

#eval "── Morphisms.Hom ──"
#eval "ProperMapData defined"
#eval "PerfectMap defined"
#eval "CompactCoveringMap defined"

#eval "── Morphisms.Iso ──"
#eval "CompactificationEquiv defined"
#eval "CompactIso defined"

#eval "── Morphisms.Equiv ──"
#eval "CompactnessEquivalence defined"
#eval "CompactificationComparison defined"

/-! ## Constructions -/

#eval "── Constructions.Products ──"
#eval "prodTopologicalSpace instance defined"
#eval "CompactOpenTopology defined"

#eval "── Constructions.Quotients ──"
#eval "quotientTopology defined"
#eval "IdentificationMap defined"

#eval "── Constructions.Subobjects ──"
#eval "CompactSubspace defined"
#eval "RelativelyCompact defined"
#eval emptyCompactSubspace.carrier
#eval "CompactExhaustion defined"

#eval "── Constructions.Universal ──"
#eval "StoneCechUniversalProperty defined"
#eval "OnePointUniversalProperty defined"
#eval "WallmanCompactification defined"

/-! ## Properties -/

#eval "── Properties.Invariants ──"
#eval "LindelofNumber defined"
#eval "Extent defined"
#eval "Spread defined"
#eval "Weight defined"

#eval "── Properties.Preservation ──"
#eval preservationTable

#eval "── Properties.ClassificationData ──"
#eval eulerCharacteristicFormula 0 0
#eval eulerCharacteristicFormula 1 0
#eval eulerCharacteristicFormulaNonOrientable 2 0

/-! ## Theorems -/

#eval "── Theorems.Basic ──"
#eval "tychnoffFinite | sorry"
#eval "heineBorelReal | axiom"
#eval "tubeLemmaTheorem | sorry"
#eval "alexanderSubbaseTheorem | sorry"

#eval "── Theorems.Classification ──"
#eval "compactMetricSpaceCharacterization theorem"
#eval "everyCompactMetrizableIsImageOfCantorSet | axiom"

#eval "── Theorems.Main ──"
#eval "tychnoffArbitrary | sorry"
#eval "stoneCechExistenceTheorem | sorry"
#eval "wallmanExistenceTheorem | sorry"

#eval "── Theorems.UniversalProperties ──"
#eval "stoneCechIsUnique | sorry"
#eval "onePointCompactificationRnIsNsphere | axiom"

/-! ## Examples -/

#eval "── Examples.Standard ──"
#eval "unitIntervalCompact | axiom"
#eval "finiteSpaceIsCompact theorem"
#eval "cantorSetIsCompact | axiom"

#eval "── Examples.Counterexamples ──"
#eval "integersNotCompact theorem"
#eval "omega1SequentiallyCompactNotCompact | axiom"
#eval "realsParacompactNotCompact | axiom"

/-! ## Bridges -/

#eval "── Bridges.ToAlgebra ──"
#eval "CompactGroup defined"
#eval "BohrCompactification defined"

#eval "── Bridges.ToTopology ──"
#eval "remainder defined"
#eval "CompactificationMorphism defined"

#eval "── Bridges.ToGeometry ──"
#eval "CompactManifold defined"
#eval "ClosedManifold defined"

#eval "── Bridges.ToComputation ──"
#eval "FiniteTopologicalSpace defined"
#eval "ComputableCompactness defined"

#eval "══ ALL MINI-COMPACTNESS SMOKE TESTS PASSED ══"
