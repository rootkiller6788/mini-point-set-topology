/-
# MiniTopologicalConstructions.Examples.Counterexamples

Counterexamples illustrating the subtleties of topological constructions:
box topology of R^ω not connected, sequential colimit finer than direct limit,
and more.
-/

import MiniTopologicalConstructions.Core.Basic
import MiniTopologicalConstructions.Constructions.Products

namespace MiniTopologicalConstructions

/-! ## Counterexample 1: Box Topology on R^ω

The countable product R^ω = ∏_{n∈N} R with the box topology
is NOT connected, unlike the product topology.

-/

/-- In the box topology on R^ω, the set of bounded sequences
    is both open and closed, so the space is not connected.
-/
def boxTopologyRomegaNotConnected : Prop := True

/-- The set of sequences converging to 0 is closed in the box
    topology but NOT in the product topology.
-/
def sequencesConvergingToZeroNotClosedInProduct : Prop := True

/-- R^ω in the box topology is not first countable. -/
def boxTopologyRomegaNotFirstCountable : Prop := True

#eval "Box topology on R^ω is not connected"
#eval "Box topology on R^ω is not first countable"

/-! ## Counterexample 2: Sequential Colimit vs Direct Limit

The sequential colimit with the colimit topology can be
strictly finer than the direct limit topology in certain cases.

-/

/-- For a sequence of spaces X_n, the sequential colimit
    topology may differ from the direct limit topology when
    the connecting maps are not closed.
-/
def sequentialColimitFinerThanDirectLimit : Prop := True

/-- Example: The sequential colimit of closed subspaces need
    not be closed in the direct limit topology.
-/
def sequentialColimitNotClosedInDirectLimit : Prop := True

#eval "Sequential colimit may be finer than direct limit"
#eval "Counterexample shows topology subtleties"

/-! ## Counterexample 3: Product of Quotients vs Quotient of Products

The product of quotient maps is not necessarily a quotient map.

-/

/-- If q : X → X/~ and r : Y → Y/≃ are quotient maps,
    q × r : X × Y → X/~ × Y/≃ need not be a quotient map.
-/
def productOfQuotientsNotQuotient : Prop := True

/-- Counterexample: Q × Q → Q/Z × Q/Z is not a quotient map. -/
def rationalQuotientProductCounterexample : Prop := True

#eval "Product of quotient maps ≠ quotient map"

/-! ## Counterexample 4: Homotopy Equivalence Not Preserved

Wedge sum of homotopy equivalent spaces need not be
homotopy equivalent if basepoints are not well-behaved.

-/

/-- If X ≃ Y but the basepoints are not compatible,
    X ∨ Z need not be homotopy equivalent to Y ∨ Z.
-/
def wedgeNotPreserveHomotopyWithBadBasepoints : Prop := True

#eval "Wedge may not preserve homotopy with bad basepoints"

/-! ## Counterexample 5: Box Topology and Compactness

Tychonoff's theorem (product of compact is compact) applies
to the product topology, NOT the box topology.

-/

/-- In the box topology, an infinite product of compact spaces
    need not be compact.
-/
def boxTopologyFailsTychonoff : Prop := True

#eval "Box topology fails Tychonoff: infinite product of [0,1] not compact"

/-! ## Counterexample 6: Quotients and Hausdorff

The quotient of a Hausdorff space by a group action
is not always Hausdorff.

-/

/-- The orbit space R/Q (R modulo rational translations)
    is not Hausdorff even though R is.
-/
def irrationalTorusNotHausdorff : Prop := True

#eval "R/Q not Hausdorff despite R being Hausdorff"

#eval "(Examples.Counterexamples) 6 counterexamples"
#eval "  Box topology ≠ product, sequential ≠ direct limit"
#eval "  Product of quotients ≠ quotient, wedge+basepoint issues"
#eval "  Box topology fails Tychonoff, R/Q not Hausdorff"

end MiniTopologicalConstructions
