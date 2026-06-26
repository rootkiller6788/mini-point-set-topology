/-
# MiniConnectedness: Constructions — Subobjects
L3: Subspace topology. L4: Subspace preserves total disconnectedness. L6: #eval.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
namespace MiniConnectedness

theorem subspace_totallyDisconnected {α : Type u} [TopSpace α]
    (htd : IsTotallyDisconnected α) (S : Set α) : IsTotallyDisconnected (Subtype S) := by
  intro T hTconn
  let T' : Set α := {x | ∃ (h : x ∈ S), (⟨x, h⟩ : Subtype S) ∈ T}
  have hT'conn : IsConnectedSubspace T' := by
    intro hsep; rcases hsep with ⟨U, V, hU, hV, hdisj, hcov, hUne, hVne⟩; apply hTconn
    refine ⟨{z | z.val ∈ U}, {z | z.val ∈ V}, ?_, ?_, ?_, ?_, ?_, ?_⟩
    · refine ⟨U, hU, ?_⟩; ext z; simp
    · refine ⟨V, hV, ?_⟩; ext z; simp
    · ext z; constructor
      · intro ⟨⟨hzU,_⟩,⟨hzV,_⟩⟩; have : z.val ∈ U ∩ V := ⟨hzU, hzV⟩
        rw [hdisj] at this; exact Set.not_mem_empty _ this
      · intro; exfalso; exact Set.not_mem_empty _ (by trivial)
    · ext z; constructor
      · intro; rcases · with (⟨hzU,hzT⟩|⟨hzV,hzT⟩); exact hzT
      · intro hzT; by_cases hzU : z.val ∈ U; · exact Or.inl ⟨hzU, hzT⟩; · exact Or.inr ⟨hzU, hzT⟩
    · rcases Set.not_eq_empty.mp hUne with ⟨z, hzU, hzT⟩
      refine Set.Nonempty.ne_empty ⟨z, hzU, ?_⟩; rcases hzT with ⟨hS, hT⟩; exact hT
    · rcases Set.not_eq_empty.mp hVne with ⟨z, hzV, hzT⟩
      refine Set.Nonempty.ne_empty ⟨z, hzV, ?_⟩; rcases hzT with ⟨hS, hT⟩; exact hT
  rcases htd T' hT'conn with (hT'empty | ⟨x, hx⟩)
  · left; ext z; constructor
    · intro hz; exfalso; apply hT'empty; exact ⟨z.property, hz⟩
    · intro hz; exfalso; exact Set.not_mem_empty _ hz
  · right; have hxT' : x ∈ T' := by rw [hx]; simp
    rcases hxT' with ⟨hxS, hxT⟩
    refine ⟨⟨x, hxS⟩, ?_⟩; ext z; constructor
    · intro hz; have : z.val ∈ T' := ⟨z.property, hz⟩
      rw [hx] at this; simp at this; apply Subtype.ext; exact this
    · intro hz; rw [Subtype.mk.injEq] at hz; subst hz; exact hxT

#eval "══ Constructions/Subobjects ══"
#eval "Thm: subspace_totallyDisconnected"
end MiniConnectedness