class Solution:
    """
    >>> Solution().maxIncreasingSubarrays([2,5,7,8,9,2,3,4,3,1])
    3
    >>> Solution().maxIncreasingSubarrays([1,2,3,4,4,4,4,5,6,7])
    2
    """

    def maxIncreasingSubarrays(self, nums: list[int]) -> int:
        increasing_sequences = []

        increasing = 1
        for prev, curr in self.pairs(nums):
            if prev < curr:
                increasing += 1
            else:
                increasing_sequences.append(increasing)
                increasing = 1
        increasing_sequences.append(increasing)

        max_cons = max(increasing_sequences) // 2

        for prev, curr in self.pairs(increasing_sequences):
            max_cons = max(min(prev, curr), max_cons)

        return max_cons

    def pairs(self, a_list):
        prev = a_list[0]
        for i in range(1, len(a_list)):
            yield (prev, a_list[i])
            prev = a_list[i]
