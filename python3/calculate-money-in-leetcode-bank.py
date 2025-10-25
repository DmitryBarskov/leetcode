class Solution:
    """
    >>> Solution().totalMoney(7)
    28
    >>> Solution().totalMoney(14)
    63
    >>> Solution().totalMoney(21)
    105
    >>> Solution().totalMoney(28)
    154
    >>> Solution().totalMoney(4)
    10
    >>> Solution().totalMoney(10)
    37
    >>> Solution().totalMoney(20)
    96
    """

    def totalMoney(self, n: int) -> int:
        # let w = whole weeks
        w = n // 7
        # calculate monday + tuesday + ... + sunday for whole weeks
        # w(w+1)/2 + w(w+1)/2+w + w(w+1)/2+2w + ... + w(w+1)/2+6w =
        # = 7w(w+1)/2 + 21w = 7w( (w+1)/2 + 3 )

        # + rest days from the last partial week
        # monday gives $w, tuesday $w+1 etc to n%7
        # first term of this progression is w+1, last is w+1+n%7,
        # number of days is n%7, sum is (n % 7) * (2w + n % 7) // 2
        return 7 * w * (w + 1) // 2 + 21 * w + (n % 7) * (2 * w + 1 + n % 7) // 2
