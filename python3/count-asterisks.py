from functools import reduce

class Solution:
    def countAsterisks(self, s: str) -> int:
        def iterate(acc, char):
            asterisks, in_pair = acc
            if char == '|':
                return (asterisks, not in_pair)
            if char == '*' and in_pair:
                return (asterisks + 1, in_pair)
            return (asterisks, in_pair)
        return reduce(iterate, s, (0, True))[0]
