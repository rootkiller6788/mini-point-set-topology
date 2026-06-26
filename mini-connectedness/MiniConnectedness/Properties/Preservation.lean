/-
# MiniConnectedness: Properties — Preservation
L2: Preservation under continuous maps/homeomorphisms. L6: #eval.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Core.Laws
namespace MiniConnectedness

theorem connectedness_continuous_image {α β : Type u} [TopSpace α] [TopSpace β]
    (f : α → β) (hf : Continuous f) (hsurj : Function.Surjective f) (hconn : IsConnected α) : IsConnected β :=
  continuous_surjective_image_of_connected f hf hsurj hconn

theorem connectedness_homeo_iff {α β : Type u} [TopSpace α] [TopSpace β]
    (h : Homeomorphism α β) : IsConnected α ↔ IsConnected β := connectedness_homeo h

theorem pathConnected_continuous_image {α β : Type u} [TopSpace α] [TopSpace β]
    (f : α → β) (hf : Continuous f) (hsurj : Function.Surjective f) (hpath : IsPathConnected α) : IsPathConnected β := by
  intro x y; rcases hsurj x with ⟨x', rfl⟩; rcases hsurj y with ⟨y', rfl⟩
  rcases hpath x' y' with ⟨p⟩
  refine ⟨{ map := f ∘ p.map; start := by simp [p.start]; final := by simp [p.final]
    continuity := continuous_comp p.continuity hf }⟩

/-- A constant map to a singleton codomain preserves connectedness trivially. -/
example {α β : Type u} [TopSpace α] [TopSpace β] (f : α → β) (hf : ∀ x y, f x = f y) [Nonempty α]
    (hconn : IsConnected α) : IsConnected β := by
  have hsurj : Function.Surjective f := by
    intro y; rcases (inferInstance : Nonempty α) with ⟨x⟩; refine ⟨x, ?_⟩
    apply hf
  exact continuous_surjective_image_of_connected f (by
    intro U hU; by_cases hUempty : f⁻¹' U = ∅
    · rw [hUempty]; exact emptyOpen
    · have : f⁻¹' U = Set.univ := by
        ext z; constructor; · intro; exact Set.mem_univ _; · intro hz
        rcases Set.not_eq_empty.mp hUempty with ⟨w, hw⟩; rw [hf w z] at hw; exact hw
      rw [this]; exact univOpen
  ) hsurj hconn

#eval "══ Properties/Preservation ══"
#eval "Thm: connectedness_continuous_image"
#eval "Thm: pathConnected_continuous_image"
#eval "Thm: connectedness_homeo_iff"
end MiniConnectedness