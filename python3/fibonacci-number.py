from functools import reduce

class Solution:
    """
    >>> Solution().fib(0)
    0
    >>> Solution().fib(1)
    1
    >>> Solution().fib(4)
    3
    """

    def fib(self, n: int) -> int:
        return reduce(lambda acc, _: (acc[1], acc[0] + acc[1]), range(n), (0, 1))[0]
