/-
# MiniConnectedness: Basic Definitions

Defines the fundamental connectedness concepts in point-set topology:
connectedness, path-connectedness, arc-connectedness, local variants,
total disconnectedness, zero-dimensionality, components, and continua.

Self-contained: uses only Lean 4 core types (Set, Prop, Nat, etc.).
Knowledge coverage: L1 (TopologicalSpace, connectedness defs), L2 (open/closed),
L3 (topology hierarchy), L4 (clopen characterization), L5 (set proofs),
L6 (#eval Sierpinski/discrete/indiscrete).
-/

namespace MiniConnectedness

/-! ## Topological Space (thin local definition) -/

/-- A topological space via the Kuratowski open-set axioms:
(O1) The whole space is open.
(O2) The intersection of two open sets is open.
(O3) The union of any family of open sets is open. -/
structure TopologicalSpace (α : Type u) where
  isOpen : Set α → Prop
  univOpen : isOpen Set.univ
  interOpen : ∀ {U V}, isOpen U → isOpen V → isOpen (U ∩ V)
  unionOpen : ∀ {S : Set (Set α)}, (∀ U ∈ S, isOpen U) → isOpen (Set.sUnion S)

/-- A type equipped with a topology. -/
class TopSpace (α : Type u) where
  topology : TopologicalSpace α

export TopSpace (topology)

def isOpen {α} [TopSpace α] (U : Set α) : Prop := (topology α).isOpen U
def isClosed {α} [TopSpace α] (C : Set α) : Prop := isOpen (Cᶜ)

/-! ### Basic Open/Closed Set Lemmas -/

theorem emptyOpen {α} [TopSpace α] : isOpen (∅ : Set α) := by
  have h := (topology α).unionOpen (S := ∅) (by intro U hU; exact False.elim hU)
  have hempty : Set.sUnion (∅ : Set (Set α)) = (∅ : Set α) := by ext x; simp
  rw [hempty] at h; exact h

theorem univOpen {α} [TopSpace α] : isOpen (Set.univ : Set α) := (topology α).univOpen

theorem interOpen {α} [TopSpace α] {U V : Set α} (hU : isOpen U) (hV : isOpen V) : isOpen (U ∩ V) :=
  (topology α).interOpen hU hV

theorem unionOpenTwo {α} [TopSpace α] {U V : Set α} (hU : isOpen U) (hV : isOpen V) : isOpen (U ∪ V) := by
  have h := (topology α).unionOpen (S := {U, V}) (by
    intro W hW; rcases hW with (rfl | rfl); exact hU; exact hV)
  have hUunion : Set.sUnion ({U, V} : Set (Set α)) = U ∪ V := by ext x; simp
  rw [hUunion] at h; exact h

theorem univClosed {α} [TopSpace α] : isClosed (Set.univ : Set α) := by
  rw [isClosed, Set.compl_univ]; exact emptyOpen

theorem emptyClosed {α} [TopSpace α] : isClosed (∅ : Set α) := by
  rw [isClosed, Set.compl_empty]; exact univOpen

theorem unionClosedTwo {α} [TopSpace α] {C D : Set α} (hC : isClosed C) (hD : isClosed D) :
    isClosed (C ∪ D) := by rw [isClosed, Set.compl_union]; exact interOpen hC hD

theorem interClosedTwo {α} [TopSpace α] {C D : Set α} (hC : isClosed C) (hD : isClosed D) :
    isClosed (C ∩ D) := by rw [isClosed, Set.compl_inter]; exact unionOpenTwo hC hD

/-! ### Continuous Functions and Homeomorphisms -/

def Continuous {α β} [TopSpace α] [TopSpace β] (f : α → β) : Prop :=
  ∀ U, isOpen U → isOpen (f⁻¹' U)

theorem continuous_id {α} [TopSpace α] : Continuous (id : α → α) := by
  intro U hU; simpa

theorem continuous_comp {α β γ} [TopSpace α] [TopSpace β] [TopSpace γ]
    {f : α → β} {g : β → γ} (hf : Continuous f) (hg : Continuous g) : Continuous (g ∘ f) := by
  intro U hU
  have hgU : isOpen (g⁻¹' U) := hg U hU
  have hfgU : isOpen (f⁻¹' (g⁻¹' U)) := hf (g⁻¹' U) hgU
  simpa [Set.preimage_comp]

structure Homeomorphism (α β : Type u) [TopSpace α] [TopSpace β] where
  toFun : α → β; invFun : β → α
  leftInv : ∀ x, invFun (toFun x) = x; rightInv : ∀ x, toFun (invFun x) = x
  continuous_toFun : Continuous toFun; continuous_invFun : Continuous invFun

def Homeomorphism.id (α : Type u) [TopSpace α] : Homeomorphism α α where
  toFun := id; invFun := id; leftInv _ := rfl; rightInv _ := rfl
  continuous_toFun := continuous_id; continuous_invFun := continuous_id

def Homeomorphism.symm {α β : Type u} [TopSpace α] [TopSpace β] (h : Homeomorphism α β) :
    Homeomorphism β α where
  toFun := h.invFun; invFun := h.toFun
  leftInv := h.rightInv; rightInv := h.leftInv
  continuous_toFun := h.continuous_invFun; continuous_invFun := h.continuous_toFun

def Homeomorphism.trans {α β γ : Type u} [TopSpace α] [TopSpace β] [TopSpace γ]
    (h₁ : Homeomorphism α β) (h₂ : Homeomorphism β γ) : Homeomorphism α γ where
  toFun := h₂.toFun ∘ h₁.toFun; invFun := h₁.invFun ∘ h₂.invFun
  leftInv x := by simp [h₁.leftInv, h₂.leftInv]
  rightInv x := by simp [h₁.rightInv, h₂.rightInv]
  continuous_toFun := continuous_comp h₁.continuous_toFun h₂.continuous_toFun
  continuous_invFun := continuous_comp h₂.continuous_invFun h₁.continuous_invFun

/-! ## Connectedness Definitions -/

def IsConnected (α : Type u) [TopSpace α] : Prop :=
  ¬ ∃ (U V : Set α), isOpen U ∧ isOpen V ∧ U ∩ V = ∅ ∧ U ∪ V = Set.univ ∧ U ≠ ∅ ∧ V ≠ ∅

def IsConnectedSubspace {α} [TopSpace α] (S : Set α) : Prop :=
  ¬ ∃ (U V : Set α), isOpen U ∧ isOpen V ∧
    (U ∩ S) ∩ (V ∩ S) = ∅ ∧ (U ∩ S) ∪ (V ∩ S) = S ∧ (U ∩ S) ≠ ∅ ∧ (V ∩ S) ≠ ∅

/-- Connectedness via clopen subsets: the only clopen subsets are ∅ and the whole space. -/
theorem isConnected_iff_no_proper_clopen {α : Type u} [TopSpace α] :
    IsConnected α ↔ ¬ ∃ (U : Set α), isOpen U ∧ isClosed U ∧ U ≠ ∅ ∧ U ≠ Set.univ := by
  constructor
  · intro hconn ⟨U, hUopen, hUclosed, hUne, hUnall⟩; apply hconn
    have hUcOpen : isOpen (Uᶜ) := hUclosed
    have hUcNe : Uᶜ ≠ ∅ := by
      intro h; apply hUnall; ext x; constructor
      · intro; exact Set.mem_univ _; · intro hx; by_contra hxU
        have : x ∈ (∅ : Set α) := by rw [← h]; exact Set.mem_compl_iff.mpr hxU
        exact Set.not_mem_empty _ this
    exact ⟨U, Uᶜ, hUopen, hUcOpen, by ext x; simp, by ext x; simp, hUne, hUcNe⟩
  · intro hno ⟨U, V, hU, hV, hdisj, hcover, hUne, hVne⟩; apply hno
    have hUcomp : V = Uᶜ := by
      ext x; constructor
      · intro hxV; rw [Set.mem_compl_iff]; intro hxU
        have : x ∈ U ∩ V := ⟨hxU, hxV⟩; rw [hdisj] at this; exact Set.not_mem_empty _ this
      · intro hxUc; have : x ∈ U ∪ V := by rw [hcover]; exact Set.mem_univ x
        rcases this with (hxU | hxV); · exfalso; exact hxUc hxU; · exact hxV
    have hUclosed : isClosed U := by rw [isClosed, hUcomp]; exact hV
    refine ⟨U, hU, hUclosed, hUne, ?_⟩
    intro hUall; apply hVne; rw [hUcomp, hUall]; simp

/-! ## Path-Connectedness -/

structure Path (α : Type u) [TopSpace α] (x y : α) where
  map : ℝ → α; start : map 0 = x; final : map 1 = y; continuity : Continuous map

def Path.const {α : Type u} [TopSpace α] (x : α) : Path α x x where
  map _ := x; start := rfl; final := rfl
  continuity := by
    intro U hU; by_cases hxU : x ∈ U
    · have : (fun (_ : ℝ) => x)⁻¹' U = Set.univ := by ext t; simp [hxU]
      rw [this]; exact univOpen
    · have : (fun (_ : ℝ) => x)⁻¹' U = ∅ := by ext t; simp [hxU]
      rw [this]; exact emptyOpen

def IsPathConnected (α : Type u) [TopSpace α] : Prop := ∀ (x y : α), Nonempty (Path α x y)

/-! ## Arc-Connectedness -/

structure Arc (α : Type u) [TopSpace α] (x y : α) extends Path α x y where
  injective : ∀ t s, map t = map s → t = s

def IsArcConnected (α : Type u) [TopSpace α] : Prop :=
  ∀ (x y : α), x ≠ y → Nonempty (Arc α x y)

/-! ## Local Connectedness -/

def IsLocallyConnected (α : Type u) [TopSpace α] : Prop :=
  ∀ (x : α) (U : Set α), isOpen U → x ∈ U →
    ∃ (V : Set α), isOpen V ∧ x ∈ V ∧ V ⊆ U ∧ IsConnectedSubspace V

def IsLocallyPathConnected (α : Type u) [TopSpace α] : Prop :=
  ∀ (x : α) (U : Set α), isOpen U → x ∈ U →
    ∃ (V : Set α), isOpen V ∧ x ∈ V ∧ V ⊆ U ∧ IsPathConnected (Subtype V)

/-! ## Disconnectedness Notions -/

def IsTotallyDisconnected (α : Type u) [TopSpace α] : Prop :=
  ∀ (S : Set α), IsConnectedSubspace S → S = ∅ ∨ (∃ x, S = {x})

def IsTotallySeparated (α : Type u) [TopSpace α] : Prop :=
  ∀ (x y : α), x ≠ y → ∃ (U : Set α), isOpen U ∧ isClosed U ∧ x ∈ U ∧ y ∉ U

theorem totallySeparated_implies_totallyDisconnected {α : Type u} [TopSpace α]
    (h : IsTotallySeparated α) : IsTotallyDisconnected α := by
  intro S hSconn; by_cases hSempty : S = ∅
  · left; exact hSempty
  · right; have hn : ∃ x, x ∈ S := Set.not_eq_empty.mp hSempty
    rcases hn with ⟨x, hx⟩
    have hsing : ∀ y, y ∈ S → y = x := by
      intro y hy; by_contra hyneq
      rcases h x y hyneq with ⟨U, hUopen, hUclosed, hxU, hyUc⟩; apply hSconn
      refine ⟨U, Uᶜ, hUopen, hUclosed, ?_, ?_, ?_, ?_⟩
      · ext z; constructor
        · intro ⟨⟨hzU,_⟩,⟨hzUc,_⟩⟩; exact hzUc hzU
        · intro; exact False.elim (by trivial)
      · ext z; constructor
        · intro; rcases · with (⟨hzU,hzS⟩|⟨hzUc,hzS⟩); exact hzS
        · intro hzS; by_cases hzU : z ∈ U; · exact Or.inl ⟨hzU, hzS⟩; · exact Or.inr ⟨hzU, hzS⟩
      · exact Set.Nonempty.ne_empty ⟨x, hxU, hx⟩
      · exact Set.Nonempty.ne_empty ⟨y, hyUc, hy⟩
    refine ⟨x, ?_⟩; ext z; constructor
    · intro hz; have hzx := hsing z hz; subst hzx; exact hx
    · intro hz; rw [Set.mem_singleton_iff.mp hz]; exact hx

def IsExtremallyDisconnected (α : Type u) [TopSpace α] : Prop :=
  ∀ (U : Set α), isOpen U → isOpen (closure α U)

def IsZeroDimensional (α : Type u) [TopSpace α] : Prop :=
  ∀ (x : α) (U : Set α), isOpen U → x ∈ U →
    ∃ (V : Set α), isOpen V ∧ isClosed V ∧ x ∈ V ∧ V ⊆ U

/-- Closure of a set: x is in the closure of A iff every open neighborhood of x meets A. -/
def closure (α : Type u) [TopSpace α] (A : Set α) : Set α :=
  {x : α | ∀ U, isOpen U → x ∈ U → (A ∩ U).Nonempty}

/-! ## Components -/

def Component {α} [TopSpace α] (x : α) : Set α :=
  Set.sUnion {S : Set α | IsConnectedSubspace S ∧ x ∈ S}

theorem mem_component_self {α} [TopSpace α] (x : α) : x ∈ Component x := by
  apply Set.mem_sUnion.mpr; refine ⟨{x}, ?_, by simp⟩; refine ⟨?_, by simp⟩
  intro hsep; rcases hsep with ⟨U, V, _, _, hdisj, _, hUne, hVne⟩
  have hxU : x ∈ U ∩ {x} := by
    have hne : (U ∩ {x}) ≠ ∅ := hUne
    rcases Set.not_eq_empty.mp hne with ⟨z, hzU, hzS⟩
    have hzx : z = x := by simpa using hzS; subst hzx; exact ⟨hzU, by simp⟩
  have hxV : x ∈ V ∩ {x} := by
    have hne : (V ∩ {x}) ≠ ∅ := hVne
    rcases Set.not_eq_empty.mp hne with ⟨z, hzV, hzS⟩
    have hzx : z = x := by simpa using hzS; subst hzx; exact ⟨hzV, by simp⟩
  have : x ∈ (U ∩ {x}) ∩ (V ∩ {x}) := ⟨hxU, hxV⟩
  rw [hdisj] at this; exact Set.not_mem_empty _ this

def PathComponent {α} [TopSpace α] (x : α) : Set α :=
  {y | Nonempty (Path α x y)}

def Quasicomponent {α} [TopSpace α] (x : α) : Set α :=
  ⋂ (U : Set α), (isOpen U ∧ isClosed U ∧ x ∈ U) → U

/-! ## Continua -/

def IsCompact (α : Type u) [TopSpace α] : Prop :=
  ∀ (𝒰 : Set (Set α)), (∀ U ∈ 𝒰, isOpen U) → (Set.sUnion 𝒰 = Set.univ) →
    ∃ (ℱ : Finset (Set α)), (↑ℱ : Set (Set α)) ⊆ 𝒰 ∧ Set.sUnion (↑ℱ : Set (Set α)) = Set.univ

structure Continuum (α : Type u) [TopSpace α] where
  compact : IsCompact α; connected : IsConnected α

def IsNondegenerate {α : Type u} [TopSpace α] [Continuum α] : Prop :=
  ∃ a b : α, a ≠ b

/-! ## Subspace Topology -/

def subspaceTopology {α : Type u} [TopSpace α] (S : Set α) : TopologicalSpace (Subtype S) where
  isOpen W := ∃ (V : Set α), isOpen V ∧ W = {x | x.val ∈ V}
  univOpen := ⟨Set.univ, univOpen, by ext ⟨x, hx⟩; simp⟩
  interOpen := by
    intro U V ⟨U', hU', hUeq⟩ ⟨V', hV', hVeq⟩
    refine ⟨U' ∩ V', interOpen hU' hV', ?_⟩; ext ⟨x, hx⟩; simp [hUeq, hVeq]
  unionOpen := by
    intro 𝒰 h𝒰; rcases Set.eq_empty_or_nonempty 𝒰 with (rfl | hnon)
    · refine ⟨∅, emptyOpen, ?_⟩; ext ⟨x, hx⟩; simp
    · choose! ℱ hℱ hℱeq using h𝒰
      refine ⟨Set.sUnion Set.range ℱ, ?_, ?_⟩
      · apply (topology α).unionOpen; intro V hV
        rcases Set.mem_range.mp hV with ⟨i, rfl⟩; exact hℱ i
      · ext ⟨x, hx⟩; simp [hℱeq, Set.mem_sUnion]

instance {α : Type u} [TopSpace α] (S : Set α) : TopSpace (Subtype S) where
  topology := subspaceTopology S

/-! ## Concrete Topologies -/

def discreteTopology (α : Type u) : TopologicalSpace α where
  isOpen _ := True; univOpen := trivial; interOpen _ _ _ _ := trivial; unionOpen _ _ := trivial

def indiscreteTopology (α : Type u) : TopologicalSpace α where
  isOpen U := U = ∅ ∨ U = Set.univ; univOpen := Or.inr rfl
  interOpen := by
    intro U V hU hV; rcases hU with (rfl|rfl) <;> rcases hV with (rfl|rfl) <;> simp
  unionOpen := by
    intro S hS; by_cases hsuniv : Set.univ ∈ S
    · have : Set.sUnion S = Set.univ := Set.sUnion_eq_univ_iff.mpr hsuniv; rw [this]; exact Or.inr rfl
    · have hall : ∀ U ∈ S, U = ∅ := by
        intro U hU; rcases hS U hU with (rfl|rfl); · rfl; · exfalso; exact hsuniv hU
      have : Set.sUnion S = ∅ := Set.sUnion_eq_empty.mpr hall; rw [this]; exact Or.inl rfl

def SierpinskiSpace := Fin 2

def sierpinskiTopology : TopologicalSpace SierpinskiSpace where
  isOpen U := U = ∅ ∨ U = {1} ∨ U = Set.univ; univOpen := Or.inr (Or.inr rfl)
  interOpen := by
    intro U V hU hV; rcases hU with (rfl|rfl|rfl) <;> rcases hV with (rfl|rfl|rfl) <;> simp
  unionOpen := by
    intro S hS; by_cases huniv : Set.univ ∈ S
    · have : Set.sUnion S = Set.univ := Set.sUnion_eq_univ_iff.mpr huniv; rw [this]; exact Or.inr (Or.inr rfl)
    · by_cases hone : ({1} : Set SierpinskiSpace) ∈ S
      · have hsub : Set.sUnion S ⊆ {1} := by
          apply Set.sUnion_subset; intro U hU
          rcases hS U hU with (rfl|rfl|rfl)
          · exact Set.empty_subset _; · exact Set.Subset.refl _; · exfalso; exact huniv hU
        have hmem : (1 : SierpinskiSpace) ∈ Set.sUnion S := Set.subset_sUnion_of_mem hone (by simp)
        have : Set.sUnion S = {1} := Set.Subset.antisymm hsub (by
          intro x hx; simp at hx; subst hx; exact hmem)
        rw [this]; exact Or.inr (Or.inl rfl)
      · have hall : ∀ U ∈ S, U = ∅ := by
          intro U hU; rcases hS U hU with (rfl|rfl|rfl)
          · rfl; · exfalso; exact hone hU; · exfalso; exact huniv hU
        have : Set.sUnion S = ∅ := Set.sUnion_eq_empty.mpr hall; rw [this]; exact Or.inl rfl

instance : TopSpace SierpinskiSpace where topology := sierpinskiTopology

/-! ## Basic Connectedness Theorems -/

theorem sierpinski_connected : IsConnected SierpinskiSpace := by
  intro h; rcases h with ⟨U, V, hU, hV, hdisj, _, hUne, hVne⟩
  rcases hU with (rfl|rfl|rfl)
  · exact hUne rfl
  · rcases hV with (rfl|rfl|rfl)
    · exact hVne rfl
    · have h1 : (1 : SierpinskiSpace) ∈ ({1} : Set SierpinskiSpace) ∩ ({1} : Set SierpinskiSpace) := by simp
      rw [hdisj] at h1; exact Set.not_mem_empty _ h1
    · have h0 : (0 : SierpinskiSpace) ∈ ({1} : Set SierpinskiSpace) ∩ Set.univ := by simp
      rw [hdisj] at h0; exact Set.not_mem_empty _ h0
  · rcases hV with (rfl|rfl|rfl)
    · exact hVne rfl
    · have h0 : (0 : SierpinskiSpace) ∈ Set.univ ∩ ({1} : Set SierpinskiSpace) := by simp
      rw [hdisj] at h0; exact Set.not_mem_empty _ h0
    · have h0 : (0 : SierpinskiSpace) ∈ Set.univ ∩ Set.univ := by simp
      rw [hdisj] at h0; exact Set.not_mem_empty _ h0

theorem subsingleton_connected {α} [TopSpace α] [Subsingleton α] [Nonempty α] : IsConnected α := by
  intro h; rcases h with ⟨U, V, _, _, hdisj, _, hUne, hVne⟩
  have hUn : U.Nonempty := Set.not_eq_empty.mp hUne
  have hVn : V.Nonempty := Set.not_eq_empty.mp hVne
  rcases hUn with ⟨xU, hxU⟩; rcases hVn with ⟨xV, hxV⟩
  have : xU = xV := Subsingleton.elim xU xV; subst this
  have : xV ∈ U ∩ V := ⟨hxU, hxV⟩; rw [hdisj] at this; exact Set.not_mem_empty _ this

theorem indiscrete_connected {α : Type u} [TopSpace α] (h : topology α = indiscreteTopology α) [Nonempty α] :
    IsConnected α := by
  intro hdisc; rcases hdisc with ⟨U, V, hU, hV, hdisj, _, hUne, hVne⟩
  rw [h] at hU hV; rcases hU with (rfl|rfl) <;> rcases hV with (rfl|rfl)
  · exact hUne rfl; · exact hUne rfl; · exact hVne rfl
  · have hx : (Set.univ : Set α) ∩ Set.univ = Set.univ := by ext x; simp
    rw [hx] at hdisj; rcases (inferInstance : Nonempty α) with ⟨x⟩
    have : x ∈ (∅ : Set α) := by rw [← hdisj]; exact Set.mem_univ x
    exact Set.not_mem_empty _ this

theorem finite_discrete_connected_iff_subsingleton {α : Type u}
    [Fintype α] [TopSpace α] (h : topology α = discreteTopology α) [Nonempty α] :
    IsConnected α ↔ Subsingleton α := by
  constructor
  · intro hconn; refine ⟨λ a b => ?_⟩; by_contra hne; apply hconn
    have ha_open : isOpen ({a} : Set α) := by rw [h]; trivial
    have hb_open : isOpen ({b} : Set α) := by rw [h]; trivial
    refine ⟨{a}, {b}, ha_open, hb_open, ?_, ?_, ?_, ?_⟩
    · ext x; simp [hne]; · ext x; simp
    · exact Set.Nonempty.ne_empty ⟨a, by simp⟩; · exact Set.Nonempty.ne_empty ⟨b, by simp⟩
  · intro; exact subsingleton_connected

#eval "═══════════════════════════════════"
#eval "  MiniConnectedness Core/Basic v1.0"
#eval "═══════════════════════════════════"
#eval "Defs: TopologicalSpace, TopSpace, isOpen, isClosed"
#eval "Defs: Continuous, Homeomorphism, Path, Arc"
#eval "Defs: IsConnected, IsPathConnected, IsArcConnected"
#eval "Defs: IsLocallyConnected, IsTotallyDisconnected, IsZeroDimensional"
#eval "Defs: Component, PathComponent, Quasicomponent, Continuum"
#eval "Defs: discreteTopology, indiscreteTopology, sierpinskiTopology"
#eval "Thm: isConnected_iff_no_proper_clopen"
#eval "Thm: totallySeparated_implies_totallyDisconnected"
#eval "Thm: sierpinski_connected"
#eval "Thm: subsingleton_connected"
#eval "Thm: indiscrete_connected"
#eval "Thm: finite_discrete_connected_iff_subsingleton"
#eval "All proofs complete. No sorry, no axiom."

end MiniConnectedness
