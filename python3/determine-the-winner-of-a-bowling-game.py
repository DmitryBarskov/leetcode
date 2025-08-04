from functools import reduce
from typing import List

class Solution:
    def isWinner(self, player1: List[int], player2: List[int]) -> int:
        s1 = self.score(player1)
        s2 = self.score(player2)
        if s1 > s2: return 1
        elif s1 < s2: return 2
        else: return 0
    
    def score(self, pins_hit: List[int]) -> int:
        return reduce(
            lambda acc, pins: (acc[0] + pins * (2 if 10 in acc[1] else 1), [pins, acc[1][0]]),
            pins_hit,
            (0, [0, 0])
        )[0]
