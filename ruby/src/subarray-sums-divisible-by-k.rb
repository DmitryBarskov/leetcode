# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def subarrays_div_by_k(nums, k)
  h = Hash.new(0)
  h[0] = 1
  prev_mod = 0
  total = 0
  nums.each do |num|
    prev_mod = (prev_mod + num) % k
    total += h[prev_mod] if h[prev_mod]
    h[prev_mod] += 1
  end
  total
end

subarrays_div_by_k([4,5,0,-2,-3,1], 5) => 7
# array: 4 5 0 -2 -3 1
# sum: 0 4 9 9  7  4 5
# % 5: 0 4 4 4  2  4 0
#
subarrays_div_by_k([5], 9) => 0
