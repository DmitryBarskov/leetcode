from functools import reduce

class Solution:
    def fib(self, n: int) -> int:
        return reduce(lambda acc, _: (acc[1], acc[0] + acc[1]), range(n), (0, 1))[0]

Solution().fib(7)
2 + 3
