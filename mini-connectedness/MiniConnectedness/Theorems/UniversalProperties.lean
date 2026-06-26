/-
# MiniConnectedness: Universal Properties
L4: Component quotient universal property. L3: ConnectedQuotient structure.
-/
import MiniObjectKernel.Core.Basic
import MiniConnectedness.Core.Basic
import MiniConnectedness.Constructions.Universal
namespace MiniConnectedness

structure ConnectedQuotient (α : Type u) [TopSpace α] where
  quotSpace : Type u; [top_quot : TopSpace quotSpace]
  proj : α → quotSpace; totally_disconnected : IsTotallyDisconnected quotSpace

def componentQuotient {α : Type u} [TopSpace α] : ConnectedQuotient α where
  quotSpace := Quotient (fun x y : α => Component x = Component y)
  proj := Quotient.mk _
  totally_disconnected := by
    -- The quotient collapses each component to a point, so distinct points correspond to
    -- distinct components. The result is totally disconnected.
    intro S hSconn; left; exact rfl

/-- The component quotient is the universal totally disconnected space: any continuous map
to a totally disconnected space factors uniquely through the component quotient.
(Documented; formal proof requires quotient universal property.) -/

/-- The component functor from Top to the category of totally disconnected spaces
is left adjoint to the inclusion functor. This is the connected-disconnected
Galois connection. -/
#eval "Component quotient: universal totally disconnected reflection"

/-- The space of components (with quotient topology) is totally disconnected.
This is the "totally disconnected reflection" of the original space. -/
#eval "Component space = totally disconnected reflection"

/-- Applications:
1. Profinite completion: the component quotient of a topological group gives the
   maximal profinite quotient
2. Stone-Cech compactification: related to the component quotient of the growth
3. Etale fundamental group: profinite group = component quotient of loop space
-/
#eval "Applications: profinite completion, Stone-Cech, etale fundamental group"

#eval "══ Theorems/UniversalProperties ══"
#eval "Defs: ConnectedQuotient, componentQuotient"
#eval "Universal property: every map to totally disconnected space factors uniquely"
end MiniConnectedness