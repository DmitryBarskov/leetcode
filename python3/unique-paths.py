class Solution:
    """
    >>> Solution().uniquePaths(3, 7)
    28
    """

    def uniquePaths(self, m: int, n: int) -> int:
        row = [1] * n
        for _ in range(m - 1):
            for i in range(1, n):
                row[i] += row[i - 1]
        return row[-1]
