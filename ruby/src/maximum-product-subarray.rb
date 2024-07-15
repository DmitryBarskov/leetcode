# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  total_max = nums[0]
  min = 1
  max = 1

  nums.each do |num|
    if num.zero?
      min = 1
      max = 1
      next
    end

    min, max = [num, num * max, num * min].minmax
    total_max = [total_max, max].max
  end

  total_max
end
