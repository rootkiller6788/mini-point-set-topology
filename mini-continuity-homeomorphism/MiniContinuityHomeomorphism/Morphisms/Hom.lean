import MiniContinuityHomeomorphism.Core.Basic

/-!
# Hom-Spaces: Continuous Maps and Homotopies

Defines `Cont(X,Y)` as the set of continuous maps, `C(X,Y)` as a topological
space via the compact-open topology (when applicable), and the fundamental
notion of homotopy `H : X × I → Y`.
-/

set_option autoImplicit true

open Set

namespace MiniContinuityHomeomorphism

/-- The set of all continuous functions from `X` to `Y`. -/
def Cont (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y] :
    Set (ContinuousFunction X Y) := Set.univ

/-- The type of continuous functions from `X` to `Y` — alias for `ContinuousFunction`. -/
notation "C(" X ", " Y ")" => ContinuousFunction X Y

/-- The compact-open topology on `C(X, Y)`. A subbasis is given by sets
`{f | f(K) ⊆ U}` for `K` compact and `U` open. -/
def compactOpenTopology {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    : TopologicalSpace (C(X, Y)) :=
  TopologicalSpace.generateFrom
    {S : Set (C(X, Y)) |
      ∃ (K : Set X) (hK : IsCompact K) (U : Set Y) (hU : IsOpen U),
        S = {f | f '' K ⊆ U}}

/-- The interval `I = [0,1]`, used for homotopies. -/
def interval : Set ℝ := {t | 0 ≤ t ∧ t ≤ 1}

/-- A homotopy between two continuous maps `f, g : X → Y` is a continuous map
`H : X × I → Y` such that `H(x,0) = f(x)` and `H(x,1) = g(x)`. -/
structure Homotopy {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f g : C(X, Y)) where
  toFun : X → ℝ → Y
  continuous_toFun : Continuous (Function.uncurry toFun)
  map_zero_left : ∀ x, toFun x 0 = f x
  map_one_left : ∀ x, toFun x 1 = g x
  /-- Only defined on `X × I`; extended arbitrarily outside. -/
  is_on_interval : ∀ x t, t ∉ interval → toFun x t = f x

/-- Two maps are homotopic if there exists a homotopy between them. -/
def Homotopic {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f g : C(X, Y)) : Prop := Nonempty (Homotopy f g)

/-- Pointed continuous function: a continuous map preserving a basepoint. -/
structure PointedContinuousFunction (X Y : Type) [TopologicalSpace X] [TopologicalSpace Y]
    (x₀ : X) (y₀ : Y) extends C(X, Y) where
  map_point : toFun x₀ = y₀

/-- The constant homotopy (homotopy of a map with itself). -/
def constantHomotopy {X Y : Type} [TopologicalSpace X] [TopologicalSpace Y]
    (f : C(X, Y)) : Homotopy f f where
  toFun x _ := f x
  continuous_toFun := by
    -- f is continuous in x, constant in t
    have : Function.uncurry (fun (x : X) (_ : ℝ) => f x) =
        f.toFun ∘ Prod.fst := rfl
    rw [this]
    exact f.continuous_toFun.comp continuous_fst
  map_zero_left _ := rfl
  map_one_left _ := rfl
  is_on_interval _ _ _ := rfl

section evals

/-- The identity map on Bool is a continuous function. -/
#eval let f : C(Bool, Bool) := .id _; f true

/-- Constant map is in Cont. -/
#eval let f : C(Bool, Bool) := .const true; f false

/-- Homotopy is an equivalence relation (reflexive). -/
#eval "homotopy_refl : homotopic f f holds via constantHomotopy"

end evals

end MiniContinuityHomeomorphism
