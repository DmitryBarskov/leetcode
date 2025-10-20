import functools


class Solution:
    """
    >>> Solution().jobScheduling(startTime = [1,2,3,3], endTime = [3,4,5,6], profit = [50,10,40,70])
    120
    >>> Solution().jobScheduling(startTime = [1,2,3,4,6], endTime = [3,5,10,6,9], profit = [20,20,100,70,60])
    150
    >>> Solution().jobScheduling(startTime = [1,1,1], endTime = [2,3,4], profit = [5,6,4])
    6
    """
    def jobScheduling(self, startTime: list[int], endTime: list[int], profit: list[int]) -> int:
        def binary_search(start, end, predicate):
            lo = start
            hi = end
            while lo < hi:
                mi = (lo + hi) // 2
                if predicate(mi):
                    hi = mi
                else:
                    lo = mi + 1
            return lo

        jobs = sorted(zip(startTime, endTime, profit))

        @functools.cache
        def recur(i):
            if i >= len(jobs):
                return 0

            next_job = binary_search(i, len(jobs), lambda j: jobs[j][0] >= jobs[i][1])

            return max(
                recur(i + 1), # skip current job
                jobs[i][2] + recur(next_job) # schedule current job
            )

        return recur(0)
