from typing import List

import itertools


class Solution:
    """
    >>> board1 = [
    ...  ["5","3",".",".","7",".",".",".","."]
    ... ,["6",".",".","1","9","5",".",".","."]
    ... ,[".","9","8",".",".",".",".","6","."]
    ... ,["8",".",".",".","6",".",".",".","3"]
    ... ,["4",".",".","8",".","3",".",".","1"]
    ... ,["7",".",".",".","2",".",".",".","6"]
    ... ,[".","6",".",".",".",".","2","8","."]
    ... ,[".",".",".","4","1","9",".",".","5"]
    ... ,[".",".",".",".","8",".",".","7","9"]]
    >>> Solution().isValidSudoku(board1)
    True
    >>> board2 = [
    ...  ["8","3",".",".","7",".",".",".","."]
    ... ,["6",".",".","1","9","5",".",".","."]
    ... ,[".","9","8",".",".",".",".","6","."]
    ... ,["8",".",".",".","6",".",".",".","3"]
    ... ,["4",".",".","8",".","3",".",".","1"]
    ... ,["7",".",".",".","2",".",".",".","6"]
    ... ,[".","6",".",".",".",".","2","8","."]
    ... ,[".",".",".","4","1","9",".",".","5"]
    ... ,[".",".",".",".","8",".",".","7","9"]]
    >>> Solution().isValidSudoku(board2)
    False
    """
    def isValidSudoku(self, board: List[List[str]]) -> bool:
        def valid_rows(rows):
            return all(map(valid_row, rows))
        def valid_row(row) -> bool:
            return all_unique(filter(lambda x: x != ".", row))
        def all_unique(items) -> bool:
            s = set()
            for item in items:
                if item in s:
                    return False
                else:
                    s.add(item)
            return True
        def columns(board):
            for c, _ in enumerate(board[0]):
                yield column(board, c)
        def column(board, c):
            for row in board:
                yield row[c]
        def squares(board):
            for i in range(0, len(board), 3):
                for j in range(0, len(board[i]), 3):
                    yield square(board, i, j)
        def square(board, i, j):
            for r, c in itertools.product([0, 1, 2], [0, 1, 2]):
                yield board[i + r][j + c]

        return valid_rows(board) and valid_rows(columns(board)) and valid_rows(squares(board))

