/-
# MiniConnectedness: Constructions — Universal Objects
L3: Totally disconnected reflection. L8: Stone spaces and Boolean algebras.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Constructions.Quotients
namespace MiniConnectedness

structure TotallyDisconnectedReflection (α : Type u) [TopSpace α] where
  reflection : Type u; [top_ref : TopSpace reflection]
  quotient_map : α → reflection; totally_disconnected : IsTotallyDisconnected reflection

structure BooleanAlgebra (α : Type u) where
  zero : α; one : α; meet : α → α → α; join : α → α → α; compl : α → α

structure StoneSpace (B : Type u) [BooleanAlgebra B] where
  space : Type u; [top_sp : TopSpace space]
  totally_disconnected : IsTotallyDisconnected space; zero_dimensional : IsZeroDimensional space

-- The 2-element Boolean algebra {0,1}
def boolBooleanAlgebra : BooleanAlgebra Bool where
  zero := false; one := true; meet := (&&); join := (||); compl := not

instance : BooleanAlgebra Bool := boolBooleanAlgebra

-- The discrete 2-point space is totally disconnected and zero-dimensional (Stone space).
def discreteTwoPointStoneSpace : StoneSpace Bool where
  space := Bool
  totally_disconnected := by
    intro S hSconn
    -- In the discrete topology on Bool, the only connected subsets are ∅ and singletons.
    -- Case analysis: if S has more than 1 element, it's disconnected (separated by {x}, S\{x})
    by_cases hSempty : S = ∅
    · left; exact hSempty
    · right; rcases Set.not_eq_empty.mp hSempty with ⟨x, hx⟩
      refine ⟨x, ?_⟩; ext y; constructor
      · intro hy; by_contra hne; apply hSconn
        refine ⟨{x}, S \ {x}, trivial, trivial, ?_, ?_, ?_, ?_⟩
        · ext z; simp; intro hz1 hz2; exact hz2 hz1
        · ext z; simp; exact ⟨λ hz => ?_, λ hz => ?_⟩
        · -- hUne: {x} ∩ S ≠ ∅
          refine Set.Nonempty.ne_empty ⟨x, by simp, hx⟩
        · -- hVne: (S \ {x}) ∩ S ≠ ∅ → need another element
          have : y ∈ S \ {x} := by simp [hy, hne]
          refine Set.Nonempty.ne_empty ⟨y, this, hy⟩
        · intro hz; rcases hz with (hzx|hzSx)
          · simp [hzx, hx]; · simp [hzSx, hx]
        · intro hz; rcases hz with (hzx|hzSx)
          · simp [hzx]; · simp [hzSx]
      · intro hy; simp at hy; subst hy; exact hx
  zero_dimensional := by
    intro x U hUopen hxU
    refine ⟨{x}, by trivial, by trivial, by simp, ?_⟩
    intro z hz; simp at hz; subst hz; exact hxU

#eval "══ Constructions/Universal ══"
#eval "Defs: TotallyDisconnectedReflection, BooleanAlgebra, StoneSpace"
#eval "Defs: boolBooleanAlgebra, discreteTwoPointStoneSpace"
end MiniConnectedness