from typing import Generator, List, Tuple
import itertools

class Solution:
    """
    >>> Solution().findDiagonalOrder([[1,2,3],[4,5,6],[7,8,9]])
    [1, 2, 4, 7, 5, 3, 6, 8, 9]
    """

    Traverse = Generator[Tuple[int, int], None, None]

    def findDiagonalOrder(self, mat: List[List[int]]) -> List[int]:
        rows = len(mat)
        columns = len(mat[0])
        return [mat[i][j] for i, j in self.diagonal_order(rows, columns)]

    def diagonal_order(self, rows: int, columns: int) -> Generator[int, None, None]:
        directions = itertools.cycle([lambda x: x, lambda g: reversed(list(g))])
        for (r0, c0), apply_dir in zip(
                self.diagonal_beginnings(rows, columns),
                directions
        ):
            diagonal = self.traverse_diagonal(r0, c0, rows, columns)
            yield from apply_dir(diagonal)

    def diagonal_beginnings(self, rows: int, columns: int) -> Traverse:
        yield from ((row, 0) for row in range(rows))
        yield from ((rows - 1, col) for col in range(1, columns))

    def traverse_diagonal(self, r0: int, c0: int, rows: int, columns: int) -> Traverse:
        i, j = r0, c0
        while 0 <= i < rows and 0 <= j < columns:
            yield (i, j)
            i -= 1
            j += 1
