from functools import cache


class Solution:
    """
    >>> Solution().maximumTotalDamage([1, 1, 3, 4])
    6
    >>> Solution().maximumTotalDamage([7, 1, 6, 6])
    13
    """

    def maximumTotalDamage(self, power: list[int]) -> int:
        power.sort()

        @cache
        def iter(spell):
            if spell >= len(power):
                return 0

            if_casted = spell + 1
            while if_casted < len(power) and power[spell] + 2 >= power[if_casted]:
                if_casted += 1

            actual_power = power[spell]
            if_skipped = spell + 1
            while if_skipped < len(power) and power[if_skipped] == power[spell]:
                actual_power += power[if_skipped]
                if_skipped += 1

            return max(
                actual_power + iter(if_casted),
                iter(if_skipped)
            )

        return iter(0)
