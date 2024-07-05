# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer}
def min_patches(nums, n)
  patches = 0
  range_end = 0
  i = 0
  while range_end < n
    if i < nums.size && nums[i] <= range_end + 1
      range_end += nums[i]
      i += 1
    else
      patches += 1
      range_end += range_end + 1
    end
  end
  patches
end
