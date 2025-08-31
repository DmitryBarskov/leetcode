from typing import List

import itertools


# TODO
class Solution:
    """
    >>> board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
    >>> sorted(Solution().digits_in_column(board, 3))
    ['1', '4', '8']
    >>> sorted(Solution().digits_in_row(board, 4))
    ['1', '3', '4', '8']
    >>> sorted(Solution().digits_in_square(board, 2, 2))
    ['3', '5', '6', '8', '9']
    >>> sorted(Solution().digits_in_square(board, 2, 3))
    ['1', '5', '7', '9']
    >>> sorted(Solution().cell_available_digits(board, 8, 6))
    ['1', '3', '4', '6']
    >>> sorted(Solution().cell_available_digits(board, 7, 7))
    ['3']
    >>> Solution().solveSudoku(board)
    >>> board
    [['5', '3', '4', '6', '7', '8', '9', '1', '2'], ['6', '7', '2', '1', '9', '5', '3', '4', '8'], ['1', '9', '8', '3', '4', '2', '5', '6', '7'], ['8', '5', '9', '7', '6', '1', '4', '2', '3'], ['4', '2', '6', '8', '5', '3', '7', '9', '1'], ['7', '1', '3', '9', '2', '4', '8', '5', '6'], ['9', '6', '1', '5', '3', '7', '2', '8', '4'], ['2', '8', '7', '4', '1', '9', '6', '3', '5'], ['3', '4', '5', '2', '8', '6', '1', '7', '9']]

    >>> board = [[".",".",".",".",".",".",".",".","."],[".","9",".",".","1",".",".","3","."],[".",".","6",".","2",".","7",".","."],[".",".",".","3",".","4",".",".","."],["2","1",".",".",".",".",".","9","8"],[".",".",".",".",".",".",".",".","."],[".",".","2","5",".","6","4",".","."],[".","8",".",".",".",".",".","1","."],[".",".",".",".",".",".",".",".","."]]
    >>> Solution().solveSudoku(board)
    >>> board
    [['7', '2', '1', '8', '5', '3', '9', '4', '6'], ['4', '9', '5', '6', '1', '7', '8', '3', '2'], ['8', '3', '6', '4', '2', '9', '7', '5', '1'], ['9', '6', '7', '3', '8', '4', '1', '2', '5'], ['2', '1', '4', '7', '6', '5', '3', '9', '8'], ['3', '5', '8', '2', '9', '1', '6', '7', '4'], ['1', '7', '2', '5', '3', '6', '4', '8', '9'], ['6', '8', '3', '9', '4', '2', '5', '1', '7'], ['5', '4', '9', '1', '7', '8', '2', '6', '3']]
    """
    ALL_DIGITS = {str(d) for d in range(1, 10)}

    def solveSudoku(self, board: List[List[str]]) -> None:
        empty_cells = [
            (i, j) for i, j in itertools.product(range(len(board)), range(len(board[0])))
            if board[i][j] == "."
        ]
        available_digits = self.fill_available_digits(board)
        empty_cells.sort(key=lambda c: len(available_digits[c[0]][c[1]]), reverse=True)
        if self.recur(board, available_digits, empty_cells):
            return
        raise RuntimeError("Cannot solve")

    def recur(self, board, available_digits, needs_a_digit):
        if len(needs_a_digit) == 0:
            return True
        i, j = needs_a_digit.pop()
        if len(available_digits[i][j]) == 0:
            needs_a_digit.append((i, j))
            return False
        for candidate in available_digits[i][j]:
            board[i][j] = candidate
            modified_cells = self.remove_available_digit(available_digits, i, j, candidate)
            if self.recur(board, available_digits, needs_a_digit):
                return True
            board[i][j] = "."
            self.restore_available_digit(available_digits, candidate, modified_cells)
        needs_a_digit.append((i, j))
        return False

    def fill_available_digits(self, board):
        return [
            [self.cell_available_digits(board, i, j) if cell == "." else None for j, cell in enumerate(row)]
            for i, row in enumerate(board)
        ]

    def cell_available_digits(self, board, i, j):
        return Solution.ALL_DIGITS \
                - self.digits_in_column(board, j) \
                - self.digits_in_row(board, i) \
                - self.digits_in_square(board, i, j)

    def digits_in_column(self, board, col):
        return {digit for _, _, digit in self.enumerate_column(board, col)}
    
    def digits_in_row(self, board, row):
        return {digit for _, _, digit in self.enumerate_row(board, row)}

    def digits_in_square(self, board, i, j):
        return {digit for _, _, digit in self.enumerate_square(board, i, j)}

    def enumerate_column(self, board, column):
        for i, row in enumerate(board):
            if row[column] is None or row[column] == ".":
                continue
            yield (i, column, row[column])

    def enumerate_row(self, board, row):
        for i, cell in enumerate(board[row]):
            if cell is None or cell == ".":
                continue
            yield (row, i, cell)

    def enumerate_square(self, board, row, column):
        sq_start_row = row // 3 * 3
        sq_start_col = column // 3 * 3
        for dr, dc in itertools.product([0, 1, 2], [0, 1, 2]):
            i = sq_start_row + dr
            j = sq_start_col + dc
            if board[i][j] is None or board[i][j] == ".":
                continue
            yield (i, j, board[i][j])

    def remove_available_digit(self, available_digits, r, c, digit):
        modified_cells = []
        self.remove_available_digit_in_row(available_digits, r, digit, modified_cells)
        self.remove_available_digit_in_col(available_digits, c, digit, modified_cells)
        self.remove_available_digit_in_square(available_digits, r, c, digit, modified_cells)
        return modified_cells

    def remove_available_digit_in_row(self, available_digits, row, digit, modified_cells):
        for i, j, cell_available_digits in self.enumerate_row(available_digits, row):
            if digit not in cell_available_digits:
                continue
            cell_available_digits.remove(digit)
            modified_cells.append((i, j))

    def remove_available_digit_in_col(self, available_digits, col, digit, modified_cells):
        for i, j, cell_available_digits in self.enumerate_column(available_digits, col):
            if digit not in cell_available_digits:
                continue
            cell_available_digits.remove(digit)
            modified_cells.append((i, j))

    def remove_available_digit_in_square(self, available_digits, row, col, digit, modified_cells):
        for i, j, cell_available_digits in self.enumerate_square(available_digits, row, col):
            if digit not in cell_available_digits:
                continue
            cell_available_digits.remove(digit)
            modified_cells.append((i, j))

    def restore_available_digit(self, available_digits, digit, modified_cells):
        for i, j in modified_cells:
            available_digits[i][j].add(digit)
