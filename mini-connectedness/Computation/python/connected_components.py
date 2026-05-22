"""
Connected Components Computation

Python implementations of connected component algorithms
for finite topological spaces and graphs.

Supports: DFS, BFS, Union-Find for computing
connected components.
"""

def dfs_components(adjacency_list):
    """
    Compute connected components via depth-first search.
    Returns a list of sets of vertices.
    """
    visited = set()
    components = []

    def dfs(v, component):
        visited.add(v)
        component.add(v)
        for neighbor in adjacency_list.get(v, []):
            if neighbor not in visited:
                dfs(neighbor, component)

    for v in adjacency_list:
        if v not in visited:
            component = set()
            dfs(v, component)
            components.append(component)

    return components


def union_find_components(n, edges):
    """
    Compute connected components via Union-Find.
    Returns a list of sets of vertices.
    """
    parent = list(range(n))
    rank = [0] * n

    def find(x):
        while parent[x] != x:
            parent[x] = parent[parent[x]]
            x = parent[x]
        return x

    def union(x, y):
        rx, ry = find(x), find(y)
        if rx == ry:
            return
        if rank[rx] < rank[ry]:
            parent[rx] = ry
        elif rank[rx] > rank[ry]:
            parent[ry] = rx
        else:
            parent[ry] = rx
            rank[rx] += 1

    for u, v in edges:
        union(u, v)

    components_map = {}
    for i in range(n):
        root = find(i)
        components_map.setdefault(root, set()).add(i)

    return list(components_map.values())


# Example usage
if __name__ == "__main__":
    graph = {0: [1, 2], 1: [0], 2: [0], 3: [4], 4: [3]}
    print("DFS components:", dfs_components(graph))
    print("Union-Find components:", union_find_components(5, [(0,1),(0,2),(3,4)]))
