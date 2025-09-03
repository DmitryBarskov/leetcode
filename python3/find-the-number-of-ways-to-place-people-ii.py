from typing import List


class Solution:
    """
    >>> Solution().numberOfPairs([[1,1],[2,2],[3,3]])
    0
    >>> Solution().numberOfPairs([[6,2],[4,4],[2,6]])
    2
    >>> Solution().numberOfPairs([[3,1],[1,3],[1,1]])
    2
    """

    def numberOfPairs(self, points: List[List[int]]) -> int:
        points.sort(key=lambda p: (p[0], -p[1]))
        pairs = 0
        for i, _ in enumerate(points):
            # points[i] = place for Alice (upper left)

            # store 
            y_max = -10**9-1

            for j in range(i + 1, len(points)):
                # points[j] = place for Bob (lower right)
                # points[i].x <= points[j].x at this point due to sorting

                # skip when right point is higher than left point
                if points[i][1] < points[j][1]:
                    continue

                # rectangle with no points inside can only be formed as
                # the Y grows from left to right. consider A
                #vvv this is points[i]. So points[j] must go higher and higher
                # A              from left to right in order to form rectangle
                #            .   with no poits inside. If a point appears lower
                #          .     than previous, the previous one will be inside
                #      .    x    such a rectangle. . - B points forming rectangles,
                #     .  x       x - points not forming such a rectangle.
                if points[j][1] > y_max:
                    pairs += 1
                y_max = max(y_max, points[j][1])
        return pairs

    def _inside(self, top_left, bottom_right):
        def inside(p):
            return top_left[0] <= p[0] <= bottom_right[0] and bottom_right[1] <= p[1] <= top_left[1]
        return inside 
