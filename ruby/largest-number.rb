# frozen_string_literal: true

# https://leetcode.com/problems/largest-number/description/

def largest_digits(s1, s2)
  (0...[s1.size, s2.size].min).each do |i|
    return -1 if s1[i] < s2[i]
    return 1 if s1[i] > s2[i]
  end

  return 0 if s1.size == s2.size

  if s1.size > s2.size
    largest_digits(s1[s2.size..], s2)
  else
    largest_digits(s1, s2[s1.size..])
  end
end

# @param {Integer[]} nums
# @return {String}
def largest_number(nums)
  nums.map(&:to_s).sort { -largest_digits(_1, _2) }.join[/(0|[1-9]\d*)$/]
end
