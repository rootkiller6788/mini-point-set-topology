/-
# MiniTopologicalConstructions

The topological constructions sub-package — defines product topologies,
quotient topologies, wedge sums, smash products, joins, cones, suspensions,
mapping cylinders/cones, telescopes, limits, and colimits in Top.

## Sub-packages
- `Core`         — ProductTopology, BoxTopology, QuotientTopology, AdjunctionSpace,
                    WedgeSum, SmashProduct, Join, Cone, Suspension, ReducedSuspension,
                    MappingCylinder, MappingCone, Telescope, DirectLimit, InverseLimit,
                    SequentialColimit
- `Morphisms`    — ConstructionMap, Cofibration (HEP), Fibration (HLP),
                    Homeomorphism, HomotopyEquivalence
- `Constructions` — Box vs product topology, Group action quotient, Equalizer/Coequalizer,
                    Limits and colimits in Top
- `Properties`   — Homology/cohomology relations, Homotopy type preservation,
                    Classification of cofibrations/fibrations
- `Theorems`     — ΣS^n ≅ S^{n+1}, CX contractible, mapping cylinder ≃ codomain,
                    Puppe sequence, Freudenthal suspension
- `Examples`     — ΣS¹≅S², cone over S¹≅D², wedge S¹∨S¹, box topology counterexamples
- `Bridges`      — ToAlgebra, ToTopology, ToGeometry, ToComputation
-/

import MiniTopologicalConstructions.Core.Basic
import MiniTopologicalConstructions.Core.Objects
import MiniTopologicalConstructions.Core.Laws
import MiniTopologicalConstructions.Morphisms.Hom
import MiniTopologicalConstructions.Morphisms.Iso
import MiniTopologicalConstructions.Morphisms.Equiv
import MiniTopologicalConstructions.Constructions.Products
import MiniTopologicalConstructions.Constructions.Quotients
import MiniTopologicalConstructions.Constructions.Subobjects
import MiniTopologicalConstructions.Constructions.Universal
import MiniTopologicalConstructions.Properties.Invariants
import MiniTopologicalConstructions.Properties.Preservation
import MiniTopologicalConstructions.Properties.ClassificationData
import MiniTopologicalConstructions.Theorems.Basic
import MiniTopologicalConstructions.Theorems.Classification
import MiniTopologicalConstructions.Theorems.Main
import MiniTopologicalConstructions.Theorems.UniversalProperties
import MiniTopologicalConstructions.Examples.Standard
import MiniTopologicalConstructions.Examples.Counterexamples
import MiniTopologicalConstructions.Bridges.ToAlgebra
import MiniTopologicalConstructions.Bridges.ToTopology
import MiniTopologicalConstructions.Bridges.ToGeometry
import MiniTopologicalConstructions.Bridges.ToComputation
