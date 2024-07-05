# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Integer}
def min_increment_for_unique(nums)
  nums.sort!
  prev = nums[0]
  increments = 0
  (1...nums.size).each do |i|
    incremented = [prev + 1, nums[i]].max
    increments += incremented - nums[i]
    prev = incremented
  end
  increments
end

min_increment_for_unique([1, 2, 2]) => 1
min_increment_for_unique([3,2,1,2,1,7]) => 6
