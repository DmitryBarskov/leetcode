class Solution:
    vowels = set("aeiou")

    def spellchecker(self, wordlist: list[str], queries: list[str]) -> list[str]:
        def lower_no_vowels(word: str) -> str:
            return ''.join([x if x not in self.vowels else '?' for x in word.lower()])

        exact = set()
        ignore_case = {}
        ignore_case_and_vowels = {}

        for word in wordlist:
            exact.add(word)

            if word.lower() not in ignore_case:
                ignore_case[word.lower()] = word
            if lower_no_vowels(word) not in ignore_case_and_vowels:
                ignore_case_and_vowels[lower_no_vowels(word)] = word

        def best_match(query: str) -> str:
            if query in exact:
                return query
            if query.lower() in ignore_case:
                return ignore_case[query.lower()]
            if lower_no_vowels(query) in ignore_case_and_vowels:
                return ignore_case_and_vowels[lower_no_vowels(query)]
            return ''

        return [best_match(q) for q in queries]
