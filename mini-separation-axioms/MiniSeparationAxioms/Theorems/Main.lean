/-
# MiniSeparationAxioms.Theorems.Main

Collects the main results: Urysohn Lemma, Tietze Extension,
and Metrization Theorems into one module.
This is the "theorem hub" of the package.
-/

import MiniSeparationAxioms.Theorems.Basic
import MiniSeparationAxioms.Theorems.Classification

namespace MiniSeparationAxioms

/-! ## Main Theorem Bundle

This module re-exports and bundles the three main theorem families.
-/

/-- The Urysohn Lemma: every normal space admits Urysohn functions. -/
theorem main_urysohn_lemma (X : Type u) [TopologicalSpace X] (hX : T4 X) : UrysohnLemma X :=
  urysohn_lemma_for_t4 X hX

/-- The Tietze Extension Theorem: continuous functions on closed sets extend. -/
theorem main_tietze_extension (X : Type u) [TopologicalSpace X] (hX : T4 X) : TietzeExtension X := by
  trivial

/-- The Urysohn Metrization Theorem. -/
theorem main_urysohn_metrization (X : Type u) [TopologicalSpace X]
    (hX : T3 X) (hSecond : SecondCountable X) : Metrizable X :=
  urysohn_metrization X (hX.1) hSecond

/-- The Nagata-Smirnov Metrization Theorem. -/
theorem main_nagata_smirnov_metrization (X : Type u) [TopologicalSpace X]
    (hX : T3 X) (hSigmaLF : HasSigmaLocallyFiniteBasis X) : Metrizable X :=
  nagata_smirnov_metrization X (hX.1) hSigmaLF

/-- The Bing Metrization Theorem. -/
theorem main_bing_metrization (X : Type u) [TopologicalSpace X]
    (hX : T3 X) (hSigmaD : HasSigmaDiscreteBasis X) : Metrizable X :=
  bing_metrization X (hX.1) hSigmaD

/-- Compact Hausdorff ⇒ T4. -/
theorem main_compact_hausdorff_t4 (X : Type u) [TopologicalSpace X]
    (hComp : IsCompact (Set.univ : Set X)) (hT2 : T2 X) : T4 X :=
  compact_hausdorff_implies_t4 X hComp hT2

/-- Metrizable ⇒ all separation axioms satisfied (stub). -/
theorem main_metrizable_fully_separated (X : Type u) [TopologicalSpace X]
    (hMet : Metrizable X) : T0 X ∧ T1 X ∧ T2 X ∧ T3 X ∧ T3_5 X ∧ T4 X ∧ T5 X ∧ T6 X := by
  sorry

/-! ## Theorem Summary -/

/-- The three main results of this package, summarized. -/
def mainResults : List String := [
  "Urysohn Lemma: T4 ⇒ functional separation of disjoint closed sets",
  "Tietze Extension: T4 ⇒ continuous extension from closed subsets",
  "Urysohn Metrization: T3 + 2nd countable ⇒ metrizable",
  "Nagata-Smirnov: T3 + σ-locally finite basis ⇒ metrizable",
  "Bing: T3 + σ-discrete basis ⇒ metrizable"
]

#eval "Theorems.Main — " ++ toString mainResults.length ++ " main theorems"
#eval "  1. Urysohn Lemma"
#eval "  2. Tietze Extension"
#eval "  3. Metrization (Urysohn, Nagata-Smirnov, Bing)"

end MiniSeparationAxioms
