from typing import List

class Solution:
    """
    >>> Solution().countSubarrays([1,3,2,3,3], 2)
    6
    >>> Solution().countSubarrays([1, 4, 2, 1], 3)
    0
    """

    def countSubarrays(self, nums: List[int], k: int) -> int:
        maximum_element: int = max(nums)
        count_of_max: int = 0
        subarrays: int = 0
        l: int = 0
        for r, num in enumerate(nums):
            if num == maximum_element:
                count_of_max += 1
            while count_of_max >= k:
                subarrays += l
                if nums[l] == maximum_element:
                    count_of_max -= 1
                l += 1
        return subarrays
