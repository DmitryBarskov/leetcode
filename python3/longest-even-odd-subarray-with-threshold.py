from typing import List

class Solution:
    def longestAlternatingSubarray(self, nums: List[int], threshold: int):
        longest = 0
        l = 0
        while l < len(nums):
            if nums[l] % 2 != 0 or nums[l] > threshold:
                l += 1
                continue
            r = l + 1
            while r < len(nums) and \
                    nums[r - 1] % 2 != nums[r] % 2 and \
                    nums[r] <= threshold:
                r += 1
            longest = max(longest, r - l)
            l = r
        return longest
