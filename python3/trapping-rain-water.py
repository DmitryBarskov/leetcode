from typing import List


class Solution:
    """
    ............
    .......#....
    ...#OOO##O#.
    .#O##O######
    # - wall
    O - water
    . - air
    >>> Solution().trap([0,1,0,2,1,0,1,3,2,1,2,1])
    6

    ......
    .....#
    #OOOO#
    #OO#O#
    ##O###
    ##O###
    >>> Solution().trap([4,2,0,3,2,5])
    9
    >>> Solution().trap([11,679])
    0
    >>> Solution().trap([766,576,765])
    189
    >>> Solution().trap([1, 3, 5, 6, 4, 2, 1, 0])
    0
    >>> Solution().trap([15,15,15,15,15])
    0
    """

    def trap(self, height: List[int]) -> int:
        peak = 0
        left_highest_wall = [peak := max(peak, h) for h in height]
        peak = 0
        right_highest_wall = reversed([peak := max(peak, h) for h in reversed(height)])
        water = 0
        for h, l, r in zip(height, left_highest_wall, right_highest_wall):
            water += max(min(l, r) - h, 0)
        return water
