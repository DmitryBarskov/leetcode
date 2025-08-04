class Solution:
    """
    >>> Solution().change(5, [1, 2, 5])
    4
    """
    def change(self, amount: int, coins: list[int]) -> int:
        coins.sort()
        ways = [0] * (amount + 1)
        ways[0] = 1
        for coin in coins:
            for current_amount in range(amount):
                if current_amount + coin > amount:
                    break
                ways[current_amount + coin] += ways[current_amount]
        return ways[amount]
