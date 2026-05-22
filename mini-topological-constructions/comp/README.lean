/-
# Comparison Directory

This directory contains comparative analyses of the
MiniTopologicalConstructions kernel against other formalizations.

## Contents

- `vsClassical/Classical.lean` -- Classical topology textbooks
  - Munkres: "Topology" (2nd ed.) -- standard reference
  - Hatcher: "Algebraic Topology" -- CW complexes, homotopy theory
  - May: "A Concise Course in Algebraic Topology" -- modern approach

- `vsHoTT/HoTT.lean` -- Homotopy Type Theory (Univalent Foundations)
  - HoTT Book: higher inductive types as topological constructions
  - Suspension ΣX as a HIT: constructors N, S, merid : X → N = S
  - Join X * Y as a HIT: constructors inl, inr, glue

## Comparison Points

### Classical vs Kernel
| Construction    | Classical Definition                    | Kernel Definition              |
|-----------------|----------------------------------------|--------------------------------|
| Product topology| Tychonoff: coarsest making proj cont.  | ProductTopology type/Prop      |
| Quotient        | Finest making quotient map cont.       | QuotientTopology type/Prop     |
| Wedge sum X ∨ Y | X ⊔ Y / {x₀} ∼ {y₀}                   | WedgeSum type/Prop             |
| Smash X ∧ Y     | (X × Y) / (X ∨ Y)                      | SmashProduct type/Prop         |
| Suspension ΣX   | (X × I) / (X × {0,1})                  | Suspension type/Prop           |
| Cone CX         | X × I / X × {1}                        | Cone type/Prop                 |
| Mapping cyl M_f | (X × I) ⊔ Y / (x,0) ∼ f(x)             | MappingCylinder type/Prop      |

### HoTT vs Kernel
The HoTT approach uses higher inductive types (HITs) where
path constructors are primitive. The set-level kernel uses
Set/Prop-based quotient constructions that correspond to
the 0-truncation of HoTT HITs.

### Key Differences
1. **HoTT path constructors** encode homotopy information (∞-groupoid structure)
2. **Kernel set-level** approach captures only the 0-truncation
3. HoTT axioms are constructive; kernel uses classical Prop axioms
4. Both approaches can be reconciled by restricting HoTT to h-sets

## References
- Munkres, J. "Topology" (Prentice Hall, 2000)
- Hatcher, A. "Algebraic Topology" (Cambridge, 2002)
- Univalent Foundations Program "Homotopy Type Theory" (2013)
- May, J.P. "A Concise Course in Algebraic Topology" (Chicago, 1999)
-/

#eval "Comparison directory: vsClassical and vsHoTT subdirectories"
#eval "  vsClassical/Classical.lean -- Munkres, Hatcher, May comparisons"
#eval "  vsHoTT/HoTT.lean -- Homotopy Type Theory (Univalent Foundations)"
#eval "Key difference: HoTT HITs encode ∞-groupoid structure; kernel uses set-level Prop"
