import heapq


class Solution:
    def swimInWater(self, grid: list[list[int]]) -> int:
        queue = [(grid[0][0], 0, 0)]
        visited = [[False] * len(row) for row in grid]

        while len(queue) > 0:
            min_t, i, j = heapq.heappop(queue)
            if visited[i][j]:
                continue
            visited[i][j] = True

            if i == len(grid) - 1 and j == len(grid[-1]) - 1:
                return min_t

            for ni, nj in [(i - 1, j), (i + 1, j), (i, j - 1), (i, j + 1)]:
                if ni < 0 or len(grid) <= ni:
                    continue
                if nj < 0 or len(grid[ni]) <= nj:
                    continue

                heapq.heappush(queue, (max(min_t, grid[ni][nj]), ni, nj))
        return -1
