# frozen_string_literal: true

# https://leetcode.com/problems/number-of-arithmetic-triplets/
# @param {Integer[]} nums
# @param {Integer} diff
# @return {Integer}
def arithmetic_triplets(nums, diff)
  triplets = 0
  i = 0
  j = 0
  k = 0
  while i < nums.length && j < nums.length && k < nums.length
    j = find_next_in_diff(nums, from: i, diff: diff, starting_position: j)
    break if nums.length <= j
    next i += 1 if nums[i] + diff < nums[j]

    k = find_next_in_diff(nums, from: j, diff: diff, starting_position: k)
    break if nums.length <= k
    next i += 1 if nums[j] + diff < nums[k]

    triplets += 1
    i += 1
  end
  triplets
end

def find_next_in_diff(array, from:, diff:, starting_position:)
  j = starting_position
  j += 1 while j < array.length && array[j] < array[from] + diff
  j
end
