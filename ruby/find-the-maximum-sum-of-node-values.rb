# @param {Integer[]} nums
# @param {Integer} k
# @param {Integer[][]} edges
# @return {Integer}
def maximum_value_sum(nums, k, _edges)
  sum = 0
  diff = nums.map { |n| sum += n; (n ^ k) - n }
  diff.sort! { |a, b| b <=> a }
  (1...diff.size).step(2) do |i|
    break if diff[i] + diff[i - 1] <= 0
    sum += diff[i]
    sum += diff[i - 1]
  end
  sum
end


### tests
require_relative 'lib/test.rb'

Test.(:maximum_value_sum, <<~SPEC, expected: [6, 9, 42])
[1,2,1]
3
[[0,1],[0,2]]
[2,3]
7
[[0,1]]
[7,7,7,7,7,7]
3
[[0,1],[0,2],[0,3],[0,4],[0,5]]
SPEC
