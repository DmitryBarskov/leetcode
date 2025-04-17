class Solution:
    def countPairs(self, nums: List[int], k: int) -> int:
        return len(
            [
                1 for i in range(0, len(nums))
                    for j in range(i + 1, len(nums))
                if nums[i] == nums[j] and i * j % k == 0
            ]
        )
