/-
# Convergence Theory: Nets, Filters, and Ultrafilters

## Historical Context

The theory of convergence in topological spaces evolved through three key ideas:

1. **Sequences** (early 20th century): Work well in metric spaces but fail in general topology
   because the natural numbers as an index set are too restrictive.

2. **Nets** (Moore-Smith, 1922): Generalize sequences by replacing ℕ with any directed set.
   This allows convergence to properly characterize topology.

3. **Filters** (Cartan, 1937): A dual approach using collections of sets. Ultrafilters
   (maximal filters) give the most powerful convergence theory.

## The Net↔Filter Equivalence

Every net φ : α → X determines its *eventuality filter*:
  F_φ = {A ⊆ X | φ is eventually in A}

Conversely, every filter F determines a net indexed by F itself (ordered by reverse inclusion):
  φ_F(s) = some element of s

These constructions are inverses *up to equivalence of convergence*:
  x_α → x  ⇔  F_φ converges to x

## Why Ultrafilters Matter

Ultrafilters are the maximal possible filters. They have the crucial property:
  For every set A, exactly one of A or its complement is in the ultrafilter.

This makes them ideal for proving:
- **Tychonoff's theorem**: The product of compact spaces is compact.
  (Proof: an ultrafilter on the product projects to ultrafilters on factors,
   which converge by compactness; their limits give the limit of the original.)

- **Stone-Čech compactification**: βX is the space of all ultrafilters on X.

## Convergence Spaces

A *convergence space* abstracts the notion of convergence without requiring a topology.
It consists of a relation "φ → x" between nets and points satisfying:
1. Constant nets converge to their value.
2. Subnets of convergent nets converge to the same limit.

Convergence spaces form a broader category than topological spaces, including:
- Limit spaces (unique limits)
- Kent convergence spaces (diagonal condition)
- Pseudotopological spaces (defined via ultrafilters)

## Cardinal Invariants

- **sequentialOrder(X)**: Number of iterations of sequential closure to obtain full closure.
- **tightness t(X)**: Smallest cardinal κ such that closures are determined by subsets of size ≤ κ.
- **character χ(X)**: Smallest cardinality of a neighborhood basis at each point.
-/

#eval "Convergence theory documentation available"
