from typing import List

class Solution:
    """
    >>> Solution().countCompleteSubarrays([1,3,1,2,2])
    4
    >>> Solution().countCompleteSubarrays([5,5,5,5])
    10
    """
    def countCompleteSubarrays(self, nums: List[int]) -> int:
        complete_subarrays = 0
        distinct_elements = self.count_distinct(nums)
        count_in_window = {}
        l = 0
        for r, num in enumerate(nums):
            self.increment_key(count_in_window, num)
            while len(count_in_window) == distinct_elements:
                complete_subarrays += len(nums) - r
                self.decrement_key(count_in_window, nums[l])
                l += 1
        return complete_subarrays

    def count_distinct(self, nums: List[int]) -> int:
        distinct = set()
        for num in nums:
            distinct.add(num)
        return len(distinct)

    def increment_key(self, count: dict, key: int):
        if key not in count:
            count[key] = 0
        count[key] += 1

    def decrement_key(self, count: dict, key: int):
        count[key] -= 1
        if count[key] == 0:
            count.pop(key)
