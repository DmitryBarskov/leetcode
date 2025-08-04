class Solution:
    def countSubstrings(self, s: str) -> int:
        def count_palindromes(center1: int, center2: int) -> int:
            count = 0
            while 0 <= center1 and center2 < len(s) and s[center1] == s[center2]:
                count += 1
                center1 -= 1
                center2 += 1
            return count
        count = 0
        for i, _ in enumerate(s):
            count += count_palindromes(i, i)
            count += count_palindromes(i, i + 1)
        return count
