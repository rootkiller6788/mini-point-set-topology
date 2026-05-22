import MiniSeparationAxioms

-- Benchmark targets for mini-separation-axioms
-- Each target: file:line with status
-- Status: DONE | STUB | MISSING

def targets : List (String × String) := [
  ("MiniSeparationAxioms/Core/Basic.lean:17", "DONE"),     -- T0
  ("MiniSeparationAxioms/Core/Basic.lean:22", "DONE"),     -- T1
  ("MiniSeparationAxioms/Core/Basic.lean:28", "DONE"),     -- T2
  ("MiniSeparationAxioms/Core/Basic.lean:34", "DONE"),     -- T2.5
  ("MiniSeparationAxioms/Core/Basic.lean:40", "DONE"),     -- Regular
  ("MiniSeparationAxioms/Core/Basic.lean:46", "DONE"),     -- T3
  ("MiniSeparationAxioms/Core/Basic.lean:52", "DONE"),     -- CompletelyRegular
  ("MiniSeparationAxioms/Core/Basic.lean:58", "DONE"),     -- T3.5
  ("MiniSeparationAxioms/Core/Basic.lean:64", "DONE"),     -- Normal
  ("MiniSeparationAxioms/Core/Basic.lean:69", "DONE"),     -- T4
  ("MiniSeparationAxioms/Core/Basic.lean:75", "DONE"),     -- CompletelyNormal
  ("MiniSeparationAxioms/Core/Basic.lean:80", "DONE"),     -- T5
  ("MiniSeparationAxioms/Core/Basic.lean:86", "DONE"),     -- PerfectlyNormal
  ("MiniSeparationAxioms/Core/Basic.lean:91", "DONE"),     -- T6
  ("MiniSeparationAxioms/Core/Basic.lean:97", "DONE"),     -- UrysohnLemma
  ("MiniSeparationAxioms/Core/Basic.lean:102", "DONE"),    -- TietzeExtension
  ("MiniSeparationAxioms/Core/Basic.lean:107", "DONE"),    -- UrysohnMetrization
  ("MiniSeparationAxioms/Core/Laws.lean:26", "DONE"),      -- AxiomRank
  ("MiniSeparationAxioms/Core/Laws.lean:60", "DONE"),      -- t6_implies_t5
  ("MiniSeparationAxioms/Core/Laws.lean:80", "DONE"),      -- t1_implies_t0
  ("MiniSeparationAxioms/Morphisms/Iso.lean:17", "DONE"),  -- Homeomorphism
  ("MiniSeparationAxioms/Morphisms/Hom.lean:14", "DONE"),  -- IsClosedMap
  ("MiniSeparationAxioms/Morphisms/Hom.lean:19", "DONE"),  -- IsPerfectMap
  ("MiniSeparationAxioms/Constructions/Universal.lean:18", "DONE"), -- StoneCech
  ("MiniSeparationAxioms/Theorems/Basic.lean:20", "STUB"), -- urysohn_lemma
  ("MiniSeparationAxioms/Theorems/Basic.lean:42", "STUB"), -- tietze_extension
  ("MiniSeparationAxioms/Theorems/Basic.lean:60", "STUB")  -- urysohn_metrization
]

#eval show IO Unit from do
  let mut done := 0
  let mut stub := 0
  for (target, status) in targets do
    if status == "DONE" then done := done + 1
    if status == "STUB" then stub := stub + 1
  let total := targets.length
  IO.println s!"Benchmark.CoreCoverage: {done}/{total} done, {stub}/{total} stubs"
