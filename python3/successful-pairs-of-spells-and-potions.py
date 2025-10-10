class Solution:
    """
    >>> Solution().successfulPairs([5,1,3], [1,2,3,4,5], 7)
    [4, 0, 3]
    >>> Solution().successfulPairs([3, 1, 2], [8, 5, 8], 16)
    [2, 0, 2]
    """

    def successfulPairs(
        self, spells: list[int], potions: list[int], success: int
    ) -> list[int]:
        sorted_potions = sorted(potions)
        return [
            self.successful_pairs(spell_strength, sorted_potions, success)
            for spell_strength in spells
        ]

    def successful_pairs(self, spell_strength, potions, success) -> int:
        first_strong = self.binary_search(
            len(potions),
            lambda i: spell_strength * potions[i] >= success
        )
        return len(potions) - first_strong

    def binary_search(self, end, predicate) -> int:
        lo = 0
        hi = end
        while lo < hi:
            mi = (lo + hi) // 2
            if predicate(mi):
                hi = mi
            else:
                lo = mi + 1
        return lo
