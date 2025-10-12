import functools
import math


MOD = 1_000_000_007


class Solution:
    """
    >>> Solution().magicalSum(m = 5, k = 5, nums = [1,10,100,10000,1000000])
    991600007
    >>> Solution().magicalSum(m = 2, k = 2, nums = [5,4,3,2,1])
    170
    """

    def magicalSum(self, m: int, k: int, nums: list[int]) -> int:

        @functools.cache
        def recur(remaining, needed, index, carry):
            if remaining < 0 or needed < 0:
                return 0
            if remaining + carry.bit_count() < needed:
                return 0
            if remaining == 0 and needed == carry.bit_count():
                return 1
            if remaining == 0:
                return 0
            if index >= len(nums):
                return 0

            ans = 0
            for take in range(remaining + 1):
                ways = math.comb(remaining, take) * pow(nums[index], take, MOD) % MOD
                new_carry = carry + take
                ans = (
                    ans + ways * recur(
                        remaining - take,
                        needed - new_carry % 2,
                        index + 1,
                        new_carry // 2
                    )
                ) % MOD
            return ans
        return recur(m, k, 0, 0)
