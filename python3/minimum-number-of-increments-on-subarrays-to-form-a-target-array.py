class Solution:
    """
    >>> Solution().minNumberOperations([1,2,3,2,1])
    3
    >>> Solution().minNumberOperations([3,1,1,2])
    4
    >>> Solution().minNumberOperations([3,1,5,4,2])
    7
    >>> Solution().minNumberOperations([3,4,1,1,2,6,6,4,4,5,3])
    10
    """

    def minNumberOperations(self, target: list[int]) -> int:
        prev_height = 0
        ops = 0
        for t in target:
            if prev_height > t:
                ops += prev_height - t
            prev_height = t
        ops += prev_height
        return ops
