from functools import reduce

class Solution:
    def numRookCaptures(self, board: list[list[str]]) -> int:
        rook = self.find_rook(board)
        if rook is None:
            return 0
        return reduce(
            lambda s, d: s + self.scan(board, rook, d),
            [(-1, 0), (0, 1), (1, 0), (0, -1)],
            0
        )

    def find_rook(self, board: list[list[str]]) -> tuple[int, int] | None:
        for i, row in enumerate(board):
            for j, square in enumerate(row):
                if square == 'R':
                    return (i, j)
        return None
    
    def scan(self, board, rook: tuple[int, int], direction: tuple[int, int]):
        y, x = rook
        while 0 <= y < len(board) and 0 <= x < len(board[y]):
            if board[y][x] == 'p':
                return 1
            if board[y][x] == 'B':
                return 0
            y += direction[0]
            x += direction[1]
        return 0
