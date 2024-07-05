# frozen_string_literal: true

require 'algorithms'

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_k_bit_flips(nums, k)
  q = Containers::RubyDeque.new
  flips = 0
  (0..nums.size - k).each do |i|
    q.pop_front while q.length.positive? && q.front + k <= i

    next if (q.length + nums[i]).odd?

    flips += 1
    q.push_back(i)
  end
  (nums.size - k...nums.size).each do |i|
    q.pop_front while q.length.positive? && q.front + k <= i

    next if (q.length + nums[i]).odd?

    return -1
  end
  flips
end
