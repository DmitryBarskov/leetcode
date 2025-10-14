from collections import Counter


class Solution:
    def removeAnagrams(self, words: list[str]) -> list[str]:
        def anagrams(count1, count2) -> bool:
            if len(count1) != len(count2):
                return False
            for k in count1:
                if k not in count2 or count1[k] != count2[k]:
                    return False
            return True

        ans = [words[0]]
        last_word_count = Counter(words[0])

        for word in words:
            word_count = Counter(word)
            if anagrams(last_word_count, word_count):
                continue
            ans.append(word)
            last_word_count = word_count

        return ans
