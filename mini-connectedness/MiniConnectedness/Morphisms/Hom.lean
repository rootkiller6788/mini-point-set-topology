/-
# MiniConnectedness: Morphisms — Monotone and Light Maps
Monotone maps (connected fibers) and light maps (totally disconnected fibers).
Knowledge: L2 (morphism concepts), L3 (factorization), L6 (#eval).
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
namespace MiniConnectedness

/-! ### Monotone Maps: Every Fiber is Connected -/
def IsMonotone {α β : Type u} [TopSpace α] [TopSpace β] (f : α → β) : Prop :=
  ∀ (y : β), IsConnectedSubspace (f⁻¹' {y})

theorem id_monotone {α : Type u} [TopSpace α] : IsMonotone (id : α → α) := by
  intro y; intro hsep; rcases hsep with ⟨U, V, hU, hV, hdisj, hcov, hUne, hVne⟩
  have hyU : y ∈ U := by
    have hne : (U ∩ id⁻¹' {y}) ≠ ∅ := hUne
    rcases Set.not_eq_empty.mp hne with ⟨z, hzU, hzF⟩; simp at hzF; subst hzF; exact hzU
  have hyV : y ∈ V := by
    have hne : (V ∩ id⁻¹' {y}) ≠ ∅ := hVne
    rcases Set.not_eq_empty.mp hne with ⟨z, hzV, hzF⟩; simp at hzF; subst hzF; exact hzV
  have hy_disj : y ∈ (U ∩ id⁻¹' {y}) ∩ (V ∩ id⁻¹' {y}) := ⟨⟨hyU, by simp⟩, ⟨hyV, by simp⟩⟩
  rw [hdisj] at hy_disj; exact Set.not_mem_empty _ hy_disj

theorem empty_connected_subspace {α : Type u} [TopSpace α] : IsConnectedSubspace (∅ : Set α) := by
  intro hsep; rcases hsep with ⟨U, V, _, _, _, _, hUne, _⟩
  have : (U ∩ (∅ : Set α)) = ∅ := by simp; rw [this] at hUne; exact hUne rfl

/-! ### Light Maps: Totally Disconnected Fibers -/
def IsLight {α β : Type u} [TopSpace α] [TopSpace β] (f : α → β) : Prop :=
  ∀ (y : β), IsTotallyDisconnected (Subtype fun x : α => f x = y)

/-! ### Monotone-Light Factorization -/
structure MonotoneLightFactorization {α β : Type u} [TopSpace α] [TopSpace β] (f : α → β) where
  middle : Type u; [top_mid : TopSpace middle]
  monotoneMap : α → middle; lightMap : middle → β
  mono_prop : IsMonotone monotoneMap; light_prop : IsLight lightMap
  factorization : ∀ x, lightMap (monotoneMap x) = f x

def trivialMLF {α β : Type u} [TopSpace α] [TopSpace β]
    (f : α → β) (hf_light : IsLight f) : MonotoneLightFactorization f where
  middle := α; monotoneMap := id; lightMap := f
  mono_prop := id_monotone; light_prop := hf_light
  factorization := λ _ => rfl

#eval "══ Morphisms/Hom ══"
#eval "Defs: IsMonotone, IsLight, MonotoneLightFactorization"
#eval "Thm: id_monotone (identity map preserves connectedness of fibers)"
#eval "Thm: empty_connected_subspace (empty set is trivially connected)"
#eval "Thm: trivialMLF (trivial monotone-light factorization)"
#eval ""
#eval "Monotone maps: every fiber f^(-1)({y}) is a connected subspace."
#eval "Light maps: every fiber is totally disconnected."
#eval "Monotone-light factorization: every continuous map f factors"
#eval "  as f = light . monotone between compact spaces."
end MiniConnectedness