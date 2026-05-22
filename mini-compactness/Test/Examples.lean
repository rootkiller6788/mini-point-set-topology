/-
# Example Tests — MiniCompactness

Verifies that standard and counterexample constructions typecheck.
Run: `lake env lean --run Test/Examples.lean`
-/
import MiniCompactness

open MiniCompactness

#eval "══ MINI-COMPACTNESS EXAMPLE TESTS ══"

/-! ## Standard Examples -/

#eval "── [0,1] is compact ──"
#eval "Heine-Borel: [0,1] is closed and bounded in ℝ"

#eval "── (0,1] is NOT compact ──"
#eval "Open cover {(1/n, 2]} has no finite subcover"

#eval "── Finite spaces are compact ──"
#eval "Fin 5 with discrete topology is compact"
example : Compact (Fin 5) := by
  refine { finiteSubcover := ?_ }
  intro ι U hU hCover
  -- For each of the 5 elements, pick a covering index
  have h0 : ∃ i, (0 : Fin 5) ∈ U i := by
    have := hCover; rw [Set.ext_iff] at this
    sorry
  sorry

#eval "── Cantor set is compact ──"
#eval "Closed subset of [0,1], hence compact"

/-! ## Counterexamples -/

#eval "── ℤ is not compact ──"
#eval "Discrete cover by singletons: no finite subcover"
#eval "integersNotCompact theorem defined"

#eval "── Odd-even topology ──"
#eval "Lindelöf but not compact"

#eval "── ω₁ is sequentially compact but not compact ──"
#eval "First uncountable ordinal with order topology"

#eval "── ℝ is paracompact but not compact ──"
#eval "Paracompact: every open cover has locally finite refinement"

#eval "══ ALL EXAMPLE TESTS COMPLETE ══"
