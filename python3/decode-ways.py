class Solution:
    def numDecodings(self, s: str) -> int:
        valid_codes = {str(x) for x in range(1, 27)}
        @cache
        def recur(i: int) -> int:
            if i == len(s):
                return 1
            res = 0
            if s[i] in valid_codes:
                res += recur(i + 1)
            if i + 1 < len(s) and s[i] + s[i + 1] in valid_codes:
                res += recur(i + 2)
            return res
        return recur(0)
