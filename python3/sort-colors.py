from typing import List


class Solution:
    def sortColors(self, nums: List[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        >>> nums = [2,0,2,1,1,0]
        >>> Solution().sortColors(nums)
        >>> nums
        [0, 0, 1, 1, 2, 2]
        >>> nums = [2, 0, 1]
        >>> Solution().sortColors(nums)
        >>> nums
        [0, 1, 2]
        >>> nums = [2, 1, 1, 0, 1, 2, 0, 2, 1, 0]
        >>> Solution().sortColors(nums)
        >>> nums
        [0, 0, 0, 1, 1, 1, 1, 2, 2, 2]
        """
        i = 0
        j = 0
        k = len(nums) - 1
        while j <= k:
            if nums[j] == 0:
                nums[i], nums[j] = nums[j], nums[i]
                i += 1
                j += 1
            elif nums[j] == 1:
                j += 1
            elif nums[j] == 2:
                nums[j], nums[k] = nums[k], nums[j]
                k -= 1
