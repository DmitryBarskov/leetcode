# @param {Integer[]} nums
# @return {Integer[]}
def frequency_sort(nums)
  count = nums.tally
  nums.sort { |x, y| (count[x] <=> count[y]).nonzero? || y <=> x }
end
