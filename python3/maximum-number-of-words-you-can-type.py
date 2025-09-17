class Solution:
    """
    >>> Solution().canBeTypedWords("hello world", "ad")
    1
    >>> Solution().canBeTypedWords("leet code", "lt")
    1
    >>> Solution().canBeTypedWords("leet code", "e")
    0
    """
    def canBeTypedWords(self, text: str, brokenLetters: str) -> int:
        forbidden_letters = set(brokenLetters)
        words = 0
        state = 'in_word'
        for c in text:
            if state == 'in_word' and c == ' ':
                words += 1
                state = 'not_in_word'
            elif state == 'in_word' and c in forbidden_letters:
                state = 'in_broken_word'
            elif state == 'in_word':
                continue

            elif state == 'in_broken_word' and c == ' ':
                state = 'not_in_word'
            elif state == 'in_broken_word':
                continue

            elif state == 'not_in_word' and c in forbidden_letters:
                state = 'in_broken_word'
            elif state == 'not_in_word' and c == ' ':
                continue
            elif state == 'not_in_word' and c not in forbidden_letters:
                state = 'in_word'
            else:
                raise RuntimeError(f"Invaid state {state} {c}")
        if state == 'in_word':
            words += 1
        return words
        
