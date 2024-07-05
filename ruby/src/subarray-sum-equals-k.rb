# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarray_sum(nums, k)
  h = Hash.new(0)
  h[0] = 1
  sum = 0
  total = 0
  nums.each do |num|
    sum += num
    total += h[sum - k]
    h[sum] += 1
  end
  total
end

# [2,3,6,5,4,1,10] k = 5
# => 3
# prefix sum: [0, 2, 5, 11, 16, 20, 21, 31]
