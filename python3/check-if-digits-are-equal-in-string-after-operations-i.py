import functools


@functools.cache
def fact(n):
    if n <= 1:
        return 1
    return n * fact(n - 1)

@functools.cache
def c(n, k):
    return fact(n) // (fact(k) * fact(n - k))

class Solution:
    """
    >>> Solution().hasSameDigits("3902")
    True
    >>> Solution().hasSameDigits("34789")
    False
    """

    def hasSameDigits(self, s: str) -> bool:
        first = 0
        second = 0

        for i in range(len(s) - 1):
            first = (first + int(s[i]) * c(len(s) - 2, i)) % 10
            second = (second + int(s[i + 1]) * c(len(s) - 2, i)) % 10

        return first == second
