class Solution:
    """
    >>> Solution().longestPalindrome("babad") in ("bab", "aba")
    True
    >>> Solution().longestPalindrome("cbbd")
    'bb'
    """

    def longestPalindrome(self, s: str) -> str:
        def find_palindrome(i, j) -> tuple[int, int]:
            while 0 <= i and j < len(s) and s[i] == s[j]:
                i -= 1
                j += 1
            i += 1
            j -= 1
            return (i, j)
        longest = 0
        longest_start, longest_end = None, None
        for i, _ in enumerate(s):
            for j in (i, i + 1):
                start, end = find_palindrome(i, j)
                length = end - start + 1
                if length > longest:
                    longest = length
                    longest_start, longest_end = start, end
        return s[longest_start:longest_end + 1]
