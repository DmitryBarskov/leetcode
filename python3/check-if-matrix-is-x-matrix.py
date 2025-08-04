class Solution:
    def checkXMatrix(self, grid: List[List[int]]) -> bool:
        n = len(grid)
        for i, row in enumerate(grid):
            for j, cell in enumerate(row):
                if (i == j or i == n - j - 1) and cell == 0:
                    return False
                if i != j and i != n - j - 1 and cell != 0:
                    return False
        return True
