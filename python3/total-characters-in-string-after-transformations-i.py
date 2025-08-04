from functools import cache

class Solution:
    def lengthAfterTransformations(self, s: str, t: int) -> int:
        res = 0
        for char in s:
            res += self.a_transformations(t + ord(char) - ord('a'))
        return res % 1_000_000_007
    
    @cache
    def a_transformations(self, n: int) -> int:
        if n < 26: return 1
        return self.a_transformations(n - 26) + self.a_transformations(n - 25)
