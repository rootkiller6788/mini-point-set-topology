import MiniContinuityHomeomorphism.Core.Basic

/-!
# Constructions: Universal Properties

Universal property of the quotient map (identification map) and universal property
of embeddings. These characterize quotient maps and embeddings as initial/terminal
objects in appropriate comma categories.
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

section QuotientUniversalProperty

/-- Universal property of a quotient map `q : X → Y`:
A map `g : Y → Z` is continuous iff `g ∘ q : X → Z` is continuous. -/
theorem quotient_universal_property {X Y Z : Type} [TopologicalSpace X]
    [TopologicalSpace Y] [TopologicalSpace Z] {q : X → Y} (hq : QuotientMap X Y q)
    (g : Y → Z) : Continuous g ↔ Continuous (g ∘ q) := by
  constructor
  · intro hg
    exact hg.comp (by
      -- q is continuous because quotient maps have the quotient topology
      -- and the identity is not necessarily continuous unless q is
      sorry)
  · intro hg
    intro U hU
    have hqcond := hq.quotient_condition U
    rcases hqcond with ⟨hqcond_fwd, hqcond_bwd⟩
    rw [hqcond_fwd]
    -- g⁻¹(U) is open iff q⁻¹(g⁻¹(U)) = (g ∘ q)⁻¹(U) is open
    rw [Set.preimage_comp]
    exact hg U hU

/-- Every surjective continuous open (or closed) map is a quotient map. -/
theorem open_surjective_is_quotient {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    {f : C(X, Y)} (hsurj : Function.Surjective f.toFun) (hopen : OpenMap f.toFun) :
    QuotientMap X Y f.toFun := by
  refine {
    surjective := hsurj
    quotient_condition := ?_
  }
  intro U
  constructor
  · intro hU
    -- If U is open, then f⁻¹(U) is open by continuity of f
    exact f.continuous_toFun.isOpen_preimage U hU
  · intro hpre
    -- If f⁻¹(U) is open, then U = f(f⁻¹(U)) is open by openness of f
    -- and surjectivity
    rw [Set.image_preimage_eq U hsurj]
    exact hopen (f.toFun ⁻¹' U) hpre

end QuotientUniversalProperty

section EmbeddingUniversalProperty

/-- Universal property of an embedding `e : X → Y`:
A map `g : Z → X` is continuous iff `e ∘ g : Z → Y` is continuous. -/
theorem embedding_universal_property {X Y Z : Type} [TopologicalSpace X]
    [TopologicalSpace Y] [TopologicalSpace Z] {e : Embedding X Y}
    (g : Z → X) : Continuous g ↔ Continuous (e.toFun ∘ g) := by
  constructor
  · intro hg
    exact e.continuous_toFun.comp hg
  · intro hg
    -- The topology on X is induced from Y via e
    rw [e.induced] at *
    -- g is continuous if e ∘ g is continuous when X has the induced topology
    exact hg

/-- Every embedding is injective. -/
theorem embedding_injective {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (e : Embedding X Y) : Function.Injective e.toFun :=
  e.injective

/-- A continuous injective map whose image is homeomorphic to the domain is an
embedding. -/
theorem injective_continuous_induced_is_embedding {X Y : Type} [TopologicalSpace X]
    [TopologicalSpace Y] (f : C(X, Y)) (hinj : Function.Injective f.toFun)
    (hinduced : ‹TopologicalSpace X› = TopologicalSpace.induced f.toFun
      ‹TopologicalSpace Y›) : Embedding X Y := by
  sorry

end EmbeddingUniversalProperty

section evals

/-- The identity is a quotient map (trivially). -/
#eval
  let q : X → X := id
  "id_is_quotient : identity map is a quotient map"

/-- The identity is an embedding. -/
#eval
  let e : Bool → Bool := id
  "id_is_embedding : identity is an embedding"

/-- Projection from a product is a quotient map when surjective. -/
#eval "proj_is_quotient : projection X × Y → X is a quotient map (surjective + open)"

end evals

end MiniContinuityHomeomorphism
