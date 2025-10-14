class Solution:
    """
    >>> Solution().hasIncreasingSubarrays([2,5,7,8,9,2,3,4,3,1], k = 3)
    True
    >>> Solution().hasIncreasingSubarrays(nums = [1,2,3,4,4,4,4,5,6,7], k = 5)
    False
    >>> Solution().hasIncreasingSubarrays([1, 2, 3, 4, 5, 6], k = 3)
    True
    """

    def hasIncreasingSubarrays(self, nums: list[int], k: int) -> bool:
        def has_increasing_subarray(start):
            prev = nums[start]
            for i in range(start + 1, start + k):
                if prev >= nums[i]:
                    return False
                prev = nums[i]
            return True

        for i in range(0, len(nums) - 2 * k + 1):
            if has_increasing_subarray(i) and has_increasing_subarray(i + k):
                return True
        return False
