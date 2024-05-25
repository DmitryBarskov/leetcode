# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def beautiful_subsets(nums, k)
  recur(0, Hash.new(0), nums, k) - 1
end

def recur(i, count, nums, k)
  return 1 if i >= nums.size

  result = recur(i + 1, count, nums, k)
  if count[nums[i] + k] <= 0 && count[nums[i] - k] <= 0
    count[nums[i]] += 1
    result += recur(i + 1, count, nums, k)
    count[nums[i]] -= 1
  end
  result
end


beautiful_subsets([18, 12, 10, 5, 6, 2, 18, 3], 8) => 143
beautiful_subsets([2,4,6], 2) => 4
beautiful_subsets([1], 1) => 1
beautiful_subsets([10,4,5,7,2,1], 3) => 23
