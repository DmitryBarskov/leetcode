# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def target_indices(nums, target)
  eq, _, lt = nums.each_with_object([0, 0, 0]) { _2[_1 <=> target] += 1 }
  (lt..).take(eq).to_a
end
