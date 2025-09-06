from typing import List

import functools

class Solution:
    """
    >>> Solution().canPartition([3,5,11,7])
    False
    >>> Solution().canPartition([1,5,11,5])
    True
    >>> Solution().canPartition([1,2,3,5])
    False
    >>> Solution().canPartition([23,13,11,7,6,5,5])
    True
    >>> Solution().canPartition([1,1])
    True
    >>> Solution().canPartition([6,14,19,10,17,10,8,15,16,1,12,4,9,2,15])
    True
    >>> Solution().canPartition([4,10,7,9,7,1,11,9,13,15])
    True
    >>> Solution().canPartition([9,10,15,3,9,2,9,10,13,1])
    False
    >>> Solution().canPartition([1,2,3,5,17,6,14,12,6])
    True
    >>> Solution().canPartition([1,3,14])
    False
    """
    def canPartition(self, nums: List[int]) -> bool:
        total = sum(nums)
        if total % 2 != 0:
            return False
        @functools.cache
        def iter(i: int, target: int) -> bool:
            if target == 0: return True
            if target < 0: return False
            if i >= len(nums): return False
            return iter(i + 1, target) or iter(i + 1, target - nums[i])
        return iter(0, total // 2)
