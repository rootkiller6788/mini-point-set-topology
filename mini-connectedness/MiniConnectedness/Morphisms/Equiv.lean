/-
# MiniConnectedness: Equivalences — Connectedness Invariants
L2/L4/L5/L6: Topological invariants preserved under homeomorphism.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Core.Laws
import MiniConnectedness.Morphisms.Iso
namespace MiniConnectedness

theorem connectedness_homeo {α β : Type u} [TopSpace α] [TopSpace β]
    (h : Homeomorphism α β) : IsConnected α ↔ IsConnected β := by
  constructor
  · exact homeomorphism_preserves_connectedness h
  · exact homeomorphism_preserves_connectedness_symm h

theorem pathConnected_homeo {α β : Type u} [TopSpace α] [TopSpace β]
    (h : Homeomorphism α β) (hpath : IsPathConnected α) : IsPathConnected β := by
  intro x y; rcases hpath (h.invFun x) (h.invFun y) with ⟨p⟩
  refine ⟨{ map := h.toFun ∘ p.map
    start := by simp [p.start, h.leftInv]
    final := by simp [p.final, h.leftInv]
    continuity := continuous_comp p.continuity h.continuous_toFun }⟩

theorem totallyDisconnected_homeo {α β : Type u} [TopSpace α] [TopSpace β]
    (h : Homeomorphism α β) (htd : IsTotallyDisconnected α) : IsTotallyDisconnected β := by
  intro S hSconn
  rcases htd (h.invFun '' S) (by
    intro hsep; rcases hsep with ⟨U, V, hU, hV, hdisj, hcov, hUne, hVne⟩
    apply hSconn
    refine ⟨h.toFun⁻¹' U, h.toFun⁻¹' V, h.continuous_toFun U hU, h.continuous_toFun V hV, ?_, ?_, ?_, ?_⟩
    · ext z; constructor; · intro ⟨⟨hzU,_⟩,⟨hzV,_⟩⟩; have : h.toFun z ∈ U ∩ V := ⟨hzU, hzV⟩
        rw [hdisj] at this; exact Set.not_mem_empty _ this
      · intro; exfalso; exact Set.not_mem_empty _ (by trivial)
    · ext z; constructor; · intro; rcases · with (⟨hzU,hzS⟩|⟨hzV,hzS⟩); exact hzS
      · intro hzS; by_cases hzU : h.toFun z ∈ U; · exact Or.inl ⟨hzU, hzS⟩; · exact Or.inr ⟨hzU, hzS⟩
    · rcases Set.not_eq_empty.mp hUne with ⟨w, hwU, hw⟩; rcases Set.mem_image.mp hw with ⟨s, hs, rfl⟩
      exact Set.Nonempty.ne_empty ⟨s, by rw [h.leftInv]; exact hwU, hs⟩
    · rcases Set.not_eq_empty.mp hVne with ⟨w, hwV, hw⟩; rcases Set.mem_image.mp hw with ⟨s, hs, rfl⟩
      exact Set.Nonempty.ne_empty ⟨s, by rw [h.leftInv]; exact hwV, hs⟩
  ) with (h_empty | ⟨z, hz⟩)
  · left; have himg_s_eq : h.toFun '' (h.invFun '' S) = S := by
      ext x; constructor
      · intro hx; rcases Set.mem_image.mp hx with ⟨y, hy, rfl⟩
        rcases Set.mem_image.mp hy with ⟨s, hs, rfl⟩; rw [h.rightInv]; exact hs
      · intro hx; apply Set.mem_image.mpr; refine ⟨h.invFun x, Set.mem_image.mpr ⟨x, hx, rfl⟩, h.rightInv x⟩
    rw [himg_s_eq, h_empty]; rfl
  · right; refine ⟨h.toFun z, ?_⟩; ext x; constructor
    · intro hx; have : h.invFun x ∈ h.invFun '' S := Set.mem_image.mpr ⟨x, hx, rfl⟩
      rw [hz] at this; simp at this; simp [h.leftInv, this]
    · intro hx; rw [Set.mem_singleton_iff.mp hx]
      have : z ∈ h.invFun '' S := by rw [hz]; simp
      rcases Set.mem_image.mp this with ⟨s, hs, rfl⟩; exact hs

#eval "══ Morphisms/Equiv ══"
#eval "Thm: connectedness_homeo (connectedness is a topological invariant)"
#eval "Thm: pathConnected_homeo (path-connectedness preserved by homeo)"
#eval "Thm: totallyDisconnected_homeo (total disconnectedness preserved)"
end MiniConnectedness
