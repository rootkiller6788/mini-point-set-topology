"""
Computation helper for finite topological space separation axioms.
Checks T0, T1, T2, and other separation properties on finite spaces.
"""

from typing import Set, Tuple, List, FrozenSet, Callable
from itertools import combinations


def check_T0(points: Set[int], opens: List[Set[int]]) -> bool:
    """Check if a finite space is T0 (Kolmogorov)."""
    for x in points:
        for y in points:
            if x == y:
                continue
            separated = False
            for U in opens:
                if (x in U) != (y in U):
                    separated = True
                    break
            if not separated:
                return False
    return True


def check_T1(points: Set[int], opens: List[Set[int]]) -> bool:
    """Check if a finite space is T1 (all singletons closed)."""
    closed_sets = [points - U for U in opens]
    for x in points:
        if {x} not in closed_sets:
            return False
    return True


def check_T2(points: Set[int], opens: List[Set[int]]) -> bool:
    """Check if a finite space is T2 (Hausdorff)."""
    for x in points:
        for y in points:
            if x == y:
                continue
            found = False
            for U in opens:
                for V in opens:
                    if x in U and y in V and not (U & V):
                        found = True
                        break
                if found:
                    break
            if not found:
                return False
    return True


def classify_space(points: Set[int], opens: List[Set[int]]) -> str:
    """Classify a finite topological space by its highest T_i axiom."""
    if check_T2(points, opens):
        if check_T1(points, opens):
            return "T2 (Hausdorff)"
        return "T2 (not T1 — unusual)"
    if check_T1(points, opens):
        return "T1 (Frechet)"
    if check_T0(points, opens):
        return "T0 (Kolmogorov)"
    return "Not T0"


# Example: Sierpinski space {0,1}, opens = {empty, {1}, {0,1}}
if __name__ == "__main__":
    sierpinski_points = {0, 1}
    sierpinski_opens = [set(), {1}, {0, 1}]

    print("Sierpinski space classification:", classify_space(sierpinski_points, sierpinski_opens))
    print("T0:", check_T0(sierpinski_points, sierpinski_opens))
    print("T1:", check_T1(sierpinski_points, sierpinski_opens))
    print("T2:", check_T2(sierpinski_points, sierpinski_opens))
