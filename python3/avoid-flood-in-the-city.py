class Solution:
    """
    >>> Solution().avoidFlood([1,2,3,4])
    [-1, -1, -1, -1]
    >>> Solution().avoidFlood([1,2,0,0,2,1])
    [-1, -1, 2, 1, -1, -1]
    >>> Solution().avoidFlood([1, 2, 0, 1, 2])
    []
    >>> Solution().avoidFlood([1,0,2,0,3,0,2,0,0,0,1,2,3])
    [-1, 1, -1, 2, -1, 3, -1, 2, 1, 1, -1, -1, -1]
    >>> Solution().avoidFlood([1,0,2,0,2,1])
    [-1, 1, -1, 2, -1, -1]
    """
    def avoidFlood(self, rains: list[int]) -> list[int]:
        filled_lakes = set()
        ans = [-1] * len(rains)
        next_rain = 0
        for i, rain in enumerate(rains):
            if rain > 0 and rain in filled_lakes:
                return []
            if rain > 0:
                filled_lakes.add(rain)
                continue

            next_rain = max(next_rain, i)
            while next_rain < len(rains) and rains[next_rain] == 0:
                next_rain += 1

            if next_rain >= len(rains):
                ans[i] = 1
                continue

            if rains[next_rain] in filled_lakes:
                ans[i] = rains[next_rain]
                filled_lakes.remove(rains[next_rain])
                next_rain += 1
            else:
                ans[i] = 1
        return ans
