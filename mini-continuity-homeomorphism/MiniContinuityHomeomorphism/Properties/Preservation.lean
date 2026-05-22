import MiniContinuityHomeomorphism.Core.Basic

/-!
# Properties: Preservation Theorems

What properties are preserved by continuous maps, open maps, closed maps,
quotient maps, embeddings, and proper maps?
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

section ContinuousPreserves

/-- The continuous image of a compact set is compact. -/
theorem continuous_image_of_compact {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f : C(X, Y)) {K : Set X} (hK : IsCompact K) : IsCompact (f.toFun '' K) := by
  sorry

/-- The continuous image of a connected set is connected. -/
theorem continuous_image_of_connected {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f : C(X, Y)) {C : Set X} (hC : IsConnected C) : IsConnected (f.toFun '' C) := by
  sorry

/-- Continuous image of a separable space is separable. -/
theorem continuous_image_of_separable {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f : C(X, Y)) [TopologicalSpace.SeparableSpace X] [Continuous f.toFun] :
    TopologicalSpace.SeparableSpace Y := by
  sorry

end ContinuousPreserves

section OpenMapPreserves

/-- An open continuous map preserves first-countability under certain conditions. -/
theorem open_map_preserves_first_countable {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    {f : C(X, Y)} (hopen : OpenMap f.toFun) (hsurj : Function.Surjective f.toFun)
    [TopologicalSpace.FirstCountableTopology X] : TopologicalSpace.FirstCountableTopology Y := by
  sorry

end OpenMapPreserves

section EmbeddingPreserves

/-- An embedding preserves metrizability. -/
theorem embedding_subspace_of_metrizable {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (e : Embedding X Y) [MetricSpace Y] : MetricSpace X := by
  sorry

/-- Subspaces inherit the Hausdorff property. -/
theorem subspace_of_hausdorff_is_hausdorff {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (e : Embedding X Y) [T2Space Y] : T2Space X := by
  sorry

/-- Subspaces of second-countable spaces are second-countable. -/
theorem subspace_of_second_countable {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (e : Embedding X Y) [TopologicalSpace.SecondCountableTopology Y] :
    TopologicalSpace.SecondCountableTopology X := by
  sorry

end EmbeddingPreserves

section QuotientPreserves

/-- Quotients of compact spaces are compact. -/
theorem quotient_of_compact {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    {q : X → Y} (hq : QuotientMap X Y q) (hX : IsCompact (Set.univ : Set X)) :
    IsCompact (Set.univ : Set Y) := by
  sorry

/-- Quotients of connected spaces are connected. -/
theorem quotient_of_connected {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    {q : X → Y} (hq : QuotientMap X Y q) (hX : IsConnected (Set.univ : Set X)) :
    IsConnected (Set.univ : Set Y) := by
  sorry

end QuotientPreserves

section ProperPreserves

/-- Proper maps send closed sets to closed sets (when the codomain is
compactly generated and Hausdorff). -/
theorem proper_map_closed {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    {f : X → Y} (hf : Proper f) (hX : T2Space X) (hY : T2Space Y) : ClosedMap f := by
  sorry

/-- Proper maps preserve compactness in the forward direction (continuous image
of compact is compact). -/
theorem proper_image_of_compact {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    {f : C(X, Y)} (hf : Proper f.toFun) {K : Set X} (hK : IsCompact K) :
    IsCompact (f.toFun '' K) := by
  sorry

end ProperPreserves

section evals

/-- Continuous image of Bool (compact) is compact. -/
#eval "image_compact : continuous image of compact Bool is compact"

/-- Connectedness is preserved by continuous surjections. -/
#eval "image_connected : continuous image of connected set is connected"

/-- Hausdorff property is preserved by embeddings. -/
#eval "subspace_hausdorff : subspace of a Hausdorff space is Hausdorff"

end evals

end MiniContinuityHomeomorphism
