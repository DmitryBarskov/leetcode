class Solution:
    """
    >>> Solution().fractionToDecimal(1, 2)
    '0.5'
    >>> Solution().fractionToDecimal(2, 1)
    '2'
    >>> Solution().fractionToDecimal(4, 333)
    '0.(012)'
    >>> Solution().fractionToDecimal(0, 333)
    '0'
    >>> Solution().fractionToDecimal(4, 330)
    '0.0(12)'
    >>> Solution().fractionToDecimal(1, 1)
    '1'
    >>> Solution().fractionToDecimal(1, -1)
    '-1'
    """

    def fractionToDecimal(self, numerator: int, denominator: int) -> str:
        if numerator == 0:
            return "0"
        if denominator < 0:
            return self.fractionToDecimal(-numerator, -denominator)
        if numerator < 0:
            return "-" + self.fractionToDecimal(-numerator, denominator)

        integer_part = numerator // denominator
        if numerator % denominator == 0:
            return str(integer_part)
        return f"{integer_part}.{self.fractional_part(numerator % denominator, denominator)}"

    def fractional_part(self, numerator, denominator):
        remainders = {}
        remainder = numerator
        digits = []
        while remainder != 0:
            if remainder in remainders:
                return self.compose_fractional_part(digits, period_start=remainders[remainder])
            remainders[remainder] = len(digits)
            digit, remainder = divmod(10 * remainder, denominator)
            digits.append(str(digit))
        return ''.join(digits)

    def compose_fractional_part(self, digits, period_start):
        result = []
        for i, d in enumerate(digits):
            if i == period_start:
                result.append('(')
            result.append(d)
        result.append(')')
        return ''.join(result)
