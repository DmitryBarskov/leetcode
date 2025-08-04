from typing import List

class Solution:
    def findNumbers(self, nums: List[int]) -> int:
        count = 0
        for num in nums:
            if self.digitsCount(num) % 2 == 0:
                count += 1
        return count

    def digitsCount(self, num: int):
        if num < 10:
            return 1
        if num < 100:
            return 2
        if num < 1_000:
            return 3
        if num < 10_000:
            return 4
        if num < 100_000:
            return 5
        return 6
