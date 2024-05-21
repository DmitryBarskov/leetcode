# @param {Integer[]} nums
# @return {Integer}
def subset_xor_sum(nums)
  subsets(nums).sum { |subset| subset.reduce(0, :^) }
end

def subsets(arr)
  (1 << arr.size).times.map do |subset|
    (0...arr.size)
      .filter { |i| subset[i].nonzero? }
      .map { |i| arr[i] }
  end
end

require_relative 'lib/test'
Test.(:subset_xor_sum, <<~TESTS, <<~EXPECTED)
[1,3]
[5,1,6]
[3,4,5,6,7,8]
TESTS
6
28
480
EXPECTED
