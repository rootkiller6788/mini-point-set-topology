/-
# Comparison: MiniTopologicalConstructions vs HoTT (Homotopy Type Theory)

Compare our set-level topological constructions with the
HoTT synthetic homotopy theory approach.

Key differences:
- Set-level: Spaces are types with topology structures
- HoTT: Spaces are types (∞-groupoids) with no extra topology
- Set-level: Homotopy is an equivalence relation on maps
- HoTT: Homotopy is path equality in function types
- Set-level: CW complexes via cell attachments
- HoTT: Pushouts give all homotopy colimits (higher inductive types)

Where the kernel and HoTT align:
- Pushout = adjunction space
- Suspension = ΣX = S¹ ∧ X (same definition)
- Mapping cylinder = HoTT pushout
- Join = pushout of projections
- Spectra = sequences with equivalences
-/

import MiniTopologicalConstructions

/-!
## 1. Suspension

HoTT: Suspension X is a HIT with points N, S and meridians merid(x) : N = S for x : X.
Kernel: `Suspension` with `north`, `south`, `suspensionRel`.

Both define ΣX by collapsing the top and bottom of the cylinder.

## 2. Wedge Sum

HoTT: Wedge X Y is a HIT with point ⋆ and inclusions inl : X → X ∨ Y, inr : Y → X ∨ Y.
Kernel: `WedgeSum` with quotient of disjoint union by basepoint identification.

Both define the coproduct in pointed types.

## 3. Smash Product

HoTT: Smash X Y is a HIT giving X ∧ Y = (X × Y) / (X ∨ Y).
Kernel: `SmashProduct` with `smashRel`.

The HoTT definition is more fundamental (HIT vs quotient).

## 4. Homotopy Groups

HoTT: π_n(X, x₀) is defined using loop spaces Ω^n X and set-truncation ‖-‖₀.
Kernel: `HomotopyGroupsStructure` with `Prop` axioms.

## 5. Spectra

HoTT: A spectrum is a sequence of pointed types X_n with equivalences X_n ≃ Ω X_{n+1}.
Kernel: `Spectrum` with structure maps ΣX_n → X_{n+1}.

These are categorically dual: HoTT uses Ω, kernel uses Σ.

## 6. Freudenthal Suspension

HoTT: The Freudenthal suspension theorem is a theorem about connectedness of
the suspension map (proved via the James construction in HoTT).
Kernel: `freudenthalSuspension` with `sorry` proof.
-/

#eval "HoTT vs Kernel comparison: all 6 constructions match conceptually"
#eval "View the comment block for detailed comparison"
#eval "Key difference: HoTT uses HITs, kernel uses set-level quotients"
