from functools import cache

class Solution:
    """
    >>> Solution().maxProfit([1,2,3,0,2])
    3
    >>> Solution().maxProfit([1])
    0
    >>> Solution().maxProfit([4,3,2,10,11,0,11])
    19
    >>> Solution().maxProfit([6,1,3,2,4,7])
    6
    """
    def maxProfit(self, prices: list[int]) -> int:
        @cache
        def sell(i):
            if i >= len(prices):
                return 0
            return max(prices[i] + buy(i + 2), sell(i + 1))
        @cache
        def buy(i):
            if i >= len(prices):
                return 0
            return max(-prices[i] + sell(i + 1), buy(i + 1))
        return buy(0)
