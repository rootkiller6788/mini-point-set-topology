"""
Connected Components in SageMath

SageMath implementations for computing connected components
in topological spaces, graphs, and simplicial complexes.
"""

def compute_connected_components(G):
    """
    Compute connected components of a graph G.
    Returns list of vertex sets for each component.
    """
    return G.connected_components()


def zero_dim_betti(complex):
    """
    Compute 0-dimensional Betti number (number of connected
    components) of a simplicial complex.
    """
    return len(complex.connected_components())


def persistent_components(filtration):
    """
    Compute the 0-dimensional persistent homology
    of a filtered simplicial complex.

    Tracks how connected components merge across filtration levels.
    """
    # Placeholder for persistence computation
    return []


# Example usage
if __name__ == "__main__":
    # Graph components
    G = Graph({0: [1, 2], 1: [0], 2: [0], 3: [4], 4: [3]})
    print("Graph components:", compute_connected_components(G))

    # Simplicial complex 0-dim Betti
    # SC = SimplicialComplex(...)
    # print("0-dim Betti:", zero_dim_betti(SC))
