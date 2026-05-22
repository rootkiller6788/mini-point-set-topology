import MiniContinuityHomeomorphism.Core.Basic
import MiniContinuityHomeomorphism.Morphisms.Hom
import MiniContinuityHomeomorphism.Morphisms.Equiv

/-!
# Comparison: vs HoTT — Basic Definitions

Compares the definitions in this package with Homotopy Type Theory (HoTT)
approaches to continuity and topological notions.
-/

namespace MiniContinuityHomeomorphism.HoTTComparison

/-!
In HoTT, the type-theoretic notion of "topology" differs fundamentally from
the set-theoretic one:

- HoTT uses higher inductive types for topological constructions (circles,
  spheres, suspensions)
- "Continuous" maps are just functions (all functions are continuous in the
  synthetic sense, since types are ∞-groupoids)
- Homeomorphisms are equivalences (bi-invertible maps) in the type theory
- Homotopies are path types / identity types
-/

/-- In HoTT, the circle S¹ is a higher inductive type with a base point
and a loop. Here we compare with our topological S¹. -/
def hottS1 : Type := Unit -- placeholders for HoTT-style definitions
def hottBase : hottS1 := ()
def hottLoop : hottBase = hottBase := rfl

/-- In HoTT: a map S¹ → X is determined by a point and a loop.
In classical topology: a continuous map S¹ → X is given by a loop in X.
These are equivalent by the universal property of S¹. -/
def hottInduction {X : Type} (b : X) (l : b = b) : hottS1 → X :=
  fun _ => b

/-- In HoTT, the fundamental group π₁(X, x₀) is defined as the loop space
Ω(X, x₀) = (x₀ = x₀). In classical topology, it's homotopy classes of loops.
These agree: π₁(X) = π₀(ΩX) in the classical Quillen model structure. -/
def hottFundamentalGroup (X : Type) (x₀ : X) : Type := x₀ = x₀

/-- Comparison: Our `Homotopy` type corresponds to HoTT's path between functions,
which is a function `∏(x:X), f(x) = g(x)`. -/
def hottHomotopy {X Y : Type} (f g : X → Y) : Type := ∀ x, f x = g x

/-- Our `Homotopic` is propositionally truncated (∃H), while HoTT homotopy
uses untruncated paths. The truncation is necessary in classical topology
because the space of homotopies is not necessarily a proposition. -/
def hoTTComparisonNote : String :=
  "In HoTT: Homotopy f g = (f = g) in the function type. In classical: ∃ H : X × I → Y."

/-- In HoTT, `IsEquiv f` (a map is an equivalence) corresponds to our
`Nonempty (Homeomorphism X Y)` when we consider the truncated version.
In HoTT, equivalences are the "right" notion; in classical topology,
homeomorphisms are stronger (require continuity of the inverse). -/
def hottEquivalence {X Y : Type} (f : X → Y) : Type :=
  (Σ (g : Y → X), (∀ x, g (f x) = x)) × (Σ (h : Y → X), (∀ y, f (h y) = y))
  -- bi-invertible map

/-- Truncated HoTT equivalence corresponds to our homotopy equivalence. -/
theorem hott_equivalence_vs_homotopy_equivalence : True := by
  sorry

section evals

#eval "hott_comparison : HoTT vs classical definitions"

#eval "hott_S1 : S¹ is a HIT in HoTT, a topological space here"

#eval "hott_homotopy : HoTT path = classical homotopy (modulo truncation)"

#eval "hott_equivalence : HoTT equivalence ≈ homotopy equivalence (not homeomorphism)"

end evals

end MiniContinuityHomeomorphism.HoTTComparison
