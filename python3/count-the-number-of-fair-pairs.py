from typing import Callable

class Solution:
    def countFairPairs(self, nums: List[int], lower: int, upper: int) -> int:
        nums.sort()
        fair_pairs = 0
        for i, n in enumerate(nums):
            first = self.binary_search(i + 1, len(nums), lambda j: n + nums[j] >= lower)
            last = self.binary_search(first, len(nums), lambda j: n + nums[j] > upper)
            fair_pairs += last - first
        return fair_pairs

    def binary_search(self, start: int, end: int, predicate: Callable[[int], bool]) -> int:
        lo = start
        hi = end
        while lo < hi:
            mi = (lo + hi) // 2
            if predicate(mi):
                hi = mi
            else:
                lo = mi + 1
        return lo
