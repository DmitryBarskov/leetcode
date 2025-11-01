class Solution:
    """
    >>> Solution().countValidSelections([1,0,2,0,3])
    2
    >>> Solution().countValidSelections([2,3,4,0,4,1,0])
    0
    """

    def countValidSelections(self, nums: list[int]) -> int:
        selections = 0
        sum_on_left = 0
        sum_on_right = sum(nums)
        for num in nums:
            sum_on_right -= num
            if num != 0:
                sum_on_left += num
                continue
            if abs(sum_on_left - sum_on_right) <= 1:
                selections += 1
            if sum_on_left == sum_on_right:
                selections += 1
        return selections
