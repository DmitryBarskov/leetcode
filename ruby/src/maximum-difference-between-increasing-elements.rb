# @param {Integer[]} nums
# @return {Integer}
def maximum_difference(nums)
  min = nums[0]
  max_diff = -1
  (1...nums.length).each do |i|
    if nums[i] < min
      min = nums[i]
    elsif nums[i] > min
      max_diff = [nums[i] - min, max_diff].max
    end
  end
  max_diff
end
