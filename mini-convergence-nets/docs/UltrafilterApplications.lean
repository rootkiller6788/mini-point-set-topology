/-
# Ultrafilters: Theory and Applications

## Definition

An ultrafilter U on a set X is a maximal proper filter. Equivalently:
  For every subset A ⊆ X, either A ∈ U or X \ A ∈ U (but not both).

## Existence

- **Principal ultrafilters**: U_x = {A ⊆ X | x ∈ A} for any x ∈ X.
- **Non-principal ultrafilters**: Exist on any infinite set, but their existence
  requires a weak form of the Axiom of Choice (the Boolean Prime Ideal Theorem).

## Key Properties

1. **Maximality**: Any filter containing an ultrafilter is either equal to it or improper.
2. **Prime property**: If A ∪ B ∈ U, then A ∈ U or B ∈ U.
3. **Convergence**: In a compact space, EVERY ultrafilter converges.

## Major Applications

### 1. Tychonoff's Theorem
The product of compact spaces is compact.
*Ultrafilter proof*: Take an ultrafilter U on the product. For each factor, the pushforward
π_*(U) is an ultrafilter, which converges to some x_i by compactness. Then (x_i) is a limit of U.

### 2. Stone-Čech Compactification
βX = {ultrafilters on X}. The embedding X → βX sends x to the principal ultrafilter at x.
βX is the unique compact Hausdorff space such that every continuous map X → K (K compact Hausdorff)
extends uniquely to βX → K.

### 3. Stone Duality
For a Boolean algebra B, its Stone space S(B) = {ultrafilters on B}.
This gives an equivalence: BooleanAlgebras^op ≅ StoneSpaces.

### 4. Wallman Compactification
For a T1 space X, the Wallman compactification wX consists of ultrafilters of closed sets.
It is a Hausdorff compactification of X.

### 5. Ramsey Theory
Ultrafilters on ℕ are used in the Galvin-Glazer proof of Hindman's theorem and
in the theory of idempotent ultrafilters for additive combinatorics.

## Constructive Status

Ultrafilter existence is NON-CONSTRUCTIVE. In ZF set theory without Choice, it is
consistent that there are no non-principal ultrafilters on ℕ.

Computationally:
- Principal ultrafilters are fully computable.
- Non-principal ultrafilters are not computable (no decidable membership predicate).

## Relationship to Nets

A *universal net* is a net such that for every set A, the net is eventually in A
or eventually in its complement. The eventuality filter of a universal net is an
ultrafilter, and conversely, every ultrafilter corresponds to a universal net.

-/

#eval "Ultrafilter applications documentation available"
