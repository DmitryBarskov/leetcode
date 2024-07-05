# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  r = nums.index { _1 != 0 } || nums.size
  w = r
  b = nums.rindex { _1 != 2 } || -1
  while w <= b
    case nums[w]
    when 0
      nums[r], nums[w] = nums[w], nums[r]
      r += 1
      w = r if r > w
    when 1
      w += 1
    when 2
      nums[w], nums[b] = nums[b], nums[w]
      b -= 1
    end
  end
end

array = [2,0,2,1,1,0]
sort_colors(array)
array => [0,0,1,1,2,2]

array = [2, 0, 1]
sort_colors(array)
array => [0, 1, 2]

array = [1, 2, 0]
sort_colors(array)
array => [0, 1, 2]
