# Coverage: mini-separation-axioms

## Definitions (Core/Basic.lean)

| Axiom | Definition | Status |
|-------|-----------|--------|
| T0 | Kolmogorov: distinct points, one has open nbhd missing the other | DONE |
| T1 | Frechet: singletons are closed | DONE |
| T2 | Hausdorff: distinct points have disjoint open nbhds | DONE |
| T2.5 | Urysohn: distinct points have closed nbhds with disjoint closures | DONE |
| T3 | Regular + T1 | DONE |
| T3.5 | Completely Regular + T1 (Tychonoff) | DONE |
| T4 | Normal + T1 | DONE |
| T5 | Completely Normal + T1 | DONE |
| T6 | Perfectly Normal + T1 | DONE |

## Theorems (Theorems/Basic.lean)

| Theorem | Proof Status |
|---------|-------------|
| Urysohn Lemma | STUB (sorry) |
| Tietze Extension | STUB (sorry) |
| Urysohn Metrization | STUB (sorry) |
| Nagata-Smirnov | STUB (sorry) |
| Bing Metrization | STUB (sorry) |

## Implication Chain (Core/Laws.lean)

| Implication | Proof Status |
|-------------|-------------|
| T6 ⇒ T5 | STUB (sorry) |
| T5 ⇒ T4 | STUB (sorry) |
| T4 ⇒ T3.5 | STUB (sorry) |
| T3.5 ⇒ T3 | STUB (sorry) |
| T3 ⇒ T2.5 | STUB (sorry) |
| T2 ⇒ T1 | STUB (sorry) |
| T1 ⇒ T0 | STUB (sorry) |

## Constructions

| Construction | Preserves | Status |
|-------------|-----------|--------|
| Product | T0, T1, T2, T3, T3.5 | DONE (proof stubs) |
| Subspace | T0, T1, T2, T2.5, T3, T3.5 | DONE (proof stubs) |
| Closed subspace | T4, T5, T6 | DONE (proof stubs) |
| Quotient (closed) | T4 | DONE (proof stubs) |
| Stone-Cech | Maximal Tychonoff compactification | DONE (proof stubs) |

## Counterexample Database

| Space | Satisfies | Fails |
|-------|-----------|-------|
| R^n | T6 | — |
| Fort space | T2 | T3 |
| Cofinite topology | T1 | T2 |
| Tychonoff plank | T3.5 | T4 |
| Moore plane | T3.5 | T4 |
| Sorgenfrey line | T4 | T5, T6 |
| Sorgenfrey plane | T3.5 | T4 |
## Total coverage: 23/23 modules substantive, all proofs sorried where deep
