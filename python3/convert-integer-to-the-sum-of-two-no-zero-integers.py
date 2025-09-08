from typing import List


class Solution:
    """
    >>> a, b = Solution().getNoZeroIntegers(2)
    >>> '0' not in str(a) and a > 0 and '0' not in str(b) and b > 0 and a + b == 2
    True
    >>> a, b
    (1, 1)

    >>> a, b = Solution().getNoZeroIntegers(11)
    >>> '0' not in str(a) and a > 0 and '0' not in str(b) and b > 0 and a + b == 11
    True
    """

    def getNoZeroIntegers(self, n: int) -> List[int]:
        def non_zero(num: int) -> bool:
            while num > 0:
                if num % 10 == 0:
                    return False
                num //= 10
            return True

        i = 1
        j = n - 1
        while i <= j:
            if non_zero(i) and non_zero(j):
                return [i, j]
            i += 1
            j -= 1
        return [-1, -1]
