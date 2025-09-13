class Solution:
    """
    >>> Solution().doesAliceWin("leetcoder")
    True
    >>> Solution().doesAliceWin("bbcd")
    False
    """

    vowels = set("aeoui")

    def doesAliceWin(self, s: str) -> bool:
        for c in s:
            if c in self.vowels:
                return True
        return False
