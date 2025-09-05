class Solution:
    """
    >>> Solution().makeTheIntegerZero(3, -2)
    3
    >>> Solution().makeTheIntegerZero(5, 7)
    -1
    >>> Solution().makeTheIntegerZero(110, 55)
    -1
    >>> Solution().makeTheIntegerZero(85, 42)
    -1
    >>> Solution().makeTheIntegerZero(1000000000, -73741824)
    1
    >>> Solution().makeTheIntegerZero(334521, -41)
    8
    >>> Solution().makeTheIntegerZero(1066381, -2233)
    7
    >>> Solution().makeTheIntegerZero(99861952, 12311)
    16
    >>> Solution().makeTheIntegerZero(1000000000, 100)
    14
    >>> Solution().makeTheIntegerZero(1000000000, -112342)
    15
    """

    def makeTheIntegerZero(self, num1: int, num2: int) -> int:
        # num1 - (some_binary + ans * num2) = 0
        # num1 - ans * num2 - (should have less bits than ans) = 0
        # actually there should be such a number
        # that is made of exactly ans powers of two.
        # Can I make a number from exactly ans powers of two?
        # Yes if the number >= ans.
        for ans in range(1, 61):
            target = num1 - ans * num2
            if target >= ans and target.bit_count() <= ans:
                return ans
        return -1
