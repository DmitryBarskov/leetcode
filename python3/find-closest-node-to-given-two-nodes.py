class Solution:
    def closestMeetingNode(self, edges: list[int], node1: int, node2: int) -> int:
        def find_dist1(state, node):
            distances, current_distance = state
            distances[node] = current_distance
            return (distances, current_distance + 1)

        path1, _ = self.reduce_path(edges, node1, find_dist1, ({}, 0))

        def find_closest(state, node):
            closest_node, closest_node_distance, distance = state
            if node in path1 and (closest_node == -1 or max(distance, path1[node]) <= closest_node_distance):
                if max(distance, path1[node]) == closest_node_distance:
                    return (min(node, closest_node), max(distance, path1[node]), distance + 1)
                return (node, max(distance, path1[node]), distance + 1)
            return (closest_node, closest_node_distance, distance + 1)

        closest_node, _, _ = self.reduce_path(edges, node2, find_closest, (-1, -1, 0))
        return closest_node

    def reduce_path(self, edges: list[int], start: int, func, init):
        it = start
        path = set()
        state = init
        while it != -1 and it not in path:
            state = func(state, it)
            path.add(it)
            it = edges[it]
        return state
