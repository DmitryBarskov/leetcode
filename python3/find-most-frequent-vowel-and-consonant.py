from collections import Counter


class Solution:
    """
    >>> Solution().maxFreqSum("successes")
    6
    >>> Solution().maxFreqSum("aeiaeia")
    3
    """

    vowels = set("aeiou")

    def maxFreqSum(self, s: str) -> int:
        max_vowels = 0
        max_consonants = 0
        for l, c in Counter(s).items():
            if l in self.vowels:
                max_vowels = max(max_vowels, c)
            else:
                max_consonants = max(max_consonants, c)
        return max_vowels + max_consonants
