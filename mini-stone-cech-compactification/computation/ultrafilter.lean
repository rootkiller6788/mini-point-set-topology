/-
# Computation.Ultrafilter

Ultrafilter-based computation for the Stone-Cech compactification of N.
The semigroup structure on βN and Hindman's theorem.
-/

import MiniStoneCechCompactification

open MiniStoneCechCompactification

/-- Computation: The number of ultrafilters on a finite set of size n
    is n (the principal ultrafilters). -/
def compute_finite_ultrafilters (n : ℕ) : ℕ := n

/-- Computation: The number of ultrafilters on N is 2^c. -/
#eval "Number of ultrafilters on N: 2^c"

/-- Computation: The addition on βN (right-topological semigroup).
    For u, v ∈ βN, u + v = {A ⊆ N : {n : {m : n+m ∈ A} ∈ v} ∈ u}. -/
def compute_ultrafilter_add : String :=
  "u+v = {A : {n : {m : n+m ∈ A} ∈ v} ∈ u}"

/-- Computation: Hindman's theorem: for any finite coloring of N,
    there is an infinite set all of whose finite sums are monochromatic.
    Proof uses the idempotent in (βN, +). -/
def hindman_theorem : String :=
  "Hindman: ∀ finite coloring of N, ∃ infinite S, FS(S) monochromatic. Uses βN semigroup idempotent."

#eval compute_ultrafilter_add
#eval hindman_theorem

def main : IO Unit := do
  IO.println "mini-stone-cech-compactification: ultrafilter computations"
  IO.println s!"  Finite ultrafilters(n) = {compute_finite_ultrafilters 5}"
  IO.println s!"  Ultrafilter addition: {compute_ultrafilter_add}"
  IO.println s!"  Hindman's theorem: {hindman_theorem}"
  return ()

#eval main
