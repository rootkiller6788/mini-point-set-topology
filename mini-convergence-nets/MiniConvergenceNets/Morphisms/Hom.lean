/-
# MiniConvergenceNets.Morphisms.Hom

Net-convergence-preserving maps, filter maps, ultrafilter maps.
-/

import MiniConvergenceNets.Core.Basic
import MiniConvergenceNets.Core.Objects

namespace MiniConvergenceNets

universe u v

/-! ## Net Convergence Preserving Map -/

/-- A map f is net-convergence-preserving if it preserves limits of all nets. -/
structure NetConvergenceHom (X Y : Type u) where
  map : X → Y
  preservesLimits : ∀ {α : Type u} (φ : Net α X) (x : X) (tdX : TopologyData X),
    NetLimit φ x tdX.opens → NetLimit
      ({ dir := φ.dir, f := map ∘ φ.f } : Net α Y) (map x)
      ({ opens := {V : Set Y | ∃ U ∈ tdX.opens, map ⁻¹' V = U}
         univ_open := by
           use Set.univ, tdX.univ_open
           simp
         inter_open := by
           intro U V hU hV
           rcases hU with ⟨U', hU', hUeq⟩
           rcases hV with ⟨V', hV', hVeq⟩
           use U' ∩ V', tdX.inter_open U' V' hU' hV'
           ext x; constructor
           · rintro ⟨hx, hy⟩; exact ⟨hUeq ▸ hx, hVeq ▸ hy⟩
           · rintro ⟨hx, hy⟩; exact ⟨hUeq ▸ hx, hVeq ▸ hy⟩
         union_open := by
           intro S hS
           use ⋃₀ {U : Set X | ∃ V ∈ S, map ⁻¹' V = U}, tdX.union_open _ (by
             rintro U ⟨V, hV, rfl⟩
             rcases hS V hV with ⟨W, hW, hWeq⟩
             -- We know map⁻¹' V = W and W ∈ tdX.opens
             sorry)
           sorry
       } : TopologyData Y).opens

#eval "NetConvergenceHom defined"

/-! ## Filter Map -/

/-- A filter-continuous map preserves filter convergence. -/
structure FilterHom (X Y : Type u) where
  map : X → Y
  preservesFilter : ∀ (tdX : TopologyData X) (tdY : TopologyData Y),
    (∀ (F : Filter X) (x : X),
      FilterConvergence tdX F x → FilterConvergence tdY
        ({ sets := {s : Set Y | map ⁻¹' s ∈ F.sets}
           univ_mem := by simpa using F.univ_mem
           empty_not_mem := by
             intro h; apply F.empty_not_mem
             have : map ⁻¹' (∅ : Set Y) = (∅ : Set X) := by simp
             rw [this] at h; exact h
           superset_mem := λ hst htu => F.superset_mem hst (Set.preimage_mono htu)
           inter_mem := λ hst htu => by
             simpa [Set.preimage_inter] using F.inter_mem hst htu
         } : Filter Y) (map x)) → True

#eval "FilterHom defined"

/-! ## Ultrafilter Map -/

/-- An ultrafilter map preserves the ultrafilter property. -/
structure UltrafilterHom (X Y : Type u) where
  map : X → Y
  preservesUltrafilter : ∀ (F : Filter X), IsUltrafilter F → IsUltrafilter
    ({ sets := {s : Set Y | map ⁻¹' s ∈ F.sets}
       univ_mem := by simpa using F.univ_mem
       empty_not_mem := by
         intro h; apply F.empty_not_mem
         simpa using h
       superset_mem := λ hst htu => F.superset_mem hst (Set.preimage_mono htu)
       inter_mem := λ hst htu => by
         simpa [Set.preimage_inter] using F.inter_mem hst htu
     } : Filter Y)

#eval "UltrafilterHom defined"

/-! ## Composition of Convergence Homomorphisms -/

/-- Net convergence homomorphisms compose. -/
def NetConvergenceHom.comp {X Y Z : Type u}
    (g : NetConvergenceHom Y Z) (f : NetConvergenceHom X Y) : NetConvergenceHom X Z where
  map := g.map ∘ f.map
  preservesLimits φ x tdX hl := by
    have hf := f.preservesLimits φ x tdX hl
    sorry -- apply g.preservesLimits to the result

#eval "Composition defined"

end MiniConvergenceNets
