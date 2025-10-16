class Solution:
    """
    >>> Solution().findSmallestInteger(nums = [1,-10,7,13,6,8], value = 5)
    4
    >>> Solution().findSmallestInteger(nums = [1,-10,7,13,6,8], value = 7)
    2
    """

    def findSmallestInteger(self, nums: list[int], value: int) -> int:
        mod_count = [0] * value
        for num in nums:
            mod = num % value
            mod_count[mod] += 1

        for i in range(0, len(nums)):
            mod = i % value
            if i < mod + value * mod_count[mod]:
                continue
            return i

        return len(nums)
