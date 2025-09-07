from typing import List


class Solution:
    """
    >>> Solution().spiralOrder([[1,2,3],[4,5,6],[7,8,9]])
    [1, 2, 3, 6, 9, 8, 7, 4, 5]
    >>> Solution().spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]])
    [1, 2, 3, 4, 8, 12, 11, 10, 9, 5, 6, 7]
    """
    def spiralOrder(self, matrix: List[List[int]]) -> List[int]:
        top = 0
        bottom = len(matrix) - 1
        left = 0
        right = len(matrix[0]) - 1

        spiral = []
        while top <= bottom and left <= right:
            for j in range(left, right + 1):
                spiral.append(matrix[top][j])
            top += 1
            for i in range(top, bottom + 1):
                spiral.append(matrix[i][right])
            right -= 1
            if top > bottom or left > right:
                break
            for j in range(right, left - 1, -1):
                spiral.append(matrix[bottom][j])
            bottom -= 1
            for i in range(bottom, top - 1, -1):
                spiral.append(matrix[i][left])
            left += 1
        return spiral
