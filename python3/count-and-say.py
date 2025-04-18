from functools import reduce

class Solution:
    def countAndSay(self, n: int) -> str:
        def count_and_say(word: str) -> str:
            def step(state: tuple[str, int, str], char: str) -> tuple[str, int, str]:
                prev, count, grouped = state
                if prev in (None, char):
                    return (char, count + 1, grouped)
                else:
                    return (char, 1, grouped + str(count) + prev)
            return step(reduce(step, word, (None, 0, "")), '')[2]
        return reduce(lambda acc, _: count_and_say(acc), range(n - 1), "1")
