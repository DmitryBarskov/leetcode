# @leetup=custom
# @leetup=info id=446 lang=ruby slug=arithmetic-slices-ii-subsequence

# Given an integer array `nums`, return *the number of all the arithmetic
# subsequences of* `nums`.
#
# A sequence of numbers is called arithmetic if it consists of at least three
# elements and if the difference between any two consecutive elements is the
# same.
#
# * For example, `[1, 3, 5, 7, 9]`, `[7, 7, 7, 7]`, and `[3, -1, -5, -9]` are
#   arithmetic sequences.
# * For example, `[1, 1, 2, 5, 7]` is not an arithmetic sequence.
#
# A subsequence of an array is a sequence that can be formed by removing some
# elements (possibly none) of the array.
#
# * For example, `[2,5,10]` is a subsequence of `[1,2,1,2,4,1,5,10]`.
#
# The test cases are generated so that the answer fits in 32-bit integer.
#
# Example 1:
# Input: nums = [2,4,6,8,10]
# Output: 7
# Explanation: All arithmetic subsequence slices are:
# [2,4,6]
# [4,6,8]
# [6,8,10]
# [2,4,6,8]
# [4,6,8,10]
# [2,4,6,8,10]
# [2,6,10]
#
# Example 2:
# Input: nums = [7,7,7,7,7]
# Output: 16
# Explanation: Any subsequence of this array is arithmetic.
#
# Constraints:
# * `1 <= nums.length <= 1000`
# * `-2**31 <= nums[i] <= 2**31 - 1`

# @leetup=custom
# @leetup=code

# @param {Integer[]} nums
# @return {Integer}
def number_of_arithmetic_slices(nums)
  dp = Array.new(nums.size) { Hash.new(0) }
  count = 0
  nums.size.times do |i|
    i.times do |j|
      diff = nums[i] - nums[j]
      count += dp[j][diff]
      dp[i][diff] += dp[j][diff] + 1
    end
  end
  count
end
# @leetup=code
# @leetup=custom
number_of_arithmetic_slices([2, 4, 6]) => 1
number_of_arithmetic_slices([2, 4, 6, 8]) => 3
number_of_arithmetic_slices([2, 4, 6, 8, 10]) => 7
number_of_arithmetic_slices([7, 7, 7, 7, 7]) => 16
# @leetup=custom
