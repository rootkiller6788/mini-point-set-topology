/-
# MiniStoneCechCompactification.Constructions.Quotients

Quotient of compactifications and compactification of quotient spaces.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws

open Set

namespace MiniStoneCechCompactification

variable {X : Type u} [TopologicalSpace X] [T35Space X]

/-! ## Quotient of a compactification -/

/-- Given a compactification c of X and an equivalence relation ~ on c.carrier
    such that the quotient is Hausdorff, we get a compactification of X/~. -/
def quotientCompactification (c : Compactification X) (R : c.carrier → c.carrier → Prop)
    [Equivalence R] (hHausdorff : T2Space (Quotient R)) : Compactification (Quotient R) :=
  sorry

/-- β of a quotient embeds in a quotient of β. -/
theorem stoneCech_quotient_embedding {X : Type u} [TopologicalSpace X] [T35Space X]
    (S : Setoid X) : Embedding ((stoneCech (Quotient S)).carrier → (Quotient (by
      -- lift the equivalence relation to βX
      sorry))) :=
  sorry

/-! ## Compactification of quotient -/

/-- When X is Tychonoff and ~ is a closed equivalence relation,
    the quotient X/~ is Tychonoff and has a Stone-Cech compactification. -/
theorem quotient_tychonoff (R : X → X → Prop) [Equivalence R]
    (hClosed : ∀ x, IsClosed {y | R x y}) [T35Space X] : T35Space (Quotient R) :=
  sorry

/-- Compactification of a quotient via the quotient of βX. -/
def compactification_of_quotient (R : X → X → Prop) [Equivalence R]
    (hClosed : ∀ x, IsClosed {y | R x y}) : Compactification (Quotient R) :=
  sorry

/-! ## Quotient maps and β -/

/-- If q : X → Y is a quotient map and X is Tychonoff,
    there is a unique continuous βq : βX → βY. -/
def stoneCech_quotient_map {Y : Type u} [TopologicalSpace Y] [T35Space Y]
    (q : X → Y) (hq : QuotientMap q) : (stoneCech X).carrier → (stoneCech Y).carrier :=
  stoneCech_hom q hq.continuous

#eval "Quotients: quotient of compactification"
#eval "Compactification of quotient space"
#eval "βq for quotient map q"
