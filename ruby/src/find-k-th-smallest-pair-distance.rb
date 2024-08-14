# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def smallest_distance_pair(nums, k)
  nums.sort!

  min_diff = nums.each_cons(2).map { _2 - _1 }.min
  max_diff = nums.last - nums.first
  while min_diff < max_diff
    diff = (max_diff + min_diff) / 2
    pairs_with_le_diff = 0
    left = 0
    nums.each_index do |right|
      left += 1 while left < right && nums[right] - nums[left] > diff
      pairs_with_le_diff += right - left
    end

    if pairs_with_le_diff >= k
      max_diff = diff
    else # pairs_with_le_diff < k
      min_diff = diff + 1
    end
  end
  min_diff
end
