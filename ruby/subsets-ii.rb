require 'set'

# @param {Integer[]} nums
# @return {Integer[][]}
def subsets_with_dup(nums)
  counts = nums.group_by(&:itself).map { |k, v| [k, v.count] }
  (1 << counts.size).times.flat_map do |set_code|
    sets = [[]]
    counts.each_with_index do |(item, count), i|
      next if set_code[i].zero?

      sets = sets.flat_map do |s|
        count.times.map { |c| s + Array.new(c + 1) { item } }
      end
    end
    sets
  end
end

require_relative 'lib/test'
Test.(:subsets_with_dup, <<~TESTS, <<~EXPECTED) { |value| value.size }
[1,2,2]
[0]
[1,2,3,4,5,6,7,8,10,0]
[4,4,4,1,4]
TESTS
[[],[1],[1,2],[1,2,2],[2],[2,2]]
[[],[0]]
[[],[0],[0,1],[0,1,2],[0,1,2,3],[0,1,2,3,4],[0,1,2,3,4,5],[0,1,2,3,4,5,6],[0,1,2,3,4,5,6,7],[0,1,2,3,4,5,6,7,8],[0,1,2,3,4,5,6,7,8,10],[0,1,2,3,4,5,6,7,10],[0,1,2,3,4,5,6,8],[0,1,2,3,4,5,6,8,10],[0,1,2,3,4,5,6,10],[0,1,2,3,4,5,7],[0,1,2,3,4,5,7,8],[0,1,2,3,4,5,7,8,10],[0,1,2,3,4,5,7,10],[0,1,2,3,4,5,8],[0,1,2,3,4,5,8,10],[0,1,2,3,4,5,10],[0,1,2,3,4,6],[0,1,2,3,4,6,7],[0,1,2,3,4,6,7,8],[0,1,2,3,4,6,7,8,10],[0,1,2,3,4,6,7,10],[0,1,2,3,4,6,8],[0,1,2,3,4,6,8,10],[0,1,2,3,4,6,10],[0,1,2,3,4,7],[0,1,2,3,4,7,8],[0,1,2,3,4,7,8,10],[0,1,2,3,4,7,10],[0,1,2,3,4,8],[0,1,2,3,4,8,10],[0,1,2,3,4,10],[0,1,2,3,5],[0,1,2,3,5,6],[0,1,2,3,5,6,7],[0,1,2,3,5,6,7,8],[0,1,2,3,5,6,7,8,10],[0,1,2,3,5,6,7,10],[0,1,2,3,5,6,8],[0,1,2,3,5,6,8,10],[0,1,2,3,5,6,10],[0,1,2,3,5,7],[0,1,2,3,5,7,8],[0,1,2,3,5,7,8,10],[0,1,2,3,5,7,10],[0,1,2,3,5,8],[0,1,2,3,5,8,10],[0,1,2,3,5,10],[0,1,2,3,6],[0,1,2,3,6,7],[0,1,2,3,6,7,8],[0,1,2,3,6,7,8,10],[0,1,2,3,6,7,10],[0,1,2,3,6,8],[0,1,2,3,6,8,10],[0,1,2,3,6,10],[0,1,2,3,7],[0,1,2,3,7,8],[0,1,2,3,7,8,10],[0,1,2,3,7,10],[0,1,2,3,8],[0,1,2,3,8,10],[0,1,2,3,10],[0,1,2,4],[0,1,2,4,5],[0,1,2,4,5,6],[0,1,2,4,5,6,7],[0,1,2,4,5,6,7,8],[0,1,2,4,5,6,7,8,10],[0,1,2,4,5,6,7,10],[0,1,2,4,5,6,8],[0,1,2,4,5,6,8,10],[0,1,2,4,5,6,10],[0,1,2,4,5,7],[0,1,2,4,5,7,8],[0,1,2,4,5,7,8,10],[0,1,2,4,5,7,10],[0,1,2,4,5,8],[0,1,2,4,5,8,10],[0,1,2,4,5,10],[0,1,2,4,6],[0,1,2,4,6,7],[0,1,2,4,6,7,8],[0,1,2,4,6,7,8,10],[0,1,2,4,6,7,10],[0,1,2,4,6,8],[0,1,2,4,6,8,10],[0,1,2,4,6,10],[0,1,2,4,7],[0,1,2,4,7,8],[0,1,2,4,7,8,10],[0,1,2,4,7,10],[0,1,2,4,8],[0,1,2,4,8,10],[0,1,2,4,10],[0,1,2,5],[0,1,2,5,6],[0,1,2,5,6,7],[0,1,2,5,6,7,8],[0,1,2,5,6,7,8,10],[0,1,2,5,6,7,10],[0,1,2,5,6,8],[0,1,2,5,6,8,10],[0,1,2,5,6,10],[0,1,2,5,7],[0,1,2,5,7,8],[0,1,2,5,7,8,10],[0,1,2,5,7,10],[0,1,2,5,8],[0,1,2,5,8,10],[0,1,2,5,10],[0,1,2,6],[0,1,2,6,7],[0,1,2,6,7,8],[0,1,2,6,7,8,10],[0,1,2,6,7,10],[0,1,2,6,8],[0,1,2,6,8,10],[0,1,2,6,10],[0,1,2,7],[0,1,2,7,8],[0,1,2,7,8,10],[0,1,2,7,10],[0,1,2,8],[0,1,2,8,10],[0,1,2,10],[0,1,3],[0,1,3,4],[0,1,3,4,5],[0,1,3,4,5,6],[0,1,3,4,5,6,7],[0,1,3,4,5,6,7,8],[0,1,3,4,5,6,7,8,10],[0,1,3,4,5,6,7,10],[0,1,3,4,5,6,8],[0,1,3,4,5,6,8,10],[0,1,3,4,5,6,10],[0,1,3,4,5,7],[0,1,3,4,5,7,8],[0,1,3,4,5,7,8,10],[0,1,3,4,5,7,10],[0,1,3,4,5,8],[0,1,3,4,5,8,10],[0,1,3,4,5,10],[0,1,3,4,6],[0,1,3,4,6,7],[0,1,3,4,6,7,8],[0,1,3,4,6,7,8,10],[0,1,3,4,6,7,10],[0,1,3,4,6,8],[0,1,3,4,6,8,10],[0,1,3,4,6,10],[0,1,3,4,7],[0,1,3,4,7,8],[0,1,3,4,7,8,10],[0,1,3,4,7,10],[0,1,3,4,8],[0,1,3,4,8,10],[0,1,3,4,10],[0,1,3,5],[0,1,3,5,6],[0,1,3,5,6,7],[0,1,3,5,6,7,8],[0,1,3,5,6,7,8,10],[0,1,3,5,6,7,10],[0,1,3,5,6,8],[0,1,3,5,6,8,10],[0,1,3,5,6,10],[0,1,3,5,7],[0,1,3,5,7,8],[0,1,3,5,7,8,10],[0,1,3,5,7,10],[0,1,3,5,8],[0,1,3,5,8,10],[0,1,3,5,10],[0,1,3,6],[0,1,3,6,7],[0,1,3,6,7,8],[0,1,3,6,7,8,10],[0,1,3,6,7,10],[0,1,3,6,8],[0,1,3,6,8,10],[0,1,3,6,10],[0,1,3,7],[0,1,3,7,8],[0,1,3,7,8,10],[0,1,3,7,10],[0,1,3,8],[0,1,3,8,10],[0,1,3,10],[0,1,4],[0,1,4,5],[0,1,4,5,6],[0,1,4,5,6,7],[0,1,4,5,6,7,8],[0,1,4,5,6,7,8,10],[0,1,4,5,6,7,10],[0,1,4,5,6,8],[0,1,4,5,6,8,10],[0,1,4,5,6,10],[0,1,4,5,7],[0,1,4,5,7,8],[0,1,4,5,7,8,10],[0,1,4,5,7,10],[0,1,4,5,8],[0,1,4,5,8,10],[0,1,4,5,10],[0,1,4,6],[0,1,4,6,7],[0,1,4,6,7,8],[0,1,4,6,7,8,10],[0,1,4,6,7,10],[0,1,4,6,8],[0,1,4,6,8,10],[0,1,4,6,10],[0,1,4,7],[0,1,4,7,8],[0,1,4,7,8,10],[0,1,4,7,10],[0,1,4,8],[0,1,4,8,10],[0,1,4,10],[0,1,5],[0,1,5,6],[0,1,5,6,7],[0,1,5,6,7,8],[0,1,5,6,7,8,10],[0,1,5,6,7,10],[0,1,5,6,8],[0,1,5,6,8,10],[0,1,5,6,10],[0,1,5,7],[0,1,5,7,8],[0,1,5,7,8,10],[0,1,5,7,10],[0,1,5,8],[0,1,5,8,10],[0,1,5,10],[0,1,6],[0,1,6,7],[0,1,6,7,8],[0,1,6,7,8,10],[0,1,6,7,10],[0,1,6,8],[0,1,6,8,10],[0,1,6,10],[0,1,7],[0,1,7,8],[0,1,7,8,10],[0,1,7,10],[0,1,8],[0,1,8,10],[0,1,10],[0,2],[0,2,3],[0,2,3,4],[0,2,3,4,5],[0,2,3,4,5,6],[0,2,3,4,5,6,7],[0,2,3,4,5,6,7,8],[0,2,3,4,5,6,7,8,10],[0,2,3,4,5,6,7,10],[0,2,3,4,5,6,8],[0,2,3,4,5,6,8,10],[0,2,3,4,5,6,10],[0,2,3,4,5,7],[0,2,3,4,5,7,8],[0,2,3,4,5,7,8,10],[0,2,3,4,5,7,10],[0,2,3,4,5,8],[0,2,3,4,5,8,10],[0,2,3,4,5,10],[0,2,3,4,6],[0,2,3,4,6,7],[0,2,3,4,6,7,8],[0,2,3,4,6,7,8,10],[0,2,3,4,6,7,10],[0,2,3,4,6,8],[0,2,3,4,6,8,10],[0,2,3,4,6,10],[0,2,3,4,7],[0,2,3,4,7,8],[0,2,3,4,7,8,10],[0,2,3,4,7,10],[0,2,3,4,8],[0,2,3,4,8,10],[0,2,3,4,10],[0,2,3,5],[0,2,3,5,6],[0,2,3,5,6,7],[0,2,3,5,6,7,8],[0,2,3,5,6,7,8,10],[0,2,3,5,6,7,10],[0,2,3,5,6,8],[0,2,3,5,6,8,10],[0,2,3,5,6,10],[0,2,3,5,7],[0,2,3,5,7,8],[0,2,3,5,7,8,10],[0,2,3,5,7,10],[0,2,3,5,8],[0,2,3,5,8,10],[0,2,3,5,10],[0,2,3,6],[0,2,3,6,7],[0,2,3,6,7,8],[0,2,3,6,7,8,10],[0,2,3,6,7,10],[0,2,3,6,8],[0,2,3,6,8,10],[0,2,3,6,10],[0,2,3,7],[0,2,3,7,8],[0,2,3,7,8,10],[0,2,3,7,10],[0,2,3,8],[0,2,3,8,10],[0,2,3,10],[0,2,4],[0,2,4,5],[0,2,4,5,6],[0,2,4,5,6,7],[0,2,4,5,6,7,8],[0,2,4,5,6,7,8,10],[0,2,4,5,6,7,10],[0,2,4,5,6,8],[0,2,4,5,6,8,10],[0,2,4,5,6,10],[0,2,4,5,7],[0,2,4,5,7,8],[0,2,4,5,7,8,10],[0,2,4,5,7,10],[0,2,4,5,8],[0,2,4,5,8,10],[0,2,4,5,10],[0,2,4,6],[0,2,4,6,7],[0,2,4,6,7,8],[0,2,4,6,7,8,10],[0,2,4,6,7,10],[0,2,4,6,8],[0,2,4,6,8,10],[0,2,4,6,10],[0,2,4,7],[0,2,4,7,8],[0,2,4,7,8,10],[0,2,4,7,10],[0,2,4,8],[0,2,4,8,10],[0,2,4,10],[0,2,5],[0,2,5,6],[0,2,5,6,7],[0,2,5,6,7,8],[0,2,5,6,7,8,10],[0,2,5,6,7,10],[0,2,5,6,8],[0,2,5,6,8,10],[0,2,5,6,10],[0,2,5,7],[0,2,5,7,8],[0,2,5,7,8,10],[0,2,5,7,10],[0,2,5,8],[0,2,5,8,10],[0,2,5,10],[0,2,6],[0,2,6,7],[0,2,6,7,8],[0,2,6,7,8,10],[0,2,6,7,10],[0,2,6,8],[0,2,6,8,10],[0,2,6,10],[0,2,7],[0,2,7,8],[0,2,7,8,10],[0,2,7,10],[0,2,8],[0,2,8,10],[0,2,10],[0,3],[0,3,4],[0,3,4,5],[0,3,4,5,6],[0,3,4,5,6,7],[0,3,4,5,6,7,8],[0,3,4,5,6,7,8,10],[0,3,4,5,6,7,10],[0,3,4,5,6,8],[0,3,4,5,6,8,10],[0,3,4,5,6,10],[0,3,4,5,7],[0,3,4,5,7,8],[0,3,4,5,7,8,10],[0,3,4,5,7,10],[0,3,4,5,8],[0,3,4,5,8,10],[0,3,4,5,10],[0,3,4,6],[0,3,4,6,7],[0,3,4,6,7,8],[0,3,4,6,7,8,10],[0,3,4,6,7,10],[0,3,4,6,8],[0,3,4,6,8,10],[0,3,4,6,10],[0,3,4,7],[0,3,4,7,8],[0,3,4,7,8,10],[0,3,4,7,10],[0,3,4,8],[0,3,4,8,10],[0,3,4,10],[0,3,5],[0,3,5,6],[0,3,5,6,7],[0,3,5,6,7,8],[0,3,5,6,7,8,10],[0,3,5,6,7,10],[0,3,5,6,8],[0,3,5,6,8,10],[0,3,5,6,10],[0,3,5,7],[0,3,5,7,8],[0,3,5,7,8,10],[0,3,5,7,10],[0,3,5,8],[0,3,5,8,10],[0,3,5,10],[0,3,6],[0,3,6,7],[0,3,6,7,8],[0,3,6,7,8,10],[0,3,6,7,10],[0,3,6,8],[0,3,6,8,10],[0,3,6,10],[0,3,7],[0,3,7,8],[0,3,7,8,10],[0,3,7,10],[0,3,8],[0,3,8,10],[0,3,10],[0,4],[0,4,5],[0,4,5,6],[0,4,5,6,7],[0,4,5,6,7,8],[0,4,5,6,7,8,10],[0,4,5,6,7,10],[0,4,5,6,8],[0,4,5,6,8,10],[0,4,5,6,10],[0,4,5,7],[0,4,5,7,8],[0,4,5,7,8,10],[0,4,5,7,10],[0,4,5,8],[0,4,5,8,10],[0,4,5,10],[0,4,6],[0,4,6,7],[0,4,6,7,8],[0,4,6,7,8,10],[0,4,6,7,10],[0,4,6,8],[0,4,6,8,10],[0,4,6,10],[0,4,7],[0,4,7,8],[0,4,7,8,10],[0,4,7,10],[0,4,8],[0,4,8,10],[0,4,10],[0,5],[0,5,6],[0,5,6,7],[0,5,6,7,8],[0,5,6,7,8,10],[0,5,6,7,10],[0,5,6,8],[0,5,6,8,10],[0,5,6,10],[0,5,7],[0,5,7,8],[0,5,7,8,10],[0,5,7,10],[0,5,8],[0,5,8,10],[0,5,10],[0,6],[0,6,7],[0,6,7,8],[0,6,7,8,10],[0,6,7,10],[0,6,8],[0,6,8,10],[0,6,10],[0,7],[0,7,8],[0,7,8,10],[0,7,10],[0,8],[0,8,10],[0,10],[1],[1,2],[1,2,3],[1,2,3,4],[1,2,3,4,5],[1,2,3,4,5,6],[1,2,3,4,5,6,7],[1,2,3,4,5,6,7,8],[1,2,3,4,5,6,7,8,10],[1,2,3,4,5,6,7,10],[1,2,3,4,5,6,8],[1,2,3,4,5,6,8,10],[1,2,3,4,5,6,10],[1,2,3,4,5,7],[1,2,3,4,5,7,8],[1,2,3,4,5,7,8,10],[1,2,3,4,5,7,10],[1,2,3,4,5,8],[1,2,3,4,5,8,10],[1,2,3,4,5,10],[1,2,3,4,6],[1,2,3,4,6,7],[1,2,3,4,6,7,8],[1,2,3,4,6,7,8,10],[1,2,3,4,6,7,10],[1,2,3,4,6,8],[1,2,3,4,6,8,10],[1,2,3,4,6,10],[1,2,3,4,7],[1,2,3,4,7,8],[1,2,3,4,7,8,10],[1,2,3,4,7,10],[1,2,3,4,8],[1,2,3,4,8,10],[1,2,3,4,10],[1,2,3,5],[1,2,3,5,6],[1,2,3,5,6,7],[1,2,3,5,6,7,8],[1,2,3,5,6,7,8,10],[1,2,3,5,6,7,10],[1,2,3,5,6,8],[1,2,3,5,6,8,10],[1,2,3,5,6,10],[1,2,3,5,7],[1,2,3,5,7,8],[1,2,3,5,7,8,10],[1,2,3,5,7,10],[1,2,3,5,8],[1,2,3,5,8,10],[1,2,3,5,10],[1,2,3,6],[1,2,3,6,7],[1,2,3,6,7,8],[1,2,3,6,7,8,10],[1,2,3,6,7,10],[1,2,3,6,8],[1,2,3,6,8,10],[1,2,3,6,10],[1,2,3,7],[1,2,3,7,8],[1,2,3,7,8,10],[1,2,3,7,10],[1,2,3,8],[1,2,3,8,10],[1,2,3,10],[1,2,4],[1,2,4,5],[1,2,4,5,6],[1,2,4,5,6,7],[1,2,4,5,6,7,8],[1,2,4,5,6,7,8,10],[1,2,4,5,6,7,10],[1,2,4,5,6,8],[1,2,4,5,6,8,10],[1,2,4,5,6,10],[1,2,4,5,7],[1,2,4,5,7,8],[1,2,4,5,7,8,10],[1,2,4,5,7,10],[1,2,4,5,8],[1,2,4,5,8,10],[1,2,4,5,10],[1,2,4,6],[1,2,4,6,7],[1,2,4,6,7,8],[1,2,4,6,7,8,10],[1,2,4,6,7,10],[1,2,4,6,8],[1,2,4,6,8,10],[1,2,4,6,10],[1,2,4,7],[1,2,4,7,8],[1,2,4,7,8,10],[1,2,4,7,10],[1,2,4,8],[1,2,4,8,10],[1,2,4,10],[1,2,5],[1,2,5,6],[1,2,5,6,7],[1,2,5,6,7,8],[1,2,5,6,7,8,10],[1,2,5,6,7,10],[1,2,5,6,8],[1,2,5,6,8,10],[1,2,5,6,10],[1,2,5,7],[1,2,5,7,8],[1,2,5,7,8,10],[1,2,5,7,10],[1,2,5,8],[1,2,5,8,10],[1,2,5,10],[1,2,6],[1,2,6,7],[1,2,6,7,8],[1,2,6,7,8,10],[1,2,6,7,10],[1,2,6,8],[1,2,6,8,10],[1,2,6,10],[1,2,7],[1,2,7,8],[1,2,7,8,10],[1,2,7,10],[1,2,8],[1,2,8,10],[1,2,10],[1,3],[1,3,4],[1,3,4,5],[1,3,4,5,6],[1,3,4,5,6,7],[1,3,4,5,6,7,8],[1,3,4,5,6,7,8,10],[1,3,4,5,6,7,10],[1,3,4,5,6,8],[1,3,4,5,6,8,10],[1,3,4,5,6,10],[1,3,4,5,7],[1,3,4,5,7,8],[1,3,4,5,7,8,10],[1,3,4,5,7,10],[1,3,4,5,8],[1,3,4,5,8,10],[1,3,4,5,10],[1,3,4,6],[1,3,4,6,7],[1,3,4,6,7,8],[1,3,4,6,7,8,10],[1,3,4,6,7,10],[1,3,4,6,8],[1,3,4,6,8,10],[1,3,4,6,10],[1,3,4,7],[1,3,4,7,8],[1,3,4,7,8,10],[1,3,4,7,10],[1,3,4,8],[1,3,4,8,10],[1,3,4,10],[1,3,5],[1,3,5,6],[1,3,5,6,7],[1,3,5,6,7,8],[1,3,5,6,7,8,10],[1,3,5,6,7,10],[1,3,5,6,8],[1,3,5,6,8,10],[1,3,5,6,10],[1,3,5,7],[1,3,5,7,8],[1,3,5,7,8,10],[1,3,5,7,10],[1,3,5,8],[1,3,5,8,10],[1,3,5,10],[1,3,6],[1,3,6,7],[1,3,6,7,8],[1,3,6,7,8,10],[1,3,6,7,10],[1,3,6,8],[1,3,6,8,10],[1,3,6,10],[1,3,7],[1,3,7,8],[1,3,7,8,10],[1,3,7,10],[1,3,8],[1,3,8,10],[1,3,10],[1,4],[1,4,5],[1,4,5,6],[1,4,5,6,7],[1,4,5,6,7,8],[1,4,5,6,7,8,10],[1,4,5,6,7,10],[1,4,5,6,8],[1,4,5,6,8,10],[1,4,5,6,10],[1,4,5,7],[1,4,5,7,8],[1,4,5,7,8,10],[1,4,5,7,10],[1,4,5,8],[1,4,5,8,10],[1,4,5,10],[1,4,6],[1,4,6,7],[1,4,6,7,8],[1,4,6,7,8,10],[1,4,6,7,10],[1,4,6,8],[1,4,6,8,10],[1,4,6,10],[1,4,7],[1,4,7,8],[1,4,7,8,10],[1,4,7,10],[1,4,8],[1,4,8,10],[1,4,10],[1,5],[1,5,6],[1,5,6,7],[1,5,6,7,8],[1,5,6,7,8,10],[1,5,6,7,10],[1,5,6,8],[1,5,6,8,10],[1,5,6,10],[1,5,7],[1,5,7,8],[1,5,7,8,10],[1,5,7,10],[1,5,8],[1,5,8,10],[1,5,10],[1,6],[1,6,7],[1,6,7,8],[1,6,7,8,10],[1,6,7,10],[1,6,8],[1,6,8,10],[1,6,10],[1,7],[1,7,8],[1,7,8,10],[1,7,10],[1,8],[1,8,10],[1,10],[2],[2,3],[2,3,4],[2,3,4,5],[2,3,4,5,6],[2,3,4,5,6,7],[2,3,4,5,6,7,8],[2,3,4,5,6,7,8,10],[2,3,4,5,6,7,10],[2,3,4,5,6,8],[2,3,4,5,6,8,10],[2,3,4,5,6,10],[2,3,4,5,7],[2,3,4,5,7,8],[2,3,4,5,7,8,10],[2,3,4,5,7,10],[2,3,4,5,8],[2,3,4,5,8,10],[2,3,4,5,10],[2,3,4,6],[2,3,4,6,7],[2,3,4,6,7,8],[2,3,4,6,7,8,10],[2,3,4,6,7,10],[2,3,4,6,8],[2,3,4,6,8,10],[2,3,4,6,10],[2,3,4,7],[2,3,4,7,8],[2,3,4,7,8,10],[2,3,4,7,10],[2,3,4,8],[2,3,4,8,10],[2,3,4,10],[2,3,5],[2,3,5,6],[2,3,5,6,7],[2,3,5,6,7,8],[2,3,5,6,7,8,10],[2,3,5,6,7,10],[2,3,5,6,8],[2,3,5,6,8,10],[2,3,5,6,10],[2,3,5,7],[2,3,5,7,8],[2,3,5,7,8,10],[2,3,5,7,10],[2,3,5,8],[2,3,5,8,10],[2,3,5,10],[2,3,6],[2,3,6,7],[2,3,6,7,8],[2,3,6,7,8,10],[2,3,6,7,10],[2,3,6,8],[2,3,6,8,10],[2,3,6,10],[2,3,7],[2,3,7,8],[2,3,7,8,10],[2,3,7,10],[2,3,8],[2,3,8,10],[2,3,10],[2,4],[2,4,5],[2,4,5,6],[2,4,5,6,7],[2,4,5,6,7,8],[2,4,5,6,7,8,10],[2,4,5,6,7,10],[2,4,5,6,8],[2,4,5,6,8,10],[2,4,5,6,10],[2,4,5,7],[2,4,5,7,8],[2,4,5,7,8,10],[2,4,5,7,10],[2,4,5,8],[2,4,5,8,10],[2,4,5,10],[2,4,6],[2,4,6,7],[2,4,6,7,8],[2,4,6,7,8,10],[2,4,6,7,10],[2,4,6,8],[2,4,6,8,10],[2,4,6,10],[2,4,7],[2,4,7,8],[2,4,7,8,10],[2,4,7,10],[2,4,8],[2,4,8,10],[2,4,10],[2,5],[2,5,6],[2,5,6,7],[2,5,6,7,8],[2,5,6,7,8,10],[2,5,6,7,10],[2,5,6,8],[2,5,6,8,10],[2,5,6,10],[2,5,7],[2,5,7,8],[2,5,7,8,10],[2,5,7,10],[2,5,8],[2,5,8,10],[2,5,10],[2,6],[2,6,7],[2,6,7,8],[2,6,7,8,10],[2,6,7,10],[2,6,8],[2,6,8,10],[2,6,10],[2,7],[2,7,8],[2,7,8,10],[2,7,10],[2,8],[2,8,10],[2,10],[3],[3,4],[3,4,5],[3,4,5,6],[3,4,5,6,7],[3,4,5,6,7,8],[3,4,5,6,7,8,10],[3,4,5,6,7,10],[3,4,5,6,8],[3,4,5,6,8,10],[3,4,5,6,10],[3,4,5,7],[3,4,5,7,8],[3,4,5,7,8,10],[3,4,5,7,10],[3,4,5,8],[3,4,5,8,10],[3,4,5,10],[3,4,6],[3,4,6,7],[3,4,6,7,8],[3,4,6,7,8,10],[3,4,6,7,10],[3,4,6,8],[3,4,6,8,10],[3,4,6,10],[3,4,7],[3,4,7,8],[3,4,7,8,10],[3,4,7,10],[3,4,8],[3,4,8,10],[3,4,10],[3,5],[3,5,6],[3,5,6,7],[3,5,6,7,8],[3,5,6,7,8,10],[3,5,6,7,10],[3,5,6,8],[3,5,6,8,10],[3,5,6,10],[3,5,7],[3,5,7,8],[3,5,7,8,10],[3,5,7,10],[3,5,8],[3,5,8,10],[3,5,10],[3,6],[3,6,7],[3,6,7,8],[3,6,7,8,10],[3,6,7,10],[3,6,8],[3,6,8,10],[3,6,10],[3,7],[3,7,8],[3,7,8,10],[3,7,10],[3,8],[3,8,10],[3,10],[4],[4,5],[4,5,6],[4,5,6,7],[4,5,6,7,8],[4,5,6,7,8,10],[4,5,6,7,10],[4,5,6,8],[4,5,6,8,10],[4,5,6,10],[4,5,7],[4,5,7,8],[4,5,7,8,10],[4,5,7,10],[4,5,8],[4,5,8,10],[4,5,10],[4,6],[4,6,7],[4,6,7,8],[4,6,7,8,10],[4,6,7,10],[4,6,8],[4,6,8,10],[4,6,10],[4,7],[4,7,8],[4,7,8,10],[4,7,10],[4,8],[4,8,10],[4,10],[5],[5,6],[5,6,7],[5,6,7,8],[5,6,7,8,10],[5,6,7,10],[5,6,8],[5,6,8,10],[5,6,10],[5,7],[5,7,8],[5,7,8,10],[5,7,10],[5,8],[5,8,10],[5,10],[6],[6,7],[6,7,8],[6,7,8,10],[6,7,10],[6,8],[6,8,10],[6,10],[7],[7,8],[7,8,10],[7,10],[8],[8,10],[10]]
[[],[1],[1,4],[1,4,4],[1,4,4,4],[1,4,4,4,4],[4],[4,4],[4,4,4],[4,4,4,4]]
EXPECTED
