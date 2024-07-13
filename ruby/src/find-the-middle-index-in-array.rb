# @param {Integer[]} nums
# @return {Integer}
def find_middle_index(nums)
  left = 0
  right = nums.sum
  nums.each_with_index do |num, index|
    right -= num

    return index if left == right

    left += num
  end
  -1
end
