class Solution:
    """
    >>> Solution().findClosest(x = 2, y = 7, z = 4)
    1
    >>> Solution().findClosest(x = 2, y = 5, z = 6)
    2
    >>> Solution().findClosest(x = 1, y = 5, z = 3)
    0
    """

    def findClosest(self, x: int, y: int, z: int) -> int:
        d1 = abs(x - z)
        d2 = abs(y - z)
        if d1 == d2:
            return 0
        if d1 < d2:
            return 1
        if d2 < d1:
            return 2
        
