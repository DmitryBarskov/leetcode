class Solution:
    """
    >>> Solution().peopleAwareOfSecret(n = 6, delay = 2, forget = 4)
    5
    >>> Solution().peopleAwareOfSecret(n = 4, delay = 1, forget = 3)
    6
    """

    def peopleAwareOfSecret(self, n: int, delay: int, forget: int) -> int:
        who_knows = [0] * n
        who_shares = [0] * n

        # first person to know
        for d in range(forget):
            who_knows[d] = 1
        for d in range(delay, forget):
            who_shares[d] = 1

        for day in range(n):
            for i in range(day, min(day + forget, n)):
                who_knows[i] += who_shares[day]
            for i in range(day + delay, min(day + forget, n)):
                who_shares[i] += who_shares[day]

        return who_knows[-1] % 1_000_000_007
