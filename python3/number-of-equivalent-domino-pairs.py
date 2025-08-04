from typing import List

class Solution:
    def numEquivDominoPairs(self, dominoes: List[List[int]]) -> int:
        unique = [0] * 91
        for top, bottom in dominoes:
            top, bottom = min(top, bottom), max(top, bottom)
            id = top * 9 + bottom
            unique[id] += 1
        return sum(map(lambda n: n * (n - 1) // 2, unique))
