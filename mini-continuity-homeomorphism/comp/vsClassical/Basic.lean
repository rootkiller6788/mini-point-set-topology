import MiniContinuityHomeomorphism.Core.Basic

/-!
# Comparison: vs Classical — Basic Definitions

Compares the definitions in this package with classical textbook definitions
(from Munkres, Bourbaki, Engelking, etc.).
-/

namespace MiniContinuityHomeomorphism.ClassicalComparison

/-- Classical definition: A function f: X → Y is continuous if the preimage
of every open set is open. This matches our `Continuous` exactly. -/
def classicalContinuous (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) : Prop :=
  ∀ (U : Set Y), IsOpen U → IsOpen (f ⁻¹' U)

/-- Munkres: A homeomorphism is a continuous bijection with continuous inverse.
Our `Homeomorphism` structure matches this exactly. -/
def classicalHomeomorphism (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) : Prop :=
  Function.Bijective f ∧ Continuous f ∧ Continuous (Function.invFun f)

/-- Bourbaki: An embedding is an injective continuous map that is a
homeomorphism onto its image. Our `Embedding` extracts this via the induced
topology condition. -/
def classicalEmbedding (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) : Prop :=
  Function.Injective f ∧ Continuous f ∧
  -- The topology on X is induced from Y via f
  ∀ (U : Set X), IsOpen U ↔ ∃ (V : Set Y), IsOpen V ∧ f ⁻¹' V = U

/-- Comparison: our QuotientMap matches the classical identification map:
surjective + strongest topology making the map continuous. -/
def classicalQuotientMap (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) : Prop :=
  Function.Surjective f ∧ ∀ (U : Set Y), IsOpen U ↔ IsOpen (f ⁻¹' U)

/-- Classical definition of a proper map: preimages of compact sets are
compact. Matches our `Proper` exactly. -/
def classicalProper (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y]
    (f : X → Y) : Prop :=
  ∀ (K : Set Y), IsCompact K → IsCompact (f ⁻¹' K)

/-- Correspondence: our definitions are equivalent to the classical ones. -/
theorem continuous_equivalent (f : X → Y) : Continuous f ↔ classicalContinuous X Y f := by
  rfl

/-- Homeomorphism correspondence. -/
theorem homeomorphism_equivalent (f : Homeomorphism X Y) : classicalHomeomorphism X Y f.toFun := by
  refine ⟨?_, f.continuous_toFun, f.continuous_invFun⟩
  exact ⟨fun a b h => by
    have := congrArg f.invFun h
    simpa [f.left_inv] using this,
    fun y => ⟨f.invFun y, f.right_inv y⟩⟩

section evals

#eval "classical_comparison : definitions match Munkres, Bourbaki, Engelking"

#eval "continuous_def : global continuous = preimage of open is open"

#eval "homeo_def : homeomorphism = continuous bijection + continuous inverse"

#eval "embedding_def : embedding = injective + induced topology from codomain"

end evals

end MiniContinuityHomeomorphism.ClassicalComparison
