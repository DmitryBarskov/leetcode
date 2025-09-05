from typing import List

import functools


class Solution:
    """
    >>> Solution().wordBreak("leetcode", ["leet","code"])
    True
    >>> Solution().wordBreak("applepenapple", ["apple","pen"])
    True
    >>> Solution().wordBreak("catsandog", ["cats","dog","sand","and","cat"])
    False
    >>> Solution().wordBreak("bccdbacdbdacddabbaaaadababadad", ["cbc","bcda","adb","ddca","bad","bbb","dad","dac","ba","aa","bd","abab","bb","dbda","cb","caccc","d","dd","aadb","cc","b","bcc","bcd","cd","cbca","bbd","ddd","dabb","ab","acd","a","bbcc","cdcbd","cada","dbca","ac","abacd","cba","cdb","dbac","aada","cdcda","cdc","dbc","dbcb","bdb","ddbdd","cadaa","ddbc","babb"])
    True
    >>> Solution().wordBreak("a" * 300, ["a" * i for i in range(1, 12)])
    True
    >>> Solution().wordBreak("a" * 299 + "b", ["a" * i for i in range(1, 20)])
    False
    """
    def wordBreak(self, s: str, wordDict: List[str]) -> bool:
        trie = self.build_trie(wordDict)

        cache = {} # python cannot hash a dict, so I added j
        # to represent position in trie and cache by it
        def iter(i: int, j: int, t):
            if t is None:
                return False
            if (i, j) in cache:
                return cache[(i, j)]
            if i >= len(s):
                cache[(i, j)] = 'end' in t
                return cache[(i, j)]
            cache[(i, j)] = iter(i + 1, j + 1, t.get(s[i])) or 'end' in t and iter(i, 0, trie)
            return cache[(i, j)]

        return iter(0, 0, trie)

    def build_trie(self, words: List[str]) -> dict:
        """
        >>> Solution().build_trie(["cats","dog","cat"])
        {'c': {'a': {'t': {'s': {'end': True}, 'end': True}}}, 'd': {'o': {'g': {'end': True}}}}
        >>> Solution().build_trie(["apple","pen"])
        {'a': {'p': {'p': {'l': {'e': {'end': True}}}}}, 'p': {'e': {'n': {'end': True}}}}
        """
        trie = {}
        for word in words:
            t = trie
            for char in word:
                if char not in t:
                    t[char] = {}
                t = t[char]
            t['end'] = True
        return trie
