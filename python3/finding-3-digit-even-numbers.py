from typing import List

class Solution:
    def findEvenNumbers(self, digits: List[int]) -> List[int]:
        even_numbers = []
        digit_count = {d: 0 for d in range(0, 10)}
        for digit in digits:
            digit_count[digit] += 1
        for first in range(1, 10):
            if digit_count[first] <= 0:
                continue
            digit_count[first] -= 1
            for second in range(0, 10):
                if digit_count[second] <= 0:
                    continue
                digit_count[second] -= 1
                for third in range(0, 10, 2):
                    if digit_count[third] <= 0:
                        continue
                    even_numbers.append(100 * first + 10 * second + third)
                digit_count[second] += 1
            digit_count[first] += 1
        return even_numbers
