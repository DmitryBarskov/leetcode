from typing import List

class Solution:
    def minSum(self, nums1: List[int], nums2: List[int]) -> int:
        sum1, zeroes1 = self.stats(nums1)
        sum2, zeroes2 = self.stats(nums2)
        min_sum1 = sum1 + zeroes1
        min_sum2 = sum2 + zeroes2
        if zeroes1 == 0 and min_sum2 > min_sum1 or zeroes2 == 0 and min_sum1 > min_sum2:
            return -1
        return max(min_sum1, min_sum2)
    
    def stats(self, array: List[int]):
        zeroes = 0
        total = 0
        for num in array:
            total += num
            if num == 0:
                zeroes += 1
        return (total, zeroes)
