from typing import List
from functools import cache


class Solution:
    """
    >>> Solution().lenOfVDiagonal([[2,2,1,2,2],[2,0,2,2,0],[2,0,1,1,0],[1,0,2,2,2],[2,0,0,2,2]])
    5
    >>> Solution().lenOfVDiagonal([[2,2,2,2,2],[2,0,2,2,0],[2,0,1,1,0],[1,0,2,2,2],[2,0,0,2,2]])
    4
    >>> Solution().lenOfVDiagonal([[1,2,2,2,2],[2,2,2,2,0],[2,0,0,0,0],[0,0,2,2,2],[2,0,0,2,0]])
    5
    >>> Solution().lenOfVDiagonal([[1]])
    1
    >>> Solution().lenOfVDiagonal([[2, 0]])
    0
    >>> Solution().lenOfVDiagonal([[1,1,1,2,0,0],[0,0,0,0,1,2]])
    2
    """

    def lenOfVDiagonal(self, grid: List[List[int]]) -> int:
        def start_longest_v_shaped(r: int, c: int) -> int:
            if r < 0 or len(grid) <= r or c < 0 or len(grid[r]) <= c:
                return 0
            if grid[r][c] != 1:
                return 0
            return 1 + max(
                map(
                    lambda d: longest_v_shaped(r + d[0], c + d[1], 2, d),
                    [(-1, -1), (-1, 1), (1, 1), (1, -1)]
                )
            )

        @cache
        def longest_v_shaped(r, c, seq, direction) -> int:
            if r < 0 or len(grid) <= r or c < 0 or len(grid[r]) <= c:
                return 0
            if grid[r][c] != seq:
                return 0
            clockwise = (direction[1], -direction[0])
            return 1 + max(
                longest_v_shaped(r + direction[0], c + direction[1], 2 - seq, direction),
                longest_straight(r + clockwise[0], c + clockwise[1], 2 - seq, clockwise)
            )

        @cache
        def longest_straight(r, c, seq, direction) -> int:
            if r < 0 or len(grid) <= r or c < 0 or len(grid[r]) <= c:
                return 0
            if grid[r][c] != seq:
                return 0
            return 1 + longest_straight(r + direction[0], c + direction[1], 2 - seq, direction)

        longest = 0
        for i, row in enumerate(grid):
            for j, x in enumerate(row):
                longest = max(longest, start_longest_v_shaped(i, j))
        return longest

