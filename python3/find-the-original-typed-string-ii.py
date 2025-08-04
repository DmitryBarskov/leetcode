import functools

# TODO
class Solution:
    def possibleStringCount(self, word: str, k: int) -> int:
        """
        >>> Solution().possibleStringCount("aabbccdd", 7)
        5
        >>> Solution().possibleStringCount("aabbcddd", 8)
        1
        >>> Solution().possibleStringCount("aaabbb", 3)
        8
        >>> Solution().possibleStringCount("aaaabbbbbbcccc", 5)
        92
        """
        groups = list(map(lambda x: x - 1, self.count_consecutive(word)))

        @functools.cache
        def recur(g, chars_so_far):
            if g >= len(groups) and chars_so_far < k:
                return 0
            if g >= len(groups) and chars_so_far >= k:
                return 1
            if chars_so_far >= k:
                return functools.reduce(
                    lambda acc, x: acc * max(x - 1, 1),
                    groups[g:],
                    1
                )
            result = 0
            for i in range(groups[g] + 1):
                result += recur(g + 1, chars_so_far + i)
            return result
        return recur(0, len(groups))

    def count_consecutive(self, s: str):
        """
        >>> list(Solution().count_consecutive("aabbcddd"))
        [2, 2, 1, 3]
        """
        last_char = s[0]
        count = 0
        for c in s:
            if c == last_char:
                count += 1
            else:
                yield count
                count = 1
                last_char = c
        yield count
