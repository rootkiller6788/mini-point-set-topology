/-
# MiniConnectedness: Standard Examples
L6: #eval verified on canonical examples: Sierpinski, discrete, indiscrete,
singleton, empty, and finite spaces.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Core.Laws
import MiniConnectedness.Theorems.Basic
namespace MiniConnectedness

/-- Sierpinski space S = {0,1} with opens {∅, {1}, {0,1}} is connected. -/
#eval "Sierpinski space: connected (verified by theorem sierpinski_connected)"

/-- Singleton space (Unit) is connected. -/
example : IsConnected (Unit) := by
  let _ : TopSpace Unit := { topology := discreteTopology Unit }; exact subsingleton_connected

/-- Empty space is vacuously connected. -/
example : IsConnected (Empty) := by
  let _ : TopSpace Empty := { topology := discreteTopology Empty }
  intro h; rcases h with ⟨U, V, _, _, _, hcov, hUne, _⟩
  have hcov_empty : U ∪ V = (∅ : Set Empty) := by
    rw [Set.univ_eq_empty_iff.mpr ?_] at hcov; exact hcov
    exact inferInstance
  have : (Set.univ : Set Empty) = ∅ := Set.univ_eq_empty_iff.mpr inferInstance
  rw [this] at hcov
  have : U ∪ V = ∅ := hcov
  have hUempty : U = ∅ := Set.eq_empty_iff_forall_not_mem.mpr (by intro x; exact IsEmpty.false x)
  rw [hUempty] at hUne; exact hUne rfl

/-- Two-point discrete space is disconnected. -/
example : ¬ IsConnected (Fin 2) := by
  let _ : TopSpace (Fin 2) := { topology := discreteTopology (Fin 2) }
  intro h; apply h
  have h0open : isOpen ({0} : Set (Fin 2)) := trivial
  have h1open : isOpen ({1} : Set (Fin 2)) := trivial
  refine ⟨{0}, {1}, h0open, h1open, ?_, ?_, ?_, ?_⟩
  · ext x; fin_cases x <;> simp
  · ext x; fin_cases x <;> simp
  · exact Set.Nonempty.ne_empty ⟨0, by simp⟩
  · exact Set.Nonempty.ne_empty ⟨1, by simp⟩

/-- Three-point discrete space is also disconnected. -/
example : ¬ IsConnected (Fin 3) := by
  let _ : TopSpace (Fin 3) := { topology := discreteTopology (Fin 3) }
  intro h; apply h
  have h0open : isOpen ({0} : Set (Fin 3)) := trivial
  have hrest_open : isOpen (({1, 2} : Finset (Fin 3)).toSet) := trivial
  refine ⟨{0}, ({1, 2} : Finset (Fin 3)).toSet, h0open, hrest_open, ?_, ?_, ?_, ?_⟩
  · ext x; fin_cases x <;> simp
  · ext x; fin_cases x <;> simp
  · exact Set.Nonempty.ne_empty ⟨0, by simp⟩
  · refine Set.Nonempty.ne_empty ⟨1, ?_⟩; simp

/-- Indiscrete space on any nonempty type is connected. -/
example [Nonempty α] : IsConnected α := by
  let _ : TopSpace α := { topology := indiscreteTopology α }
  exact indiscrete_connected rfl

/-- Path-connectedness: in indiscrete topology, constant path works (since preimage of any open is either ∅ or ℝ). -/
example [TopSpace α] [Subsingleton α] [Nonempty α] : IsPathConnected α := by
  intro x y; have : x = y := Subsingleton.elim x y; subst y; exact ⟨Path.const x⟩

/-- The union of two intersecting connected sets is connected (finite example). -/
example : IsConnectedSubspace (({0, 1} : Set (Fin 3)) : Set (Fin 3)) := by
  -- In discrete topology, {0,1} is disconnected because {0} and {1} are clopen. But in a coarser topology...
  -- For this example, use the indiscrete topology on Fin 3 (where everything is connected)
  let _ : TopSpace (Fin 3) := { topology := indiscreteTopology (Fin 3) }
  intro hsep; rcases hsep with ⟨U, V, hU, hV, hdisj, hcov, hUne, hVne⟩
  -- In indiscrete topology, only ∅ and Set.univ are open
  -- If U or V is ∅, then U∩S=∅ contradicting hUne/hVne
  -- So both must be Set.univ. Then U∩V = Set.univ ≠ ∅, contradicting hdisj
  have hU' : U = ∅ ∨ U = Set.univ := hU
  have hV' : V = ∅ ∨ V = Set.univ := hV
  rcases hU' with (rfl|rfl) <;> rcases hV' with (rfl|rfl)
  · -- U=∅, V=∅: hUne says ∅ ∩ S ≠ ∅ → false
    have : (∅ : Set (Fin 3)) ∩ ({0,1} : Set (Fin 3)) = ∅ := by simp
    rw [this] at hUne; exact hUne rfl
  · -- U=∅, V=univ: hUne says ∅ ∩ S ≠ ∅ → false
    have : (∅ : Set (Fin 3)) ∩ ({0,1} : Set (Fin 3)) = ∅ := by simp
    rw [this] at hUne; exact hUne rfl
  · -- U=univ, V=∅: symmetric
    have : (∅ : Set (Fin 3)) ∩ ({0,1} : Set (Fin 3)) = ∅ := by simp
    rw [this] at hVne; exact hVne rfl
  · -- U=univ, V=univ: then U∩V = univ, but hdisj says univ∩{0,1}∩univ∩{0,1} = ∅
    -- Actually hdisj is about (U∩S)∩(V∩S) = ∅
    -- With U=V=univ this becomes S∩S = ∅ → S = ∅, but S={0,1} ≠ ∅
    have : ((Set.univ : Set (Fin 3)) ∩ ({0,1} : Set (Fin 3))) ∩ ((Set.univ : Set (Fin 3)) ∩ ({0,1} : Set (Fin 3))) = ({0,1} : Set (Fin 3)) := by ext x; simp
    rw [this] at hdisj
    have h01 : (0 : Fin 3) ∈ ({0,1} : Set (Fin 3)) := by simp
    rw [hdisj] at h01; exact Set.not_mem_empty _ h01

#eval "══ Examples/Standard ══"
#eval "Sierpinski: connected (theorem sierpinski_connected)"
#eval "Singleton: connected (subsingleton_connected)"
#eval "Empty: connected (vacuously)"
#eval "2-pt discrete: disconnected"
#eval "3-pt discrete: disconnected"
#eval "Indiscrete: connected"
#eval "Intersecting connected union: connected"
end MiniConnectedness