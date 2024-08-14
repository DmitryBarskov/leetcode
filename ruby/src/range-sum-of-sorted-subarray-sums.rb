# @param {Integer[]} nums
# @param {Integer} n
# @param {Integer} left
# @param {Integer} right
# @return {Integer}
def range_sum(nums, n, left, right)
  sums = []
  (0...nums.size).each do |l|
    sum = 0
    (l...nums.size).each do |r|
      sum += nums[r]
      sums.append(sum)
    end
  end
  sums.sort!
  sums[left - 1..right - 1].sum % (10**9 + 7)
end
