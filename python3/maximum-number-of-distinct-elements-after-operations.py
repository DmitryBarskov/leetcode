import math


class Solution:
    """
    >>> Solution().maxDistinctElements([1, 2, 2, 3, 3, 4], 2)
    6
    >>> Solution().maxDistinctElements([4, 4, 4, 4], 1)
    3
    >>> Solution().maxDistinctElements([10, 9, 9, 8], 0)
    3
    """

    def maxDistinctElements(self, nums: list[int], k: int) -> int:
        sorted_nums = sorted(nums)
        uniq = 0
        previous = -math.inf
        for num in sorted_nums:
            current = max(num - k, previous + 1)
            if current <= num + k:
                uniq += 1
                previous = current
        return uniq
