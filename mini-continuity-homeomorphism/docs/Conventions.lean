/-!
# Documentation: Conventions

Naming and notational conventions used throughout the
`MiniContinuityHomeomorphism` package.
-/

namespace MiniContinuityHomeomorphism.Conventions

/-!
## Naming Conventions

### Types and Structures
- `ContinuousFunction` — The type of continuous functions (not just a predicate)
- `Homeomorphism` — Structure with `toFun`, `invFun`, continuity proofs
- `Homotopy` — Structure with `toFun : X → ℝ → Y` and endpoint conditions
- `HomotopyEquivalence` — Mutual homotopy inverses

### Theorems
- `*_is_*` — Classification judgments (e.g., `hausdorff_is_topological_invariant`)
- `*_of_*` — Preservation (e.g., `continuous_image_of_compact`)
- Descriptive names for main theorems (`brouwer_fixed_point`, `borsuk_ulam`)

### Files
- `Core/` — Fundamental definitions and laws
- `Morphisms/` — Hom-spaces and equivalence notions
- `Constructions/` — Building new spaces/maps from old ones
- `Properties/` — Invariant and preservation meta-theory
- `Theorems/` — Major theorems (most proofs are `sorry`)
- `Examples/` — Concrete instances and counterexamples
- `Bridges/` — Connections to other mathematical areas
- `Utils/` — Support (notation, tactics)

## Notational Conventions

| Notation | Meaning |
|----------|---------|
| `X →C Y` | Type of continuous functions `C(X, Y)` |
| `X ≅ Y` | Type of homeomorphisms from `X` to `Y` |
| `X ≃ₕ Y` | Type of homotopy equivalences from `X` to `Y` |
| `f ≃ g` | `f` and `g` are homotopic |
| `cyl(f)` | Mapping cylinder of `f` |
| `cone(f)` | Mapping cone of `f` |
| `I` | The unit interval `[0, 1]` |
| `Homeo(X)` | The homeomorphism group of `X` |
| `ι[A]` | Inclusion of subspace `A` |

## Proof Conventions

- All non-trivial proofs in `Theorems/` are deferred via `sorry`
- Basic structural proofs (composition, inverses) are completed
- `#eval` statements are used for concrete verification where possible

## Dependency Conventions

- `mini-object-kernel` provides `Object`, `Theory`, and metalevel reflection
- `mini-topological-spaces` provides `TopologicalSpace`, `Continuous`, `IsOpen`, etc.
- Internal dependencies flow: `Core → Morphisms/Constructions → Properties/Theorems → Examples → Bridges`

#eval "conventions_documentation : naming and notational conventions"
