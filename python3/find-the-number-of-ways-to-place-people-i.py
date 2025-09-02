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
        pairs = 0
        for a in points:
            for b in points:
                if a == b:
                    continue
                # make sure a is on upper left of b
                if not (a[0] <= b[0] and a[1] >= b[1]):
                    continue
                if any(map(self._inside(a, b), filter(lambda p: p not in (a, b), points))):
                    continue
                pairs += 1
        return pairs

    def _inside(self, top_left, bottom_right):
        def inside(p):
            return top_left[0] <= p[0] <= bottom_right[0] and bottom_right[1] <= p[1] <= top_left[1]
        return inside 
