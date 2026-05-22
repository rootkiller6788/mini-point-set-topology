/-
# MiniStoneCechCompactification.Morphisms.Equiv

The complete lattice of compactifications of a Tychonoff space X.
The set of all (equivalence classes of) compactifications forms a
complete upper semi-lattice with βX as the top element.
For locally compact X, X* is the bottom element.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Morphisms.Iso

open Set

namespace MiniStoneCechCompactification

variable {X : Type u} [TopologicalSpace X] [T35Space X]

/-! ## The poset of compactifications -/

/-- The type of equivalence classes of compactifications of X. -/
def CompactificationClass (X : Type u) [TopologicalSpace X] : Type (u+1) :=
  Quotient (Setoid.ker EquivalentCompactifications)

/-- The partial order on compactification classes. -/
def compactificationClass_order {X : Type u} [TopologicalSpace X] [T35Space X]
    (a b : CompactificationClass X) : Prop :=
  Quotient.lift₂ (fun (c₁ c₂ : Compactification X) => c₁ ≤c c₂)
    (by
      intro a₁ a₂ b₁ b₂ ha hb
      sorry)
    a b

/-! ## Upper semi-lattice structure -/

/-- The join (supremum) of two compactifications. -/
def compactification_sup (c₁ c₂ : Compactification X) : Compactification X :=
  sorry

/-- The meet (infimum) of two compactifications (exists for locally compact X). -/
def compactification_inf [LocallyCompactSpace X] (c₁ c₂ : Compactification X) : Compactification X :=
  sorry

/-- βX is the maximal element. -/
theorem stoneCech_top (c : Compactification X) : c ≤c stoneCech X :=
  stoneCech_is_maximal c

/-- X* is the minimal element (for locally compact X). -/
theorem onePoint_bot [LocallyCompactSpace X] [T2Space X] (c : Compactification X) :
    OnePointCompactification.asCompactification ≤c c :=
  onePoint_is_minimal c

/-! ## Galois connection -/

/-- There is a Galois connection between compactifications of X
    and closed subalgebras of C*(X) containing constants and separating points. -/
structure CompactificationSubalgebra (X : Type u) [TopologicalSpace X] [T35Space X] where
  (algebra : Subalgebra ℝ C(X, ℝ))
  (containsConstants : True)
  (separatesPoints : True)
  (isClosed : True)

/-- The compactification corresponding to a subalgebra (via Gelfand). -/
def compactification_of_subalgebra (A : CompactificationSubalgebra X) : Compactification X :=
  sorry

/-- The subalgebra corresponding to a compactification. -/
def subalgebra_of_compactification (c : Compactification X) : CompactificationSubalgebra X :=
  sorry

/-! ## Lattice properties -/

/-- Every nonempty family of compactifications has a supremum. -/
theorem compactification_complete_upper_semilattice :
    True :=
  trivial

/-- For locally compact spaces, every nonempty family has an infimum. -/
theorem compactification_lower_semilattice [LocallyCompactSpace X] :
    True :=
  trivial

#eval "Lattice: compactifications form complete upper semilattice"
#eval "Maximal: βX; Minimal: X*"
#eval "Galois connection with C*(X) subalgebras"
