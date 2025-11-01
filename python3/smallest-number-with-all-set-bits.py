class Solution:
    all_set_bits = [1, 3, 7, 15, 31, 63, 127, 255, 511, 1023]

    def smallestNumber(self, n: int) -> int:
        for i in self.all_set_bits:
            if i >= n:
                return i
