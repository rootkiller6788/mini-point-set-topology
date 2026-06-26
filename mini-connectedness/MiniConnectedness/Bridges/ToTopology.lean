/-
# MiniConnectedness: Bridge to General Topology
L7: Continua theory, dendrites, nested intersections.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Properties.ClassificationData
import MiniConnectedness.Theorems.Main
namespace MiniConnectedness

def IsDecomposable {α : Type u} [TopSpace α] [Continuum α] : Prop :=
  ∃ (A B : Set α), IsConnectedSubspace A ∧ IsConnectedSubspace B ∧
    A ≠ Set.univ ∧ B ≠ Set.univ ∧ A ∪ B = Set.univ

-- Sierpinski space continuum is decomposable
example : IsDecomposable (α := SierpinskiSpace) := by
  refine ⟨{0}, {1}, ?_, ?_, ?_, ?_, ?_⟩
  · intro hsep; rcases hsep with ⟨U, V, _, _, hdisj, _, hUne, hVne⟩
    have h0U : (0 : SierpinskiSpace) ∈ U := by
      have hne : (U ∩ {0}) ≠ ∅ := hUne; rcases Set.not_eq_empty.mp hne with ⟨z, hzU, hzS⟩; simp at hzS; subst hzS; exact hzU
    have h0V : (0 : SierpinskiSpace) ∈ V := by
      have hne : (V ∩ {0}) ≠ ∅ := hVne; rcases Set.not_eq_empty.mp hne with ⟨z, hzV, hzS⟩; simp at hzS; subst hzS; exact hzV
    have : (0 : SierpinskiSpace) ∈ (U ∩ {0}) ∩ (V ∩ {0}) := ⟨⟨h0U, by simp⟩, ⟨h0V, by simp⟩⟩
    rw [hdisj] at this; exact Set.not_mem_empty _ this
  · intro hsep; rcases hsep with ⟨U, V, _, _, hdisj, _, hUne, hVne⟩
    have h1U : (1 : SierpinskiSpace) ∈ U := by
      have hne : (U ∩ {1}) ≠ ∅ := hUne; rcases Set.not_eq_empty.mp hne with ⟨z, hzU, hzS⟩; simp at hzS; subst hzS; exact hzU
    have h1V : (1 : SierpinskiSpace) ∈ V := by
      have hne : (V ∩ {1}) ≠ ∅ := hVne; rcases Set.not_eq_empty.mp hne with ⟨z, hzV, hzS⟩; simp at hzS; subst hzS; exact hzV
    have : (1 : SierpinskiSpace) ∈ (U ∩ {1}) ∩ (V ∩ {1}) := ⟨⟨h1U, by simp⟩, ⟨h1V, by simp⟩⟩
    rw [hdisj] at this; exact Set.not_mem_empty _ this
  · intro h; have : (1 : SierpinskiSpace) ∈ ({0} : Set SierpinskiSpace) := by rw [h]; exact Set.mem_univ _; simp at this
  · intro h; have : (0 : SierpinskiSpace) ∈ ({1} : Set SierpinskiSpace) := by rw [h]; exact Set.mem_univ _; simp at this
  · ext x; fin_cases x <;> simp

/-- Nested intersection of continua: if C_n is a decreasing sequence of subcontinua,
the intersection is a continuum. (Documented; formal proof requires metric/compactness theory.) -/
#eval "Nested intersection of continua = continuum"

/-- A dendrite is a locally connected continuum containing no simple closed curve.
Every dendrite is an absolute retract for metric spaces. -/
#eval "Dendrites: locally connected continua, no simple closed curves"

/-- The pseudo-arc is the unique hereditarily indecomposable chainable continuum.
It embeds in the plane R^2 and is homogeneous (every point looks like every other). -/
#eval "Pseudo-arc: unique hereditarily indecomposable chainable continuum"

#eval "══ Bridges/ToTopology ══"
#eval "Defs: IsDecomposable"
#eval "Continua theory: decomposition, dendrites, pseudo-arc"
end MiniConnectedness