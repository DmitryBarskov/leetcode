import math


class Solution:
    """
    >>> Solution().minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]])
    11
    """

    def minimumTotal(self, triangle: list[list[int]]) -> int:
        def get_or_inf(row, col):
            if 0 <= col < len(row):
                return row[col]
            return math.inf

        # minimum path sum to get to previous row
        previous_row = [triangle[0][0]]

        for r in range(1, len(triangle)):
            minimums = [None] * len(triangle[r])
            for i in range(r + 1):
                minimums[i] = triangle[r][i] + min(
                    get_or_inf(previous_row, i - 1),
                    get_or_inf(previous_row, i)
                )
            previous_row = minimums

        return min(previous_row)

