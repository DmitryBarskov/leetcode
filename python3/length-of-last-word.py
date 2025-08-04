class Solution:
    def lengthOfLastWord(self, s: str) -> int:
        word_end = len(s) - 1
        while s[word_end] == ' ':
            word_end -= 1
        word_beginning = word_end
        while word_beginning >= 0 and s[word_beginning] != ' ':
            word_beginning -= 1
        return word_end - word_beginning
