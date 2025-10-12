class Solution:
    """
    >>> Solution().exist([["A","B","C","E"],["S","F","E","S"],["A","D","E","E"]], 'ABCESEEEFS')
    True
    >>> Solution().exist([["a", "a"]], "a")
    True
    """

    def exist(self, board: list[list[str]], word: str) -> bool:
        def recur(i, j, k):
            if k >= len(word):
                return True
            if i < 0 or len(board) <= i:
                return False
            if j < 0 or len(board[i]) <= j:
                return False

            if board[i][j] != word[k]:
                return False

            board[i][j] = None
            result = \
                recur(i + 1, j, k + 1) or \
                recur(i - 1, j, k + 1) or \
                recur(i, j + 1, k + 1) or \
                recur(i, j - 1, k + 1)
            board[i][j] = word[k]

            return result

        for i, row in enumerate(board):
            for j, _ in enumerate(row):
                if recur(i, j, 0):
                    return True
        return False
