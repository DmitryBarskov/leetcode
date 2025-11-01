class Solution:
    def getSneakyNumbers(self, nums: list[int]) -> list[int]:
        n = len(nums) - 2
        result = []
        for num in nums:
            nums[num % n] += n
        for i, num in enumerate(nums):
            if num >= 2 * n:
                result.append(i)
                nums[i] -= n
            if num >= n:
                nums[i] -= n
        return result
