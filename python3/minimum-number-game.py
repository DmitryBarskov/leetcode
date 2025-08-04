from typing import List

class Solution:
    def numberGame(self, nums: List[int]) -> List[int]:
        arr = [0] * len(nums)
        for i, n in enumerate(sorted(nums)):
            if i % 2 == 0:
                arr[i + 1] = n
            else:
                arr[i - 1] = n
        return arr
