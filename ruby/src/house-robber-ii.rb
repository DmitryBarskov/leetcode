# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  return nums[0] if nums.size == 1

  [
    recur(nums, nums.size - 1, 0, 0, 0),
    recur(nums, nums.size    , 1, 0, 0),
  ].max
end

def recur(nums, upto, i, a, b)
  return [a, b].max if i >= upto

  recur(nums, upto, i + 1, b, [b, a + nums[i]].max)
end
