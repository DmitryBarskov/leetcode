# @param {Integer[]} nums
# @return {Integer}
def alternating_subarray(nums)
  longest = 0
  l = 0
  r = 1
  s = -> (i) { [nums[l], nums[l] + 1][i % 2] }
  while r < nums.size
    while r < nums.size && nums[r] == s[r - l]
      r += 1
    end
    longest = [longest, r - l].max
    break if r >= nums.size

    while l < r && (nums[r] != s[r - l] || nums[l] + 1 != nums[l + 1])
      l += 1
    end
  end
  longest < 2 ? -1 : longest
end

alternating_subarray([64,65,64,65,64,65,66,65,66,65]) => 6
