from typing import List

class Solution:
    """
    >>> Solution().numRabbits([1, 1, 2])
    5
    >>> Solution().numRabbits([10, 10, 10])
    11
    >>> Solution().numRabbits([2, 2, 2])
    3
    >>> Solution().numRabbits([2, 2, 2, 2])
    6
    """
    def numRabbits(self, answers: List[int]) -> int:
        colors = {}
        for answer in answers:
            rabbits = answer + 1
            if rabbits in colors and colors[rabbits][-1] > 0:
                colors[rabbits][-1] -= 1
            else:
                if rabbits not in colors:
                    colors[rabbits] = []
                colors[rabbits].append(answer)
        return sum((ans * len(c) for ans, c in colors.items()))
