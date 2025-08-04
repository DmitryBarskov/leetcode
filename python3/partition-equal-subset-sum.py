from typing import List

class Solution:
    """
    >>> Solution().canPartition([1,5,11,5])
    True
    >>> Solution().canPartition([1,2,3,5])
    False
    """
    def canPartition(self, nums: List[int]) -> bool:
        total = sum(nums)
        if total % 2 != 0:
            return False

        target = total // 2
        can_sum = [False] * (target + 1)
        can_sum[0] = True
        for num in nums:
            for sum_so_far in range(target, 0, -1):
                if can_sum[sum_so_far]:
                    continue
                if sum_so_far - num < 0:
                    continue
                if not can_sum[sum_so_far - num]:
                    continue
                can_sum[sum_so_far] = True
        return can_sum[target]
