class LinkedList:
    def __init__(self, head, tail=None):
        self.head = head
        self.tail = tail
        if tail is None:
            self._length = 1
        else:
            self._length = 1 + len(tail)

    def as_list(self):
        l = [None] * len(self)
        i = len(l) - 1
        it = self
        while it is not None:
            l[i] = it.head
            i -= 1
            it = it.tail
        return l

    def __len__(self):
        return self._length


class Solution:
    """
    >>> Solution().getWordsInLongestSubsequence(["bab","dab","cab"], [1,2,2])
    ["bab", "cab"]
    """
    def getWordsInLongestSubsequence(self, words: list[str], groups: list[int]) -> list[str]:
        longest = [LinkedList(word) for word in words]
        
        for i in range(0, len(words)):
            for j in range(0, i):
                if groups[i] == groups[j]:
                    continue
                if len(words[i]) != len(words[j]):
                    continue
                if self.distance(words[i], words[j]) != 1:
                    continue
                if len(longest[j]) + 1 > len(longest[i]):
                    longest[i] = LinkedList(words[i], longest[j])
        return max(longest, key=lambda ll: len(ll)).as_list()

    def distance(self, word1, word2) -> int:
        d = 0
        for c1, c2 in zip(word1, word2):
            if c1 != c2:
                d += 1
        return d
