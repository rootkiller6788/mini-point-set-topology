"""
SageMath script: Classification of finite topological spaces by separation axioms.

This script enumerates all topologies on a small finite set (n ≤ 5)
and classifies them by the highest T_i axiom they satisfy.
"""

from itertools import combinations, chain


def is_topology(opens, ground_set):
    """Check if a collection of subsets is a topology."""
    ground = set(ground_set)
    if set() not in opens:
        return False
    if ground not in opens:
        return False
    # Check closure under arbitrary unions (finite check for finite ground set)
    for i in range(len(opens)):
        for j in range(i+1, len(opens)):
            if opens[i] | opens[j] not in opens:
                return False
    # Check closure under finite intersections
    for i in range(len(opens)):
        for j in range(i+1, len(opens)):
            if opens[i] & opens[j] not in opens:
                return False
    return True


def enumerate_topologies(n):
    """Enumerate all topologies on {0, ..., n-1}."""
    ground = set(range(n))
    all_subsets = [set(s) for r in range(n+1) for s in combinations(ground, r)]
    topologies = []
    # All possible collections of subsets that contain empty set and ground
    required = {frozenset(), frozenset(ground)}
    optional = [frozenset(s) for s in all_subsets[1:-1]]  # exclude empty and full

    def backtrack(idx, current):
        if idx == len(optional):
            # Check topology axioms
            current_sets = [set(s) for s in current]
            if is_topology(current_sets, ground):
                topologies.append(current_sets)
            return
        # Try without this subset
        backtrack(idx + 1, current)
        # Try with this subset
        backtrack(idx + 1, current | {optional[idx]})

    backtrack(0, required)
    return topologies


# Stub: enumeration for n=3 (29 topologies)
if __name__ == "__main__":
    print("SageMath classification script — stub")
    print("Enumerating topologies on 3 elements...")
    # This would run for n=3 (manageable: 29 topologies)
    # tops = enumerate_topologies(3)
    # print(f"Found {len(tops)} topologies")
