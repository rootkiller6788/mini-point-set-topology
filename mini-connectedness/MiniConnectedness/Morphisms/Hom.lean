/-
# MiniConnectedness: Morphisms (Hom)

Monotone maps (maps with connected fibers), light maps (maps
with totally disconnected fibers), and the monotone-light
factorization of continuous maps between compact spaces.
-/

import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic

namespace MiniConnectedness

/-! ## Monotone Maps -/

/-- A map is monotone if every fiber is connected. -/
def IsMonotone {α β : Type u} [TopSpace α] [TopSpace β] (f : α → β) : Prop :=
  ∀ (y : β), IsConnectedSubspace (f⁻¹' {y})

/-- Identity is monotone. -/
theorem id_monotone {α : Type u} [TopSpace α] [h : IsConnected α] : IsMonotone (id : α → α) := by
  intro y
  sorry

/-- Composition of monotone maps is monotone. -/
theorem monotone_comp {α β γ : Type u} [TopSpace α] [TopSpace β] [TopSpace γ]
  (f : α → β) (g : β → γ) (hf : IsMonotone f) (hg : IsMonotone g) : IsMonotone (g ∘ f) := by
  sorry

#eval "Monotone map: each fiber f⁻¹{y} is connected"

/-! ## Light Maps -/

/-- A map is light if every fiber is totally disconnected. -/
def IsLight {α β : Type u} [TopSpace α] [TopSpace β] (f : α → β) : Prop :=
  ∀ (y : β), IsTotallyDisconnected (Subtype fun x : α => f x = y)

/-- A map that is both monotone and light is a homeomorphism (for compact spaces). -/
theorem monotone_light_is_homeo {α β : Type u} [TopSpace α] [TopSpace β]
  (f : α → β) (hf_cont : Continuous f) (hf_mono : IsMonotone f) (hf_light : IsLight f) :
  sorry := by
  sorry

#eval "Light map: each fiber f⁻¹{y} is totally disconnected"

/-! ## Monotone-Light Factorization -/

/-- Every continuous map between compact spaces factors as a monotone map
followed by a light map. -/
structure MonotoneLightFactorization {α β : Type u} [TopSpace α] [TopSpace β] (f : α → β) where
  middle : Type u
  [top_mid : TopSpace middle]
  monotoneMap : α → middle
  lightMap : middle → β
  mono_prop : IsMonotone monotoneMap
  light_prop : IsLight lightMap
  factorization : ∀ x, lightMap (monotoneMap x) = f x

-- #eval "Monotone-light factorization: f = light ∘ monotone"

end MiniConnectedness
