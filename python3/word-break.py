from typing import List

class Solution:
    """
    >>> Solution().wordBreak("leetcode", ["leet","code"])
    True
    >>> Solution().wordBreak("applepenapple", ["apple","pen"])
    True
    >>> Solution().wordBreak("catsandog", ["cats","dog","sand","and","cat"])
    False
    """
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        trie = self.build_trie(wordDict)
        can_reach = [False for _ in range(len(s)+1)]
        can_reach[0] = True
        for i in range(len(s)):
            if not can_reach[i]:
                continue
            t = trie
            for j in range(i, len(s)):
                t = t.get(s[j])
                if t is None:
                    break
                if "" in t:
                    can_reach[j + 1] = True
        return can_reach[len(s)]

    def build_trie(self, words: List[str]) -> dict:
        """
        >>> Solution().build_trie(["cats","dog","cat"])
        {'c': {'a': {'t': {'s': {'': True}, '': True}}}, 'd': {'o': {'g': {'': True}}}}
        """
        trie = {}
        for word in words:
            t = trie
            for char in word:
                if char not in t:
                    t[char] = {}
                t = t[char]
            t[""] = True
        return trie
