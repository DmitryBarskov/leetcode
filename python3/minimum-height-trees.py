import math


class Solution:
    """
    >>> Solution().findMinHeightTrees(4, [[1,0],[1,2],[1,3]])
    [1]
    >>> Solution().findMinHeightTrees(6, [[3,0],[3,1],[3,2],[3,4],[5,4]])
    [3, 4]
    >>> Solution().findMinHeightTrees(6, [[0,1],[0,2],[0,3],[3,4],[4,5]])
    [3]
    >>> Solution().findMinHeightTrees(7, [[0,1],[1,2],[1,3],[2,4],[3,5],[4,6]])
    [1, 2]
    >>> Solution().findMinHeightTrees(1, [])
    [0]
    """

    def findMinHeightTrees(self, n: int, edges: list[list[int]]) -> list[int]:
        graph = self.build_graph(n, edges)
        leaf = self.find_a_leaf(graph)

        farthest_node, _ = self.find_farthest_node(graph, leaf)

        _, longest_path = self.find_farthest_node(graph, farthest_node)
        if len(longest_path) % 2 == 0:
            return [longest_path[len(longest_path) // 2], longest_path[len(longest_path) // 2 - 1]]
        else:
            return [longest_path[len(longest_path) // 2]]

    def build_graph(self, nodes_count, edges) -> list:
        graph = [set() for _ in range(nodes_count)]
        for n1, n2 in edges:
            graph[n1].add(n2)
            graph[n2].add(n1)
        return graph

    def find_a_leaf(self, graph):
        for node, adjacent in enumerate(graph):
            if len(adjacent) <= 1:
                return node

    def find_farthest_node(self, graph, start):
        visited = [False] * len(graph)

        farthest = [start, [start]]

        def recur(node, stack):
            if visited[node]:
                return
            visited[node] = True
            stack.append(node)

            if len(stack) > len(farthest[1]):
                farthest[0] = node
                farthest[1] = stack[:]

            for neighbor in graph[node]:
                recur(neighbor, stack)

            stack.pop()

        recur(start, [])

        return (farthest[0], farthest[1])
