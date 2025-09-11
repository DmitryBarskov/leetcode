class Solution:
    """
    >>> Solution().sortVowels("lEetcOde")
    'lEOtcede'
    >>> Solution().sortVowels("lYmpH")
    'lYmpH'
    """

    vowels = set(['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U'])

    def sortVowels(self, s: str) -> str:
        vowel_indices = []
        for i, c in enumerate(s):
            if c not in self.vowels:
                continue
            vowel_indices.append(i)
        vowel_indices.sort(key=lambda vi: s[vi])

        sorted_vowels = [None] * len(s)
        k = 0
        for i, c in enumerate(s):
            if c in self.vowels:
                sorted_vowels[i] = s[vowel_indices[k]]
                k += 1
            else:
                sorted_vowels[i] = s[i]
        return "".join(sorted_vowels)
