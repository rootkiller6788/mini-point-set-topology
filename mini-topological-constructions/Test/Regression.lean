/-
# Regression Tests -- MiniTopologicalConstructions

Regression tests ensuring no breaking changes across all modules.
-/

import MiniTopologicalConstructions

open MiniTopologicalConstructions

/-! ## Core.Basic Definitions Exist -/

#check Topology Unit
#check TopSpace Unit
#check ProductTopology (fun (_ : Unit) => (by
  refine { carrier := Unit, topology := ⟨fun _ => True, by sorry, by sorry, by sorry, by sorry⟩ } : TopSpace Unit))
#check BoxTopology
#check QuotientTopology
#check AdjunctionSpace
#check WedgeSum
#check SmashProduct
#check Join
#check Cone
#check Suspension
#check ReducedSuspension
#check MappingCylinder
#check MappingCone
#check Telescope
#check DirectLimit
#check InverseLimit
#check SequentialColimit

#eval "── Core.Basic: All 16 construction types exist ──"

/-! ## Core.Laws Definitions Exist -/

#check coneOfConeIsoSuspension
#check joinAssoc
#check prodSmashAdjunction
#check mappingCylinderDeformationRetract
#check wedgeSumIsCoproduct
#check smashCommutative
#check smashS1IsSuspension
#check directLimitUniversal
#check inverseLimitUniversal

#eval "── Core.Laws: All axiom values exist ──"

/-! ## Morphisms Definitions Exist -/

#check ConstructionMap
#check constructionMapId
#check constructionMapComp
#check Cofibration
#check Fibration
#check ConstructionHomeo
#check constructionHomeoId
#check Homotopy
#check HomotopyEquivalence

#eval "── Morphisms: All types defined ──"

/-! ## Constructions Definitions Exist -/

#check Equalizer
#check Coequalizer
#check Pullback
#check Pushout
#check GroupAction
#check orbitSpace
#check HomogeneousSpace
#check PushoutSquare
#check PullbackSquare
#check Limit
#check Colimit

#eval "── Constructions: All types defined ──"

/-! ## Properties Definitions Exist -/

#check Homology
#check Cohomology
#check FundamentalGroup
#check tychonoffTheorem
#check NDRPair
#check HurewiczFibration
#check SerreFibration

#eval "── Properties: All types defined ──"

/-! ## Theorems Statements Exist -/

#check suspensionSphereIsNextSphere
#check coneIsContractible
#check mappingCylinderHomotopyEquivalentCodomain
#check puppeSequence
#check cofibrationIffNDRPair
#check freudenthalSuspension
#check pushoutUniversalProperty
#check pullbackUniversalProperty

#eval "── Theorems: All theorems stated ──"

/-! ## Examples Exist -/

#check boxTopologyRomegaNotConnected
#check sequentialColimitFinerThanDirectLimit

#eval "── Examples: Standard and counterexamples exist ──"

/-! ## Bridges Exist -/

#check FreeTopologicalGroup
#check HomotopyCategory
#check Surgery
#check FiniteTopSpace

#eval "── Bridges: All bridge types exist ──"

/-! ## All Regression Checks Passed -/

#eval "══ REGRESSION: ALL DEFINITIONS EXIST ACROSS 23 MODULES ══"
