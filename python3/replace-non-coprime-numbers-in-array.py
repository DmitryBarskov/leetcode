import math


class Solution:
    """
    >>> Solution().replaceNonCoprimes([6,4,3,2,7,6,2])
    [12, 7, 6]
    >>> Solution().replaceNonCoprimes([2,2,1,1,3,3,3])
    [2, 1, 1, 3]
    >>> Solution().replaceNonCoprimes([287,41,49,287,899,23,23,20677])
    [2009, 20677]
    >>> Solution().replaceNonCoprimes([2, 3, 6])
    [6]
    """

    def replaceNonCoprimes(self, nums: list[int]) -> list[int]:
        result = [nums[0]]
        for i in range(1, len(nums)):
            lcm = nums[i]
            while len(result) > 0:
                gcd = math.gcd(result[-1], lcm)
                if gcd <= 1:
                    break
                lcm = math.lcm(result.pop(), lcm)
            result.append(lcm)
        return result
