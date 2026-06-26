/-
# MiniConnectedness: Counterexamples
L6: #eval verified counterexamples showing boundaries of connectedness concepts:
connected not path-connected, locally connected not connected, etc.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Examples.Standard
namespace MiniConnectedness

/-- In the discrete 2-point space: locally connected but NOT connected. -/
example : ∃ (α : Type) [TopSpace α], IsLocallyConnected α ∧ ¬ IsConnected α := by
  refine ⟨Fin 2, by infer_instance, ?_, ?_⟩
  · -- Locally connected: in discrete topology, {x} is a connected open nbd of x
    intro x U hUopen hxU
    refine ⟨{x}, trivial, by simp, ?_, ?_⟩
    · intro z hz; simp at hz; subst hz; exact hxU
    · intro hsep; rcases hsep with ⟨U', V', _, _, hdisj, _, hUne, hVne⟩
      have hxU' : x ∈ U' := by
        have hne : (U' ∩ {x}) ≠ ∅ := hUne; rcases Set.not_eq_empty.mp hne with ⟨z, hzU', hzS⟩; simp at hzS; subst hzS; exact hzU'
      have hxV' : x ∈ V' := by
        have hne : (V' ∩ {x}) ≠ ∅ := hVne; rcases Set.not_eq_empty.mp hne with ⟨z, hzV', hzS⟩; simp at hzS; subst hzS; exact hzV'
      have : x ∈ (U' ∩ {x}) ∩ (V' ∩ {x}) := ⟨⟨hxU', by simp⟩, ⟨hxV', by simp⟩⟩
      rw [hdisj] at this; exact Set.not_mem_empty _ this
  · -- NOT connected: {0} and {1} are a separation
    intro h; apply h
    refine ⟨{0}, {1}, trivial, trivial, ?_, ?_, ?_, ?_⟩
    · ext x; fin_cases x <;> simp; · ext x; fin_cases x <;> simp
    · exact Set.Nonempty.ne_empty ⟨0, by simp⟩; · exact Set.Nonempty.ne_empty ⟨1, by simp⟩

-- Sierpinski space IS locally connected (verified below). For a genuine "connected but not
-- locally connected" example, one needs the topologist's sine curve or a 3-point Alexandrov
-- chain space, which require additional topology constructions beyond current scope.
example : IsLocallyConnected SierpinskiSpace := by
  intro x U hUopen hxU
  rcases hUopen with (rfl|rfl|rfl)
  · exact False.elim (Set.not_mem_empty _ hxU)
  · have hx1 : x = (1 : SierpinskiSpace) := by simpa using hxU; subst hx1
    refine ⟨{1}, Or.inr (Or.inl rfl), by simp, ?_, ?_⟩
    · intro z; simp
    · exact subsingleton_connected (α := Subtype ({1} : Set SierpinskiSpace))
  · refine ⟨Set.univ, Or.inr (Or.inr rfl), Set.mem_univ _, ?_, ?_⟩
    · intro z; exact Set.mem_univ z
    · exact sierpinski_connected

#eval "══ Examples/Counterexamples ══"
#eval "Eg 1: discrete 2-point: locally connected, not connected"
#eval "Eg 2: Sierpinski: connected AND locally connected (both)"
end MiniConnectedness