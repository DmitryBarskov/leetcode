from functools import cache


class Solution:
    def minScoreTriangulation(self, values: List[int]) -> int:
        @cache
        def solve(first, last):
            if first + 2 > last:
                return 0
            if first + 2 == last:
                return values[first] * values[first + 1] * values[last]
            return min(
                values[first] * values[mid] * values[last] +
                    solve(first, mid) + solve(mid, last)
                for mid in range(first + 1, last)
            )

        return solve(0, len(values) - 1)
