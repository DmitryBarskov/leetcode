from typing import List

class Solution:
    def areaOfMaxDiagonal(self, dimensions: List[List[int]]) -> int:
        """
        >>> Solution().areaOfMaxDiagonal([[9,3],[8,6]])
        48
        >>> Solution().areaOfMaxDiagonal([[3,4],[4,3]])
        12
        """
        return max(map(self.diagonal_squared_and_area, dimensions))[1]

    def diagonal_squared_and_area(self, length_and_width: List[int]):
        l, w = length_and_width
        return (l * l + w * w, l * w)
