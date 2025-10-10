import heapq


class Solution:
    def trapRainWater(self, heightMap: list[list[int]]) -> int:
        queue = []

        rows = len(heightMap)
        cols = len(heightMap[0])
        visited = [[False] * len(row) for row in heightMap]

        for r, row in enumerate(heightMap):
            for c, cell in enumerate(row):
                if r in (0, rows - 1) or c in (0, cols - 1):
                    heapq.heappush(queue, (cell, r, c))
                    visited[r][c] = True
        res = 0
        max_height = 0

        while len(queue) > 0:
            height, r, c = heapq.heappop(queue)
            
            max_height = max(max_height, height)
            res += max_height - height

            for nr, nc in [(r - 1, c), (r + 1, c), (r, c - 1), (r, c + 1)]:
                if nr < 0 or len(heightMap) <= nr:
                    continue
                if nc < 0 or len(heightMap[nr]) <= nc:
                    continue
                if visited[nr][nc]:
                    continue
                heapq.heappush(queue, (heightMap[nr][nc], nr, nc))
                visited[nr][nc] = True
        return res
