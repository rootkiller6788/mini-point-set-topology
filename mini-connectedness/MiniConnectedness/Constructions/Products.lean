/-
# MiniConnectedness: Constructions — Product Spaces
L3: Product topology. L4: Product connectedness. L6: #eval.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Core.Laws
namespace MiniConnectedness

def productTopology {α β : Type u} [TopSpace α] [TopSpace β] : TopologicalSpace (α × β) where
  isOpen W := ∀ (p : α × β), p ∈ W → ∃ (U : Set α) (V : Set β),
    isOpen U ∧ isOpen V ∧ p.1 ∈ U ∧ p.2 ∈ V ∧ (U ×ˢ V) ⊆ W
  univOpen := by
    intro p hp; refine ⟨Set.univ, Set.univ, univOpen, univOpen, Set.mem_univ _, Set.mem_univ _, ?_⟩
    intro q; simp
  interOpen := by
    intro W₁ W₂ hW₁ hW₂ p ⟨hp₁, hp₂⟩
    rcases hW₁ p hp₁ with ⟨U₁, V₁, hU₁, hV₁, hx₁, hy₁, hsub₁⟩
    rcases hW₂ p hp₂ with ⟨U₂, V₂, hU₂, hV₂, hx₂, hy₂, hsub₂⟩
    refine ⟨U₁ ∩ U₂, V₁ ∩ V₂, interOpen hU₁ hU₂, interOpen hV₁ hV₂, ⟨hx₁, hx₂⟩, ⟨hy₁, hy₂⟩, ?_⟩
    intro q ⟨⟨hqU₁, hqU₂⟩, ⟨hqV₁, hqV₂⟩⟩; exact ⟨hsub₁ q ⟨hqU₁, hqV₁⟩, hsub₂ q ⟨hqU₂, hqV₂⟩⟩
  unionOpen := by
    intro 𝒲 h𝒲 p hp; rcases Set.mem_sUnion.mp hp with ⟨W, hW, hpW⟩
    rcases h𝒲 W hW p hpW with ⟨U, V, hU, hV, hx, hy, hsub⟩
    refine ⟨U, V, hU, hV, hx, hy, ?_⟩
    intro q hq; exact Set.subset_sUnion_of_mem hW (hsub q hq)

instance {α β : Type u} [TopSpace α] [TopSpace β] : TopSpace (α × β) where topology := productTopology

theorem product_indiscrete_connected {α β : Type u} [TopSpace α] [TopSpace β]
    (hαtop : topology α = indiscreteTopology α) [Nonempty α]
    (hβtop : topology β = indiscreteTopology β) [Nonempty β] : IsConnected (α × β) := by
  intro hdisc; rcases hdisc with ⟨W₁, W₂, hW₁, hW₂, hdisj, hcover, hW₁ne, hW₂ne⟩
  rcases Set.not_eq_empty.mp hW₁ne with ⟨p₁, hp₁⟩
  have hW₁_univ : W₁ = Set.univ := by
    ext p; constructor; · intro; exact Set.mem_univ _; · intro hp
    rcases hW₁ p₁ hp₁ with ⟨U, V, hU_open, hV_open, _, _, hsub⟩
    rw [hαtop] at hU_open; rw [hβtop] at hV_open
    rcases hU_open with (rfl|rfl) <;> rcases hV_open with (rfl|rfl)
    · exfalso; apply hp₁; apply hsub p₁; simp
    · exfalso; apply hp₁; apply hsub p₁; simp
    · exfalso; apply hp₁; apply hsub p₁; simp
    · have : U ×ˢ V = Set.univ := by ext q; simp
      rw [this] at hsub; exact hsub hp
  rw [hW₁_univ] at hdisj
  have hW₂_empty : W₂ = ∅ := by
    ext p; constructor
    · intro hp₂; have : p ∈ Set.univ ∩ W₂ := ⟨Set.mem_univ p, hp₂⟩
      rw [hdisj] at this; exact Set.not_mem_empty _ this
    · intro; exfalso; exact Set.not_mem_empty _ (by trivial)
  rw [hW₂_empty] at hW₂ne; exact hW₂ne rfl

theorem continuous_fst {α β : Type u} [TopSpace α] [TopSpace β] : Continuous (Prod.fst : α × β → α) := by
  intro U hU; rw [productTopology]; intro p hp; rcases hp with ⟨hp1, hp2⟩
  refine ⟨U, Set.univ, hU, univOpen, hp1, Set.mem_univ _, ?_⟩
  intro q ⟨hqU, _⟩; exact hqU

theorem continuous_snd {α β : Type u} [TopSpace α] [TopSpace β] : Continuous (Prod.snd : α × β → β) := by
  intro V hV; rw [productTopology]; intro p hp; rcases hp with ⟨hp1, hp2⟩
  refine ⟨Set.univ, V, univOpen, hV, Set.mem_univ _, hp2, ?_⟩
  intro q ⟨_, hqV⟩; exact hqV

#eval "══ Constructions/Products ══"
#eval "Defs: productTopology, TopSpace (alpha x beta)"
#eval "Thm: product_indiscrete_connected"
#eval "Thm: continuous_fst, continuous_snd"
end MiniConnectedness