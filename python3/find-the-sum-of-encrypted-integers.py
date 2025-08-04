import functools
import itertools

class Solution:
    def sumOfEncryptedInt(self, nums: List[int]) -> int:
        def encrypt(num: int) -> int:
            largest_digit = 0
            digits = 0
            while num > 0:
                largest_digit = max(largest_digit, num % 10)
                digits += 1
                num //= 10
            return sum((largest_digit * (10 ** i) for i in range(digits)))
        return sum(map(encrypt, nums))
