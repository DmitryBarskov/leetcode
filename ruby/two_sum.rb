# frozen_string_literal: true

# https://leetcode.com/problems/two-sum/
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  sorted_nums = nums.map.with_index { |v, i| [v, i] }.sort_by(&:first)
  two_sum_on_sorted_array(sorted_nums, target)
end

def two_sum_on_sorted_array(array, target)
  i = 0
  j = nums.length - 1

  while i < j
    case array[i].first + array[j].first <=> target
    when 0 then return [array[i].last, array[j].last]
    when 1 then j -= 1
    when -1 then i += 1
    end
  end
end
