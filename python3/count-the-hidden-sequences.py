from functools import reduce

class Solution:
    def numberOfArrays(self, differences: List[int], lower: int, upper: int) -> int:
        minimum, maximum = reduce(
            lambda acc, d: (max(acc[0] + d, lower), min(acc[1] + d, upper)),
            differences, (lower, upper)
        )
        return max(maximum - minimum + 1, 0)
