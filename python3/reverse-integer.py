import math

class Solution:
    def reverse(self, x: int) -> int:
        if x == 0:
            return 0
        sign = 1 if x > 0 else -1
        reversed = 0
        while x != 0:
            d = int(math.fmod(x, 10))
            if reversed > 214748364 or reversed == 214748364 and d > 7:
                return 0
            if reversed < -214748364 or reversed == -214748364 and d < -8:
                return 0
            reversed = reversed * 10 + d
            x = math.trunc(x / 10)
        return reversed
