class Solution:
    """
    >>> Solution().flowerGame(3, 2)
    3
    >>> Solution().flowerGame(1, 1)
    0
    >>> Solution().flowerGame(1, 4)
    2
    >>> Solution().flowerGame(4, 3)
    6
    >>> Solution().flowerGame(12312, 3)
    18468
    >>> Solution().flowerGame(42, 24444)
    513324
    """

    def flowerGame(self, n: int, m: int) -> int:
        # 0, 1 -> A (0 Not allowed)
        # 1, 0 -> A (0 Not allowed)
        # 2, 1 -> A
        # 2, 3 -> A
        # 3, 2 -> A
        # 3, 4 -> A
        return n * m // 2
