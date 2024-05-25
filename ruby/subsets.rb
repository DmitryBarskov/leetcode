# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  nums.sort!

  recur = lambda do |i = 0, subset = [], result = []|
    return result.push(subset.dup) if i >= nums.size

    recur.(i + 1, subset, result)

    subset.push(nums[i])
    recur.(i + 1, subset, result)
    subset.pop

    result
  end
  recur.()
end

require_relative 'lib/test'
Test.(:subsets, <<~INPUTS, <<~EXPECTED, &:sort)
[1,2,3]
[0]
INPUTS
[[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
[[],[0]]
EXPECTED
