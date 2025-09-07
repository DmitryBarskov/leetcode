from typing import List


class Solution:
    """
    >>> l = Solution().sumZero(5)
    >>> len(set(l)), sum(l)
    (5, 0)
    >>> l = Solution().sumZero(3)
    >>> len(set(l)), sum(l)
    (3, 0)
    >>> l = Solution().sumZero(1)
    >>> len(set(l)), sum(l)
    (1, 0)
    >>> l = Solution().sumZero(2)
    >>> len(set(l)), sum(l)
    (2, 0)
    """

    def sumZero(self, n: int) -> List[int]:
        l = list(range(1, n))
        l.append(-(n * (n - 1) // 2))
        return l
