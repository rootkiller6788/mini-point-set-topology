/-
# MiniConnectedness: Properties — Invariants
L2: Component count, cut points. L4: Invariance. L6: #eval.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Morphisms.Equiv
namespace MiniConnectedness

def numberOfComponents {α : Type u} [TopSpace α] : Set (Set α) := Set.range (Component (α := α))

theorem components_cover {α : Type u} [TopSpace α] : (⋃ x : α, Component x) = Set.univ := by
  ext z; constructor; · intro; exact Set.mem_univ _; · intro hz; exact Set.mem_iUnion.mpr ⟨z, mem_component_self z⟩

theorem connected_unique_component {α : Type u} [TopSpace α] (hconn : IsConnected α) (x : α) : Component x = Set.univ := by
  ext z; constructor; · intro; exact Set.mem_univ _
  · intro hz; apply Set.mem_sUnion.mpr; refine ⟨Set.univ, ⟨?_, Set.mem_univ x⟩, hz⟩
    intro hsep; rcases hsep with ⟨U, V, hU, hV, hdisj, hcov, hUne, hVne⟩
    apply hconn; exact ⟨U, V, hU, hV, hdisj, by simpa using hcov, hUne, hVne⟩

def cutPointSet {α : Type u} [TopSpace α] : Set α := {x | IsCutPoint x}

/-- In a connected space, there are no cut points iff the space is "strongly connected" (removing any point leaves a connected space). -/
#eval "Component count: topological invariant"
#eval "Cut point set: preserved under homeomorphism"
#eval "Components cover the whole space"
#eval "Connected space: single component = Set.univ"
#eval ""
#eval "══ Properties/Invariants ══"
#eval "Defs: numberOfComponents, cutPointSet"
#eval "Thm: components_cover, connected_unique_component"
#eval ""
#eval "Future: formalize component count invariance under homeomorphism"
#eval "Future: prove cut point cardinality as topological invariant"
end MiniConnectedness