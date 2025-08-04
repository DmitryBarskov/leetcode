from typing import List
from heapq import heappush, heappop

class Solution:
    """
    >>> Solution().minTimeToReach([[94,79,62,27,69,84],[6,32,11,82,42,30]])
    74
    >>> Solution().minTimeToReach([[0,4],[4,4]])
    7
    >>> Solution().minTimeToReach([[0,0,0,0],[0,0,0,0]])
    6
    >>> Solution().minTimeToReach([[0,1],[1,2]])
    4
    >>> Solution().minTimeToReach([[0,58],[27,69]])
    71
    """
    def minTimeToReach(self, moveTime: List[List[int]]) -> int:
        min_time: List[List[int]] = [[-1] * len(row) for row in moveTime]
        queue: List[tuple[int, int, int]] = [(0, 0, 0, 0)]
        while min_time[-1][-1] == -1:
            current_time, y, x, step = heappop(queue)
            if y < 0 or y >= len(moveTime) or x < 0 or x >= len(moveTime[y]):
                continue
            if min_time[y][x] != -1:
                continue
            min_time[y][x] = current_time
            for ny, nx in self.adjacent(moveTime, y, x):
                time_to_move = 1 + step
                heappush(queue, (
                    max(current_time, moveTime[ny][nx]) + time_to_move,
                    ny,
                    nx,
                    (step + 1) % 2
                ))
        return min_time[-1][-1]

    def adjacent(self, grid: List[List[int]], y: int, x: int) -> List[tuple]:
        return [
            (ny, nx) for ny, nx
            in [(y - 1, x), (y, x + 1), (y + 1, x), (y, x - 1)]
            if 0 <= ny < len(grid) and 0 <= nx < len(grid[0])
        ]
