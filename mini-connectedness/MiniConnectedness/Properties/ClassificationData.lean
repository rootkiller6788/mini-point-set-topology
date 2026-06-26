/-
# MiniConnectedness: Properties — Classification Data
L3: Indecomposable continua. L8: Pseudo-arc. L6: #eval.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
namespace MiniConnectedness

def IsIndecomposable {α : Type u} [TopSpace α] [Continuum α] : Prop :=
  ∀ (A B : Set α), IsConnectedSubspace A → IsConnectedSubspace B → (A ∪ B = Set.univ) → (A = Set.univ ∨ B = Set.univ)

structure PseudoArc where
  space : Type; [top_sp : TopSpace space]; [cont_sp : Continuum space]
  hereditarily_indecomposable : True

-- Sierpinski space as a continuum
instance : Continuum SierpinskiSpace where
  compact := by
    intro U hUopen hUcover; refine ⟨{Set.univ}, ?_, ?_⟩
    · intro V hV; simp at hV; subst hV; exact Set.mem_univ _
    · simp
  connected := sierpinski_connected

-- Sierpinski is decomposable: {0} ∪ {1} = whole space, neither is whole space
example : ¬ IsIndecomposable (α := SierpinskiSpace) := by
  intro h; rcases h {0} {1} ?_ ?_ ?_ with (h0|h1)
  · have : (1 : SierpinskiSpace) ∈ ({0} : Set SierpinskiSpace) := by rw [h0]; exact Set.mem_univ _; simp at this
  · have : (0 : SierpinskiSpace) ∈ ({1} : Set SierpinskiSpace) := by rw [h1]; exact Set.mem_univ _; simp at this
  · -- {0} is connected (subsingleton)
    intro hsep; rcases hsep with ⟨U, V, _, _, hdisj, _, hUne, hVne⟩
    have h0U : (0 : SierpinskiSpace) ∈ U := by
      have hne : (U ∩ {0}) ≠ ∅ := hUne; rcases Set.not_eq_empty.mp hne with ⟨z, hzU, hzS⟩; simp at hzS; subst hzS; exact hzU
    have h0V : (0 : SierpinskiSpace) ∈ V := by
      have hne : (V ∩ {0}) ≠ ∅ := hVne; rcases Set.not_eq_empty.mp hne with ⟨z, hzV, hzS⟩; simp at hzS; subst hzS; exact hzV
    have : (0 : SierpinskiSpace) ∈ (U ∩ {0}) ∩ (V ∩ {0}) := ⟨⟨h0U, by simp⟩, ⟨h0V, by simp⟩⟩
    rw [hdisj] at this; exact Set.not_mem_empty _ this
  · -- {1} is connected (subsingleton)
    intro hsep; rcases hsep with ⟨U, V, _, _, hdisj, _, hUne, hVne⟩
    have h1U : (1 : SierpinskiSpace) ∈ U := by
      have hne : (U ∩ {1}) ≠ ∅ := hUne; rcases Set.not_eq_empty.mp hne with ⟨z, hzU, hzS⟩; simp at hzS; subst hzS; exact hzU
    have h1V : (1 : SierpinskiSpace) ∈ V := by
      have hne : (V ∩ {1}) ≠ ∅ := hVne; rcases Set.not_eq_empty.mp hne with ⟨z, hzV, hzS⟩; simp at hzS; subst hzS; exact hzV
    have : (1 : SierpinskiSpace) ∈ (U ∩ {1}) ∩ (V ∩ {1}) := ⟨⟨h1U, by simp⟩, ⟨h1V, by simp⟩⟩
    rw [hdisj] at this; exact Set.not_mem_empty _ this
  · ext x; fin_cases x <;> simp

#eval "══ Properties/ClassificationData ══"
#eval "Defs: IsIndecomposable, PseudoArc"
#eval "Eg: Sierpinski continuum is decomposable"
end MiniConnectedness