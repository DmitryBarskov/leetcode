class Solution:
    def nearestValidPoint(self, x: int, y: int, points: list[list[int]]) -> int:
        def dist(nx, ny):
            return abs(x - nx) + abs(y - ny)
        nearest = -1
        min_dist = -1
        for i, (nx, ny) in enumerate(points):
            if nx != x and ny != y:
                continue
            distance = dist(nx, ny)
            if nearest == -1 or distance < min_dist:
                nearest = i
                min_dist = distance
        return nearest
