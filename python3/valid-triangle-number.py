class Solution:
    """
    >>> Solution().triangleNumber([4,2,3,4])
    4
    >>> Solution().triangleNumber([2,2,3,4])
    3
    """

    def triangleNumber(self, nums: list[int]) -> int:
        nums.sort()
        triangles = 0
        for i in range(0, len(nums)):
            if nums[i] == 0:
                continue
            k = i + 2
            for j in range(i + 1, len(nums)):
                while k < len(nums) and nums[i] + nums[j] > nums[k]:
                    k += 1
                triangles += k - j - 1
        return triangles
