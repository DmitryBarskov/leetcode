def make_beautiful_numbers():
    def recur(digits_left: dict):
        if all(map(lambda x: x == 0, digits_left.values())):
            yield ''
            return
        for digit in digits_left.keys():
            if digits_left[digit] <= 0:
                continue
            digits_left[digit] -= 1
            for number in recur(digits_left):
                yield int(str(digit) + str(number))
            digits_left[digit] += 1
    combinations = [
        [1],
        [2],
        [1, 2], [3],
        [1, 3], [4],
        [1, 4], [2, 3], [5],
        [1, 2, 3], [1, 5], [2, 4], [6],
        [1, 2, 4], [1, 6], [7],
    ]
    for digits in combinations:
        yield from recur({d: d for d in digits})

BEAUTIFUL_NUMBERS = sorted(make_beautiful_numbers())

class Solution:
    """
    >>> Solution().nextBeautifulNumber(1)
    22
    >>> Solution().nextBeautifulNumber(1000)
    1333
    >>> Solution().nextBeautifulNumber(16407)
    22333
    """
    def nextBeautifulNumber(self, n: int) -> int:
        index = Solution.binary_search(
            0,
            len(BEAUTIFUL_NUMBERS),
            lambda i: BEAUTIFUL_NUMBERS[i] > n
        )
        return BEAUTIFUL_NUMBERS[index]

    def binary_search(start, end, predicate):
        lo = start
        hi = end
        while lo < hi:
            mi = (lo + hi) // 2
            if predicate(mi):
                hi = mi
            else:
                lo = mi + 1
        return lo
