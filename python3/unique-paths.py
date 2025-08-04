from itertools import accumulate
from functools import reduce
from operator import add

class Solution:
    """
    >>> Solution().uniquePaths(3, 7)
    28
    """
    def uniquePaths(self, m: int, n: int) -> int:
        return list(
            reduce(
                lambda row, _: accumulate(row, add),
                range(m - 1),
                [1] * n
            )
        )[-1]
