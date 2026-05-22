/-
# MiniStoneCechCompactification.Morphisms.Hom

Morphisms between compactifications. The continuous extension property
and the compactification functor β : Tych → CompHaus.
-/

import MiniStoneCechCompactification.Core.Basic
import MiniStoneCechCompactification.Core.Laws

open Set

namespace MiniStoneCechCompactification

variable {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y]

/-! ## Continuous extension -/

/-- A continuous map f : X → Y extends to a map between compactifications. -/
structure CompactificationExtension (cX : Compactification X) (cY : Compactification Y)
    (f : X → Y) where
  (ext : cX.carrier → cY.carrier)
  (continuous_ext : Continuous ext)
  (extension_property : ext ∘ cX.embedding = cY.embedding ∘ f)

/-! ## Morphism of compactifications -/

/-- A morphism between compactifications of the same space X.
    π : c₁ → c₂ continuous with π ∘ e₁ = e₂. -/
structure CompactificationMorphism (c₁ c₂ : Compactification X) where
  (map : c₁.carrier → c₂.carrier)
  (continuous_map : Continuous map)
  (commutes : map ∘ c₁.embedding = c₂.embedding)

/-- Identity morphism. -/
def compactificationMorphism_id (c : Compactification X) : CompactificationMorphism c c where
  map := id
  continuous_map := continuous_id
  commutes := rfl

/-- Composition of compactification morphisms. -/
def compactificationMorphism_comp {c₁ c₂ c₃ : Compactification X}
    (m₁₂ : CompactificationMorphism c₁ c₂) (m₂₃ : CompactificationMorphism c₂ c₃) :
    CompactificationMorphism c₁ c₃ where
  map := m₂₃.map ∘ m₁₂.map
  continuous_map := Continuous.comp m₂₃.continuous_map m₁₂.continuous_map
  commutes := by
    simp [m₁₂.commutes, m₂₃.commutes, Function.comp.assoc]

/-! ## Functor β : Tych → CompHaus -/

/-- The Stone-Cech functor on objects. -/
def stoneCech_obj (X : Type u) [TopologicalSpace X] [T35Space X] : Type u :=
  (stoneCech X).carrier

/-- The Stone-Cech functor on morphisms.
    Given f : X → Y continuous (with X, Y Tychonoff),
    βf : βX → βY is the unique continuous extension of e_Y ∘ f. -/
def stoneCech_hom {X Y : Type u} [TopologicalSpace X] [TopologicalSpace Y] [T35Space X] [T35Space Y]
    (f : X → Y) (hf : Continuous f) : stoneCech_obj X → stoneCech_obj Y :=
  stoneCech_map f hf

/-- β preserves identity. -/
theorem stoneCech_preserves_id (X : Type u) [TopologicalSpace X] [T35Space X] :
    stoneCech_hom (id : X → X) continuous_id = id :=
  sorry

/-- β preserves composition. -/
theorem stoneCech_preserves_comp {X Y Z : Type u} [TopologicalSpace X] [TopologicalSpace Y]
    [TopologicalSpace Z] [T35Space X] [T35Space Y] [T35Space Z]
    (f : X → Y) (hf : Continuous f) (g : Y → Z) (hg : Continuous g) :
    stoneCech_hom (g ∘ f) (Continuous.comp hg hf) =
    stoneCech_hom g hg ∘ stoneCech_hom f hf :=
  sorry

/-! ## Extension from the remainder -/

/-- A homeomorphism between remainders that extends continuously to the full spaces. -/
structure RemainderExtension (cX : Compactification X) (cY : Compactification Y) where
  (f : cX.carrier → cY.carrier)
  (hf : Continuous f)
  (restricts : f '' Compactification.remainder cX ⊆ Compactification.remainder cY)

#eval "Morphisms: compactification extension and functor β"
#eval "β : Tych → CompHaus"
#eval "Remainder extensions"
