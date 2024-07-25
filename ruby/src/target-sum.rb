# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def find_target_sum_ways(nums, target)
  cache = Array.new(nums.size) { {} }
  recur(nums, cache, target, 0)
end

def recur(nums, cache, target, i)
  return 1 if i >= nums.size && target == 0
  return 0 if i >= nums.size

  cache[i][target] ||= begin
    recur(nums, cache, target - nums[i], i + 1) +
      recur(nums, cache, target + nums[i], i + 1)
  end
end
