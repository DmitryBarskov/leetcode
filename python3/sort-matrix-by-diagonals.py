from typing import List


class Solution:
    """
    >>> Solution().sortMatrix([[1,7,3],[9,8,2],[4,5,6]])
    [[8, 2, 3], [9, 6, 7], [4, 5, 1]]
    >>> Solution().sortMatrix([[0,1],[1,2]])
    [[2, 1], [1, 0]]
    >>> Solution().sortMatrix([[1]])
    [[1]]
    """

    def sortMatrix(self, grid: List[List[int]]) -> List[List[int]]:
        size = len(grid)
        sorted_matrix = [[None] * size for row in grid]
        for d in range(0, size):
            diagonal = list(self.square_diagonal(d, 0, size))
            diagonal_values = map(lambda cell: grid[cell[0]][cell[1]], diagonal)
            sorted_diagonal = sorted(diagonal_values, reverse=True)
            for (i, j), v in zip(diagonal, sorted_diagonal):
                sorted_matrix[i][j] = v
        for d in range(1, size):
            diagonal = list(self.square_diagonal(0, d, size))
            diagonal_values = map(lambda cell: grid[cell[0]][cell[1]], diagonal)
            sorted_diagonal = sorted(diagonal_values)
            for (i, j), v in zip(diagonal, sorted_diagonal):
                sorted_matrix[i][j] = v
        return sorted_matrix

    def square_diagonal(self, r0: int, c0: int, size: int):
        r, c = r0, c0
        while r < size and c < size:
            yield (r, c)
            r += 1
            c += 1
