class Solution:
    def longestSubarray(self, nums: List[int]) -> int:
        longest = 0
        l = 0
        zeroes = 0
        for r, _ in enumerate(nums):
            if nums[r] == 0:
                zeroes += 1
            while zeroes > 1 and l < r:
                if nums[l] == 0:
                    zeroes -= 1
                l += 1
            longest = max(longest, r - l + 1 - zeroes)
        return min(len(nums) - 1, longest)
