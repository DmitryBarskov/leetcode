from typing import List
from heapq import heappush, heappop

class Solution:
    """
    >>> Solution().minTimeToReach([[0,4],[4,4]])
    6
    >>> Solution().minTimeToReach([[0,0,0],[0,0,0]])
    3
    >>> Solution().minTimeToReach([[0,1],[1,2]])
    3
    """
    def minTimeToReach(self, moveTime: List[List[int]]) -> int:
        min_time: List[List[int]] = [[-1] * len(row) for row in moveTime]
        queue: List[tuple[int, int, int]] = [(0, 0, 0)]
        while min_time[-1][-1] == -1:
            current_time, y, x = heappop(queue)
            if y < 0 or y >= len(moveTime) or x < 0 or x >= len(moveTime[y]):
                continue
            if min_time[y][x] != -1:
                continue
            min_time[y][x] = current_time
            for ny, nx in self.adjacent(moveTime, y, x):
                heappush(queue, (max(current_time, moveTime[ny][nx]) + 1, ny, nx))
        return min_time[-1][-1]

    def adjacent(self, grid: List[List[int]], y: int, x: int) -> List[tuple]:
        return [
            (y + dy, x + dx) for (dy, dx)
            in [(-1, 0), (0, 1), (1, 0), (0, -1)]
            if 0 <= y + dy < len(grid) and 0 <= x + dx < len(grid[0])
        ]
