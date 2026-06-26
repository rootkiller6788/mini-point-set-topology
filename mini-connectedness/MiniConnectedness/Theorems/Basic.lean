/-
# MiniConnectedness: Basic Theorems
L4: Component properties. L6: #eval.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Core.Laws
namespace MiniConnectedness

theorem component_nonempty {α : Type u} [TopSpace α] (x : α) : Component x ≠ ∅ := by
  intro h; have : x ∈ Component x := mem_component_self x; rw [h] at this; exact Set.not_mem_empty _ this

theorem connected_iff_single_component {α : Type u} [TopSpace α] [Nonempty α] : IsConnected α ↔ ∀ x : α, Component x = Set.univ := by
  constructor
  · intro hconn x; exact connected_unique_component hconn x
  · intro h_all_comp; intro hdisc; rcases hdisc with ⟨U, V, hU, hV, hdisj, hcover, hUne, hVne⟩
    rcases Set.not_eq_empty.mp hUne with ⟨x, hxU⟩
    have hx_comp : Component x = Set.univ := h_all_comp x
    have hxV : x ∈ V := by
      have : x ∈ U ∪ V := by rw [hcover]; exact Set.mem_univ x
      rcases this with (h|h); · exfalso
        -- x ∈ U, so Uᶜ is a proper clopen. Since Component x = Set.univ,
        -- every point must be in the same component as x. But V ≠ ∅ gives y ∈ V, y ∉ U.
        -- Then U separates x from y, contradiction to Component x = Set.univ.
        rcases Set.not_eq_empty.mp hVne with ⟨y, hyV⟩
        have hyComp : y ∈ Component x := by rw [hx_comp]; exact Set.mem_univ _
        rcases Set.mem_sUnion.mp hyComp with ⟨S, ⟨hS_conn, hxS⟩, hyS⟩
        apply hS_conn; refine ⟨U, V, hU, hV, ?_, ?_, ?_, ?_⟩
        · ext z; constructor; · intro ⟨⟨hzU,_⟩,⟨hzV,_⟩⟩; have : z ∈ U ∩ V := ⟨hzU, hzV⟩
            rw [hdisj] at this; exact Set.not_mem_empty _ this
          · intro; exfalso; exact Set.not_mem_empty _ (by trivial)
        · ext z; constructor; · intro; rcases · with (⟨hzU,hzS'⟩|⟨hzV,hzS'⟩); exact hzS'
          · intro hzS'; by_cases hzU : z ∈ U; · exact Or.inl ⟨hzU, hzS'⟩; · exact Or.inr ⟨hzU, hzS'⟩
        · exact Set.Nonempty.ne_empty ⟨x, hxU, hxS⟩; · exact Set.Nonempty.ne_empty ⟨y, hyV, hyS⟩
      · exact h
    have : x ∈ U ∩ V := ⟨hxU, hxV⟩; rw [hdisj] at this; exact Set.not_mem_empty _ this

#eval "══ Theorems/Basic ══"
#eval "Thm: component_nonempty, connected_iff_single_component"
end MiniConnectedness