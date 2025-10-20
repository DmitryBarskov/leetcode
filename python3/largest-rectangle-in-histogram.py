import math


class Solution:
    """
    >>> Solution().largestRectangleArea([2,1,5,6,2,3])
    10
    >>> Solution().largestRectangleArea([2, 4])
    4
    >>> Solution().largestRectangleArea([2, 4, 2])
    6
    >>> Solution().largestRectangleArea([2, 1, 2])
    3
    >>> Solution().largestRectangleArea([2])
    2
    """

    def largestRectangleArea(self, heights: list[int]) -> int:
        stack = [(0, -1)]
        max_area = 0
        for i, height in enumerate(heights):
            start = None
            while len(stack) > 0 and height < stack[-1][0]:
                higher, start = stack.pop()
                max_area = max(max_area, higher * (i - start))
            start = i if start is None else start
            stack.append((height, start))
        while len(stack) > 0:
            higher, start = stack.pop()
            max_area = max(max_area, higher * (len(heights) - start))
        return max_area
