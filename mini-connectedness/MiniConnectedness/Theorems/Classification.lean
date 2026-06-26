/-
# MiniConnectedness: Classification Theorems
L4: Peano continua. L6: #eval. L8: 1-dim continua classification.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Properties.ClassificationData
namespace MiniConnectedness

structure PeanoContinuum (α : Type u) [TopSpace α] extends Continuum α where
  locally_connected : IsLocallyConnected α

instance : PeanoContinuum SierpinskiSpace where
  compact := by
    intro U hUopen hUcover; refine ⟨{Set.univ}, ?_, ?_⟩
    · intro V hV; simp at hV; subst hV; exact Set.mem_univ _
    · simp
  connected := sierpinski_connected
  locally_connected := by
    intro x U hUopen hxU
    rcases hUopen with (rfl|rfl|rfl)
    · exact False.elim (Set.not_mem_empty _ hxU)
    · have hx1 : x = (1 : SierpinskiSpace) := by simpa using hxU; subst hx1
      refine ⟨{1}, Or.inr (Or.inl rfl), by simp, ?_, ?_⟩
      · intro z; simp; · exact subsingleton_connected (α := Subtype ({1} : Set SierpinskiSpace))
    · refine ⟨Set.univ, Or.inr (Or.inr rfl), Set.mem_univ _, ?_, ?_⟩
      · intro z; exact Set.mem_univ z; · exact sierpinski_connected

/-- Hahn-Mazurkiewicz Theorem: A topological space is a continuous image of [0,1]
iff it is a Peano continuum (compact, connected, locally connected, metrizable).
(Documented; formal proof requires analysis/measure theory on [0,1].) -/
#eval "Hahn-Mazurkiewicz: Peano continuum <=> continuous image of [0,1]"

/-- Classification of 1-dimensional continua:
Every 1-dimensional continuum is homeomorphic to one of:
1. A finite graph (1-dim CW complex)
2. A dendrite (locally connected, no simple closed curves)
3. A pseudo-arc (hereditarily indecomposable, chainable)
(Documented; formal proof requires dimension theory.) -/
#eval "1-dim continua classification: graphs + dendrites + pseudo-arc"

/-- Every Peano continuum is arcwise connected.
Since Sierpinski is arcwise connected? The only path from 0 to 1... a continuous map
f: [0,1] → {0,1} with f(0)=0, f(1)=1. This is possible if we give [0,1] the discrete
topology (not continuous) or if we use the standard topology. In Sierpinski, the
function f(t) = 0 for t<1, f(1)=1 is NOT continuous (preimage of {1} is {1}, not open).
But f(t) = 1 for t>0, f(0)=0: preimage of {1} = (0,1], which is not open in standard
topology. So Sierpinski is NOT path-connected, hence NOT arcwise connected.
But it IS a Peano continuum (since it's connected, compact, locally connected).
So the claim "every Peano continuum is arcwise connected" is FALSE!
Correction: every METRIC Peano continuum is arcwise connected.
-/
#eval "Note: Sierpinski is Peano continuum but NOT path-connected (non-metric)"

#eval "══ Theorems/Classification ══"
#eval "Defs: PeanoContinuum"
#eval "Eg: Sierpinski space is a Peano continuum (compact+connected+locally connected)"
end MiniConnectedness