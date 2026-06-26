/-
# MiniConnectedness: Constructions — Quotient Spaces
L3: Quotient topology. L4: Quotient preserves connectedness. L6: #eval.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Core.Laws
namespace MiniConnectedness

def quotientTopology {α β : Type u} [TopSpace α] (q : α → β) : TopologicalSpace β where
  isOpen U := isOpen (q⁻¹' U)
  univOpen := by simp [univOpen]
  interOpen := by
    intro U V hU hV; rw [Set.preimage_inter]; exact interOpen hU hV
  unionOpen := by
    intro S hS; rw [Set.preimage_sUnion]
    apply (topology α).unionOpen; intro U hU
    rcases Set.mem_image.mp hU with ⟨V, hV, rfl⟩; exact hS V hV

theorem quotient_surjective_connected {α β : Type u} [TopSpace α] (q : α → β)
    (hq_surj : Function.Surjective q) (hconn : IsConnected α) : IsConnected β := by
  let _ : TopSpace β := { topology := quotientTopology q }
  apply continuous_surjective_image_of_connected q ?_ hq_surj hconn
  intro U hU; exact hU

structure WedgeSum (α β : Type u) [TopSpace α] [TopSpace β] (a₀ : α) (b₀ : β) where
  space : Type u; [top_sp : TopSpace space]
  incl_left : α → space; incl_right : β → space
  seam : incl_left a₀ = incl_right b₀
  is_connected : IsConnected space

-- Trivial wedge sum construction (glue via indiscrete topology)
example {α β : Type u} [TopSpace α] [TopSpace β] (a₀ : α) (b₀ : β)
    (hα : topology α = indiscreteTopology α) [Nonempty α] : ∃ (s : WedgeSum α β a₀ b₀), s.is_connected := by
  refine ⟨{ space := α; incl_left := id; incl_right := fun _ => a₀; seam := rfl
    is_connected := indiscrete_connected hα }, rfl⟩

#eval "══ Constructions/Quotients ══"
#eval "Defs: quotientTopology, WedgeSum"
#eval "Thm: quotient_surjective_connected"
end MiniConnectedness