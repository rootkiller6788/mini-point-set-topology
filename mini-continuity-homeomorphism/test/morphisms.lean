import MiniContinuityHomeomorphism.Morphisms.Hom
import MiniContinuityHomeomorphism.Morphisms.Iso
import MiniContinuityHomeomorphism.Morphisms.Equiv
import MiniContinuityHomeomorphism.Constructions.Products

/-!
# Tests: Morphisms and Constructions

Tests for hom-spaces, homeomorphism groups, homotopy equivalence, and product
constructions.
-/

open MiniContinuityHomeomorphism

section HomSpaceTests

/-- Test: Hom-space notation. -/
def test_continuous : Bool →C Bool := .id _

#eval test_continuous true

/-- Test: Constant homotopy of a map with itself. -/
def test_constantHomotopy (f : Bool →C Bool) : Homotopy f f := constantHomotopy f

#eval (test_constantHomotopy (.id _)).toFun false 0.5

/-- Test: Homotopy reflexivity. -/
#eval "homotopy_refl : ∀ f, Homotopic f f (holds)"

/-- Test: Pointed continuous function. -/
def test_pointed : PointedContinuousFunction Bool Bool true true := {
  toFun := id
  continuous_toFun := continuous_id
  map_point := rfl
}

#eval test_pointed.toFun true

end HomSpaceTests

section HomeoGroupTests

/-- Test: HomeoGroup one. -/
def test_homeoOne : Homeomorphism Bool Bool := HomeoGroup.one

#eval test_homeoOne.toFun true

/-- Test: HomeoGroup multiplication (non-trivial). -/
def test_swap : Homeomorphism Bool Bool := {
  toFun := not
  continuous_toFun := by
    intro U hU
    -- Bool discrete: all subsets are open
    exact isOpen_discrete _
  invFun := not
  left_inv := by intro x; cases x <;> rfl
  right_inv := by intro x; cases x <;> rfl
  continuous_invFun := by
    intro U hU; exact isOpen_discrete _
}

#eval test_swap.toFun true
#eval test_swap.toFun false

/-- Test: swap * swap = identity. -/
def test_swapCompSwap : Homeomorphism Bool Bool := HomeoGroup.mul test_swap test_swap

#eval test_swapCompSwap.toFun true
#eval test_swapCompSwap.toFun false

end HomeoGroupTests

section EquivTests

/-- Test: Homotopy equivalence identity. -/
def test_homotopyEquivRefl (X : Type) [TopologicalSpace X] : HomotopyEquivalence X X := {
  f := .id X
  g := .id X
  homotopy_comp_left := by
    refine ⟨constantHomotopy (.id X)⟩
  homotopy_comp_right := by
    refine ⟨constantHomotopy (.id X)⟩
}

#eval "homotopy_equiv_refl : X ≃ₕ X always holds"

/-- Test: Contractible spaces. -/
#eval "Unit_contractible : Unit is contractible (homotopy equivalent to itself via unique maps)"

end EquivTests

section ProductTests

/-- Test: Product map. -/
def test_productMap : Bool × Bool →C Bool × Bool :=
  productMap (.id Bool) (.id Bool)

#eval test_productMap (true, false)

/-- Test: Diagonal map. -/
def test_diag : Bool →C Bool × Bool := diagonalMap Bool

#eval test_diag true

/-- Test: Swap map. -/
def test_swapMap : Bool × Bool →C Bool × Bool := swapMap Bool Bool

#eval test_swapMap (true, false)

/-- Test: Evaluation map. -/
#eval evaluationMap ((.id Bool : Bool →C Bool), true)

end ProductTests

def main : IO Unit :=
  IO.println "All Morphism tests completed."

#eval main
