import math

class Solution:
    def idealArrays(self, n: int, maxValue: int) -> int:
        """
        >>> Solution().idealArrays(3, 12)
        74
        """
        ideal_arrays = 0
        for i in range(1, maxValue + 1):
            ideal_arrays += self.nck(n, self.divisors_amount(i))
        return ideal_arrays % 1_000_000_007
    
    def prime_numbers(self, limit = 10000):
        """
        >>> Solution().prime_numbers(10)
        {2, 3, 5, 7}
        """
        primes = set(range(2, limit + 1))
        for p in range(2, math.floor(math.sqrt(limit)) + 1):
            if p in primes:
                for i in range(p * p, limit + 1, p):
                    primes.remove(i)
        return primes


    def divisors_amount(self, number: int) -> int:
        """
        >>> Solution().divisors_amount(45)
        6
        >>> Solution().divisors_amount(5)
        2
        >>> Solution().divisors_amount(12)
        6
        >>> Solution().divisors_amount(1)
        1
        """
        amount = 0
        i = 1
        square_root = math.sqrt(number)
        while i <= square_root:
            if number % i == 0:
                amount += 2
            if i * i == number:
                amount -= 1
            i += 1
        return amount

    def nck(self, n: int, k: int) -> int:
        """
        >>> Solution().nck(5, 3)
        10
        """
        return self.fact(n) // (self.fact(k) * self.fact(n - k))

    def fact(self, n: int) -> int:
        """
        >>> Solution().fact(0)
        1
        >>> Solution().fact(1)
        1
        >>> Solution().fact(2)
        2
        >>> Solution().fact(3)
        6
        >>> Solution().fact(6)
        720
        """
        acc = 1
        for i in range(1, n + 1):
            acc *= i
        return acc

