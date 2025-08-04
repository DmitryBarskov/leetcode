from typing import List

class Solution:
    def countSubarrays(self, nums: List[int], k: int) -> int:
        l = 0
        window_sum = 0
        count = 0
        for r, num in enumerate(nums):
            window_sum += num
            score = window_sum * (r + 1 - l)
            while score >= k:
                window_sum -= nums[l]
                l += 1
                score = window_sum * (r + 1 - l)
            if score > 0:
                count += r - l + 1
        return count
