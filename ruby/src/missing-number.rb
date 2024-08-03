# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  expected_sum = (nums.size + 1) * nums.size / 2
  expected_sum - nums.sum
end
