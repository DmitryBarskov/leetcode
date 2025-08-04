class Solution:
    """
    >>> Solution().lengthAfterTransformations("abcyy", 2, [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2])
    7
    >>> Solution().lengthAfterTransformations("azbk", 1, [2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2])
    8
    """
    def lengthAfterTransformations(self, s: str, t: int, nums: list[int]) -> int:
        res = self.as_matrix(self.count_chars(s))
        m = self.as_matrix(nums)
        for _ in range(t):
            res = self.multiply(res, m)
        return sum(map(sum, m))

    def as_matrix(self, row: list[int]) -> list[list[int]]:
        """
        >>> Solution().as_matrix([1, 2, 3])
        [[1, 0, 0], [0, 2, 0], [0, 0, 3]]
        """
        m = [[0] * len(row) for _ in row]
        for i, item in enumerate(row):
            m[i][i] = item
        return m

    def multiply(self, a: list[list[int]], b: list[list[int]]) -> list[list[int]]:
        """
        >>> Solution().multiply([[1, 2, 3], [4, 5, 6]], [[7, 8], [9, 10], [11, 12]])
        [[58, 64], [139, 154]]
        """
        res = [[0] * len(b[0]) for _ in a]
        for i, row in enumerate(res):
            for j, _ in enumerate(row):
                res[i][j] = 0
                for k in range(0, len(a[0])):
                    res[i][j] += a[i][k] * b[k][j]
        return res

    def count_chars(self, s: str) -> list[int]:
        """
        >>> Solution().count_chars("abcyy")
        [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0]
        """
        count = [0 for _ in range(26)]
        for char in s:
            count[ord(char) - ord('a')] += 1
        return count
