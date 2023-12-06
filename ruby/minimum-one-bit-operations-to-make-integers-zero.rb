# @leetup=custom
# @leetup=info id=1611 lang=ruby slug=minimum-one-bit-operations-to-make-integers-zero

# Given an integer `n`, you must transform it into `0` using the following
# operations any number of times:
#
# * Change the rightmost (`0th`) bit in the binary representation of `n`.
# * Change the `ith` bit in the binary representation of `n` if the `(i-1)th` bit
#   is set to `1` and the `(i-2)th` through `0th` bits are set to `0`.
#
# Return *the minimum number of operations to transform *`n`* into *`0`*.*
#
#
# Example 1:
#
# Input: n = 3
# Output: 2
# Explanation: The binary representation of 3 is "11".
# "11" -> "01" with the 2nd operation since the 0th bit is 1.
# "01" -> "00" with the 1st operation.
#
# Example 2:
#
# Input: n = 6
# Output: 4
# Explanation: The binary representation of 6 is "110".
# "110" -> "010" with the 2nd operation since the 1st bit is 1 and 0th through 0th
#  bits are 0.
# "010" -> "011" with the 1st operation.
# "011" -> "001" with the 2nd operation since the 0th bit is 1.
# "001" -> "000" with the 1st operation.
#
#
# Constraints:
#
# * `0 <= n <= 109`
#
# @leetup=custom
# @leetup=code
def minimum_one_bit_operations(n)
  return 0 if n.zero?
  return 2 * n - 1 if (n & (n - 1)).zero?

  smaller_power_of_two = n & (1 << n.bit_length.pred)
  minimum_one_bit_operations(smaller_power_of_two) - minimum_one_bit_operations(n - smaller_power_of_two)
end
# @leetup=code
# @leetup=custom
[
  1, 2, 3, 4, 5, 6, 7,  8,  9, 10, 11, 12, 13, 14, 15, 16
].map { minimum_one_bit_operations(_1) } => [
  1, 3, 2, 7, 6, 4, 5, 15, 14, 12, 13,  8,  9, 11, 10, 31
]
# @leetup=custom
