from functools import cache

class Solution:
    """
    >>> Solution().findTargetSumWays([1,1,1,1,1], 3)
    5
    >>> Solution().findTargetSumWays([1], 1)
    1
    """
    def findTargetSumWays(self, nums: list[int], target: int) -> int:
        @cache
        def recur(i, expr_result) -> int:
            if i >= len(nums):
                if expr_result == target:
                    return 1
                else:
                    return 0
            return recur(i + 1, expr_result + nums[i]) + recur(i + 1, expr_result - nums[i])
        return recur(0, 0)

