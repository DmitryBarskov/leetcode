from typing import List

from collections import defaultdict

import math


class Solution:
    """
    >>> Solution().hasGroupsSizeX([1,2,3,4,4,3,2,1])
    True
    >>> Solution().hasGroupsSizeX([1,1,1,2,2,2,3,3])
    False
    """

    def hasGroupsSizeX(self, deck: List[int]) -> bool:
        cards_count = defaultdict(lambda: 0)
        for card in deck:
            cards_count[card] += 1

        x = cards_count[deck[0]]
        for card_count in cards_count.values():
            x = math.gcd(x, card_count)
            if x == 1:
                return False
        return x > 1
