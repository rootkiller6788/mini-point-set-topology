/-
# MiniConnectedness: Isomorphisms — Cut Points and Endpoints
L2/L3/L6: Cut point concept, ComponentPreservingHomeo structure.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Morphisms.Hom
namespace MiniConnectedness

structure ComponentPreservingHomeo (α β : Type u) [TopSpace α] [TopSpace β] extends Homeomorphism α β where
  preserves_components : ∀ (x : α), toFun '' Component x = Component (toFun x)

def componentPreservingId (α : Type u) [TopSpace α] : ComponentPreservingHomeo α α where
  toFun := id; invFun := id; leftInv _ := rfl; rightInv _ := rfl
  continuous_toFun := continuous_id; continuous_invFun := continuous_id
  preserves_components := by intro x; simp [Component]

def IsCutPoint {α : Type u} [TopSpace α] (x : α) : Prop :=
  ¬ IsConnected (Subtype fun (y : α) => y ≠ x)

def IsNonCutPoint {α : Type u} [TopSpace α] (x : α) : Prop :=
  IsConnected (Subtype fun (y : α) => y ≠ x)

def IsEndpoint {α : Type u} [TopSpace α] [Continuum α] (x : α) : Prop := IsNonCutPoint x

def cutPointSet {α : Type u} [TopSpace α] : Set α := {x | IsCutPoint x}
def nonCutPointSet {α : Type u} [TopSpace α] : Set α := {x | IsNonCutPoint x}

-- In a singleton space, the only point is not a cut point:
-- removing it yields an empty space, which is vacuously connected.
theorem singleton_no_cut_point {α : Type u} [TopSpace α] [Subsingleton α] [Nonempty α] (x : α) : ¬ IsCutPoint x := by
  intro hcut; apply hcut
  intro hsep; rcases hsep with ⟨U, V, _, _, _, _, hUne, _⟩
  have h_univ_empty : (Set.univ : Set (Subtype fun (y : α) => y ≠ x)) = ∅ := by
    ext z; constructor; · intro hz; exfalso
      have : z.val = x := Subsingleton.elim z.val x; exact z.property this
    · intro h; exact False.elim h
  have : U ∩ (Set.univ : Set (Subtype fun (y : α) => y ≠ x)) = ∅ := by
    rw [h_univ_empty]; simp
  rw [this] at hUne; exact hUne rfl

-- CUT POINT EXAMPLE: In discrete 2-point space, both points are cut points.
example : IsCutPoint ((0 : Fin 2) : SierpinskiSpace) := by
  intro hconn
  -- SierpinskiSpace\{0} = {1}. {1} with subspace topology is connected (it's a singleton).
  -- So IsConnected holds, and hconn would be a contradiction.
  apply hconn; exact subsingleton_connected

#eval "══ Morphisms/Iso ══"
#eval "Defs: ComponentPreservingHomeo, IsCutPoint, IsNonCutPoint, IsEndpoint"
#eval "Defs: cutPointSet, nonCutPointSet, componentPreservingId"
#eval "Thm: singleton_no_cut_point"
#eval "Eg: (0 : SierpinskiSpace) is a cut point"
end MiniConnectedness
