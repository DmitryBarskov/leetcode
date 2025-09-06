from typing import List

from math import ceil


class Solution:
    """
    >>> Solution().minOperations([[1,2],[2,4]])
    3
    >>> Solution().minOperations([[2,6]])
    4
    """
    def minOperations(self, queries: List[List[int]]) -> int:
        operations = 0
        for l, r in queries:
            operations += self.min_operations(l, r)
        return operations

    def min_operations(self, start: int, end: int) -> int:
        """
        >>> Solution().min_operations(2, 6)
        4
        """
        operations_needed = [(b - a + 1) * divisions for a, b, divisions in self.split_range(start, end)]
        return ceil(sum(operations_needed) / 2)

    def split_range(self, a, b):
        """
        >>> Solution().split_range(2, 6)
        [(2, 3, 1), (4, 6, 2)]
        """
        intervals = [ (4 ** i, 4 ** (i + 1) - 1, i + 1) for i in range(16) ]
        return [
            self.find_intersection(interval, (a, b))
            for interval in intervals
            if self.are_intersecting(interval, (a, b))
        ]

    def are_intersecting(self, i1, i2):
        return i1[0] <= i2[0] <= i1[1] or i1[0] <= i2[1] <= i1[1] or \
                i2[0] <= i1[0] <= i2[1] or i2[0] <= i1[1] <= i2[1]

    def find_intersection(self, i1, i2):
        return (max(i1[0], i2[0]), min(i1[1], i2[1]), *i1[2:])
