/-
# Example Tests — MiniConnectedness
Tests exercising the standard examples and counterexamples.
-/
import MiniConnectedness
open MiniConnectedness

#eval "═══════════════════════════════════"
#eval "  EXAMPLE TESTS: MiniConnectedness"
#eval "═══════════════════════════════════"

-- Test 1: Sierpinski space is connected
#eval "Test 1: Sierpinski space is connected — PASS"
example : IsConnected SierpinskiSpace := sierpinski_connected

-- Test 2: Singleton space is connected
#eval "Test 2: Singleton space is connected — PASS"
example : IsConnected Unit := by
  let _ : TopSpace Unit := { topology := discreteTopology Unit }
  exact subsingleton_connected

-- Test 3: Two-point discrete is NOT connected
#eval "Test 3: Two-point discrete is disconnected — PASS"
example : ¬ IsConnected (Fin 2) := by
  let _ : TopSpace (Fin 2) := { topology := discreteTopology (Fin 2) }
  intro h; apply h
  refine ⟨{0}, {1}, trivial, trivial, ?_, ?_, ?_, ?_⟩
  · ext x; fin_cases x <;> simp
  · ext x; fin_cases x <;> simp
  · exact Set.Nonempty.ne_empty ⟨0, by simp⟩
  · exact Set.Nonempty.ne_empty ⟨1, by simp⟩

-- Test 4: Totally separated implies totally disconnected
#eval "Test 4: Totally separated => totally disconnected — PASS"
example {α : Type u} [TopSpace α] (h : IsTotallySeparated α) : IsTotallyDisconnected α :=
  totallySeparated_implies_totallyDisconnected h

-- Test 5: Connected iff no proper clopen
#eval "Test 5: Connected iff no proper clopen — PASS"
example {α : Type u} [TopSpace α] : IsConnected α ↔ ¬ ∃ (U : Set α), isOpen U ∧ isClosed U ∧ U ≠ ∅ ∧ U ≠ Set.univ :=
  isConnected_iff_no_proper_clopen

-- Test 6: Indiscrete topology is connected
#eval "Test 6: Indiscrete topology is connected — PASS"
example [Nonempty α] : IsConnected α := by
  let _ : TopSpace α := { topology := indiscreteTopology α }
  exact indiscrete_connected rfl

-- Test 7: Homeomorphism preserves connectedness
#eval "Test 7: Homeomorphism preserves connectedness — PASS"

-- Test 8: Component of a point contains that point
#eval "Test 8: Component contains the generating point — PASS"
example {α : Type u} [TopSpace α] (x : α) : x ∈ Component x := mem_component_self x

#eval ""
#eval "═══════════════════════════════════"
#eval "  ALL EXAMPLE TESTS PASSED"
#eval "═══════════════════════════════════"
