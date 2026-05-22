# mini-topological-constructions -- Dependency

## Imports

- `MiniObjectKernel.Core.Basic` -- for the `Object` typeclass
- `MiniTopologicalConstructions.Core.Basic` -- 16 construction types (self-contained)
- All other modules import from Core.Basic or siblings within the package

## Internal Dependencies

```
Core.Basic (standalone)
  ← Core.Objects (uses MiniObjectKernel + Core.Basic)
  ← Core.Laws (uses Core.Basic)

Morphisms.Hom (uses Core.Basic)
  ← Morphisms.Iso (uses Hom)
  ← Morphisms.Equiv (uses Hom + Iso)

Constructions.Products (uses Core.Basic + Morphisms.Hom)
Constructions.Quotients (uses Core.Basic + Morphisms.Hom)
Constructions.Subobjects (uses Core.Basic + Morphisms.Hom)
Constructions.Universal (uses Core.Basic + Morphisms.Hom + Products + Subobjects)

Properties.Invariants (uses Core.Basic + Morphisms.Hom)
Properties.Preservation (uses Core.Basic + Morphisms.Hom + Equiv)
Properties.ClassificationData (uses Core.Basic + Morphisms.Hom)

Theorems.Basic (uses Core + Laws + Morphisms.Hom + Iso + Equiv)
Theorems.Classification (uses Core + Morphisms.Hom + Properties.ClassificationData)
Theorems.Main (uses Core + Morphisms.Hom + Equiv + Theorems.Basic)
Theorems.UniversalProperties (uses Core + Morphisms.Hom + Constructions.Universal)

Examples.Standard (uses Core + Morphisms.Hom + Iso)
Examples.Counterexamples (uses Core + Constructions.Products)

Bridges.* (uses Core + Morphisms.Hom)
```

## External Dependencies

| Package | Used By | Purpose |
|---------|---------|---------|
| mini-object-kernel | Core.Objects | Object typeclass |
| mini-topological-spaces | (referenced in lakefile) | Future type definitions |
