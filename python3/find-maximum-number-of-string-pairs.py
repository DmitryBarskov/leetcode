class Solution:
    """
    >>> Solution().maximumNumberOfStringPairs(["cd","ac","dc","ca","zz"])
    2
    """
    def maximumNumberOfStringPairs(self, words: list[str]) -> int:
        pairs = 0
        met = set()
        for word in words:
            reversed_word = "".join(reversed(word))
            if reversed_word in met:
                pairs += 1
                met.remove(reversed_word)
            else:
                met.add(word)
        return pairs
