# @param {Integer[]} nums
# @return {Integer}
def min_swaps(nums)
  ones = nums.count(1)
  max_ones_in_window = 0
  ones_in_window = 0

  l = 0
  nums.cycle(2).each_with_index do |val, r|
    ones_in_window += 1 if val == 1

    if r - l >= ones
      ones_in_window -= nums[l % nums.size]
      l += 1
    end
    max_ones_in_window = [ones_in_window, max_ones_in_window].max
  end
  ones - max_ones_in_window
end
