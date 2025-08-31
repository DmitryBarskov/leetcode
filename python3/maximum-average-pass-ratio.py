from typing import List

import heapq


class Solution:
    """
    >>> round(Solution().maxAverageRatio([[1,2],[3,5],[2,2]], 2), 5)
    0.78333
    >>> round(Solution().maxAverageRatio([[2,4],[3,9],[4,5],[2,10]], 4), 5)
    0.53485
    """

    def maxAverageRatio(self, classes: List[List[int]], extraStudents: int) -> float:
        heap = []
        for passed, total in classes:
            heapq.heappush(
                heap,
                (passed / total - (passed + 1) / (total + 1), passed, total)
            )
        for _ in range(extraStudents):
            _improve_ratio, passed, total = heapq.heappop(heap)
            heapq.heappush(
                heap,
                ((passed + 1) / (total + 1) - (passed + 2) / (total + 2), passed + 1, total + 1)
            )
        pass_ratio = 0.0
        for _, passed, total in heap:
            pass_ratio += passed / total
        return pass_ratio / len(heap)
