# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  nums.reduce([0, 0]) { |acc, num| [acc[1], [acc[0] + num, acc[1]].max] }.max
end
