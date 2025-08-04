from typing import List

class Solution:
    def diagonalSum(self, mat: List[List[int]]) -> int:
        s = 0
        for i, row in enumerate(mat):
            s += row[i]
            secondary = len(row) - 1 - i
            if i != secondary:
                s += row[secondary]
        return s
