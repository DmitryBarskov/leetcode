class Solution:
    """
    >>> Solution().findLexSmallestString(s = "5525", a = 9, b = 2)
    '2050'
    >>> Solution().findLexSmallestString(s = "74", a = 5, b = 1)
    '24'
    >>> Solution().findLexSmallestString(s = "0011", a = 4, b = 2)
    '0011'
    """

    def findLexSmallestString(self, s: str, a: int, b: int) -> str:
        smallest = s
        visited = set()
        stack = [s]
        while len(stack) > 0:
            string = stack.pop()
            if string in visited:
                continue
            visited.add(string)
            smallest = min(smallest, string)
            stack.append(self.add(string, a))
            stack.append(self.rotate(string, b))
        return smallest

    def add(self, s: str, a: int) -> str:
        res = [None] * len(s)
        for i, char in enumerate(s):
            if i % 2 == 0:
                res[i] = char
            else:
                res[i] = chr((ord(char) - ord('0') + a) % 10 + ord('0'))
        return ''.join(res)

    def rotate(self, s: str, b: int) -> str:
        return s[b:] + s[:b]
