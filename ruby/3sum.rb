# frozen_string_literal: true

# https://leetcode.com/problems/3sum
# TODO: fix TLE
# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  return [] if nums.empty?

  triplets = Set.new

  (0...nums.size).each do |i|
    met = Set.new
    (i.next...nums.size).each do |j|
      target = nums[i].+(nums[j]).-@
      triplets.add([nums[i], nums[j], target].sort) if met.include?(target)
      met.add(nums[j])
    end
  end

  triplets.to_a
end
