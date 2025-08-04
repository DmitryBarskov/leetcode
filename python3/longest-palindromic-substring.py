class Solution:
    def longestPalindrome(self, s: str) -> str:
        def longest_palindrome(center1: int, center2: int) -> int:
            while 0 <= center1 and center2 < len(s) and s[center1] == s[center2]:
                center1 -= 1
                center2 += 1
            return (center1 + 1, center2 - 1)
        longest_start, longest_end = 0, 0
        for i in range(len(s)):
            for j in (i, i + 1):
                start, end = longest_palindrome(i, j)
                if end - start > longest_end - longest_start:
                    longest_start, longest_end = start, end
        return s[longest_start:longest_end+1]
