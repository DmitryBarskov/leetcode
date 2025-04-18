from typing import Generator, List, Set

class Solution:
    """
    >>> Solution().longestNiceSubarray([1,3,8,48,10])
    3
    >>> Solution().longestNiceSubarray([3,1,5,11,13])
    1
    >>> Solution().longestNiceSubarray([1090, 16384, 33, 217313281])
    3
    """

    def longestNiceSubarray(self, nums: List[int]) -> int:
        l: int = 0
        longest: int = 1
        set_once: Set[int] = set()
        set_twice: Set[int] = set()
        for r, _ in enumerate(nums):
            self._add_bits(set_once, set_twice, nums[r])
            while l < r and len(set_twice) > 0:
                self._remove_bits(set_once, set_twice, nums[l])
                l += 1
            longest = max(longest, r - l + 1)
            if longest == 4:
                print(nums, l, r, set_once, set_twice)
        return longest

    def _add_bits(self, set_once: Set[int], set_twice: Set[int], bits: int):
        for i, bit in enumerate(self._bits(bits)):
            if bit == 0:
                continue
            if i in set_once:
                set_twice.add(i)
            else:
                set_once.add(i)

    def _remove_bits(self, set_once: Set[int], set_twice: Set[int], bits: int):
        for i, bit in enumerate(self._bits(bits)):
            if bit == 0:
                continue
            if i in set_twice:
                set_twice.remove(i)
            else:
                set_once.remove(i)

    def _bits(self, num: int) -> Generator[int, None, None]:
        """
        >>> list(Solution()._bits(4))
        [0, 0, 1]
        >>> list(Solution()._bits(3))
        [1, 1]
        >>> list(Solution()._bits(1))
        [1]
        >>> list(Solution()._bits(8))
        [0, 0, 0, 1]
        >>> list(Solution()._bits(48))
        [0, 0, 0, 0, 1, 1]
        """
        while num > 0:
            yield (num & 1)
            num >>= 1
