class Solution:
    """
    >>> Solution().findAnagrams("cbaebabacd", "abc")
    [0, 6]
    >>> Solution().findAnagrams(s = "abab", p = "ab")
    [0, 1, 2]
    """

    def findAnagrams(self, s: str, p: str) -> list[int]:
        if len(p) > len(s):
            return []

        target = {}
        for char in p:
            target[char] = target.get(char, 0) + 1

        count = {}
        for r in range(len(p)):
            count[s[r]] = count.get(s[r], 0) + 1
        
        result = []
        for r in range(len(p), len(s)):
            l = r - len(p)

            if self.eq(count, target):
                result.append(l)

            count[s[r]] = count.get(s[r], 0) + 1
            count[s[l]] -= 1
            if count[s[l]] == 0:
                count.pop(s[l])
        if self.eq(count, target):
            l = r - len(p)
            result.append(l + 1)
        return result

    def eq(self, d1: dict, d2: dict) -> bool:
        if len(d1) != len(d2):
            return False
        for k in d1:
            if k not in d2 or d1[k] != d2[k]:
                return False
        return True
