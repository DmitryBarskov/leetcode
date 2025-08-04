from typing import List

class Solution:
    def countSubarrays(self, nums: List[int]) -> int:
        first = nums[0]
        second = nums[1]
        count = 0
        for i in range(2, len(nums)):
            third = nums[i]
            if 2 * (first + third) == second:
                count += 1
            first, second = second, third
        return count
