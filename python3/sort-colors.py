class Solution:
    def sortColors(self, nums: list[int]) -> None:
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
        red = 0
        white = 0
        blue = len(nums) - 1
        while white <= blue:
            if nums[white] == 0:
                nums[red], nums[white] = nums[white], nums[red]
                red += 1
                white += 1
            elif nums[white] == 1:
                white += 1
            elif nums[white] == 2:
                nums[blue], nums[white] = nums[white], nums[blue]
                blue -= 1

l = [2, 0, 2, 1, 1, 0]
Solution().sortColors(l)
l

2 + 3
print("Hello world!")
