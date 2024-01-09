# @leetup=custom
# @leetup=info id=300 lang=ruby slug=longest-increasing-subsequence

# Given an integer array `nums`, return *the length of the longest strictly
# increasing subsequence*.
#
# Example 1:
# Input: nums = [10,9,2,5,3,7,101,18]
# Output: 4
# Explanation: The longest increasing subsequence is [2,3,7,101], therefore th
# e length is 4.
#
# Example 2:
# Input: nums = [0,1,0,3,2,3]
# Output: 4
#
# Example 3:
# Input: nums = [7,7,7,7,7,7,7]
# Output: 1
#
# Constraints:
# * `1 <= nums.length <= 2500`
# * `-104 <= nums[i] <= 104`
#
# Follow up: Can you come up with an algorithm that runs in `O(n log(n))` time
# complexity?

# @leetup=custom
# @leetup=code

# TODO:
require "byebug"
# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums, from: 0, to: nums.size, &block)
  block ||= proc { true }
  recur(nums, from: 0, to: nums.size) { true }[:size]
end

def recur(nums, from:, to:, &block)
  if from + 1 == to
    return {size: 1, min: nums[from], max: nums[from]} if block.call(nums[from])
  end
  return {size: 0, min: nil, max: nil} if from + 1 >= to

  mi = (from + to) / 2

  # excluding current item
  left_lis = recur(nums, from:, to: mi) { true }
  right_lis = recur(nums, from: mi + 1, to:) { _1 > (left_lis[:max] || -Float::INFINITY) }
  excluding_seq = {
    size: left_lis[:size] + right_lis[:size],
    min: left_lis[:min],
    max: right_lis[:max]
  }

  return excluding_seq unless block.call(nums[mi])

  # include current item
  left_lis = recur(nums, from:, to: mi) { _1 < nums[mi] }
  right_lis = recur(nums, from: mi + 1, to:) { _1 > nums[mi] }
  including_seq = {
    size: left_lis[:size] + 1 + right_lis[:size],
    min: left_lis[:min],
    max: right_lis[:max]
  }
  [including_seq, excluding_seq].max_by(&:size)
end
# @leetup=code
# @leetup=custom
length_of_lis([1]) => 1
length_of_lis([1, 2]) => 2
length_of_lis([2, 1]) => 1
length_of_lis([10, 9, 2, 5]) => 3
length_of_lis([10, 9, 2, 5, 3, 7, 101, 18]) => 4
length_of_lis([0, 1, 0, 3, 2, 3]) => 4
length_of_lis([7, 7, 7, 7, 7, 7, 7]) => 1
length_of_lis([1, 3, 6, 7, 9, 4, 10, 5, 6]) => 6
# @leetup=custom
