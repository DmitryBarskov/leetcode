import math


class Solution:
    def largestTriangleArea(self, points: list[list[int]]) -> float:
        max_area = 0
        for a in range(len(points)):
            for b in range(a + 1, len(points)):
                for c in range(b + 1, len(points)):
                    max_area = max(self.area(points[a], points[b], points[c]), max_area)
        return max_area

    def area(self, a, b, c) -> float:
        return 0.5 * abs(a[0] * (b[1] - c[1]) + b[0] * (c[1] - a[1]) + c[0] * (a[1] - b[1]))
