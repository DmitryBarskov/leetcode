class Solution:
    def numWaterBottles(self, numBottles: int, numExchange: int) -> int:
        drank = 0
        full = numBottles
        empty = 0
        while full > 0:
            drank += full
            empty += full
            full = 0

            full = empty // numExchange
            empty %= numExchange
        return drank
