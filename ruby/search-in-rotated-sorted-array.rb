# @leetup=custom
# @leetup=info id=33 lang=ruby slug=search-in-rotated-sorted-array


# There is an integer array `nums` sorted in ascending order (with distinct
# values).
# 
# Prior to being passed to your function, `nums` is possibly rotated at an
# unknown pivot index `k` (`1 <= k < nums.length`) such that the resulting array
# is `[nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]`
# (0-indexed). For example, `[0,1,2,4,5,6,7]` might be rotated at pivot index
# `3` and become `[4,5,6,7,0,1,2]`.
# 
# Given the array `nums` after the possible rotation and an integer `target`,
# return *the index of *`target`* if it is in *`nums`*, or *`-1`* if it is not in
# *`nums`.
# 
# You must write an algorithm with `O(log n)` runtime complexity.
# 
# 
# Example 1:
# 
# Input: nums = [4,5,6,7,0,1,2], target = 0
# Output: 4
# 
# Example 2:
# 
# Input: nums = [4,5,6,7,0,1,2], target = 3
# Output: -1
# 
# Example 3:
# 
# Input: nums = [1], target = 0
# Output: -1
# 
# 
# Constraints:
# 
# * `1 <= nums.length <= 5000`
# * `-104 <= nums[i] <= 104`
# * All values of `nums` are unique.
# * `nums` is an ascending array that is possibly rotated.
# * `-104 <= target <= 104`
# 

# @leetup=custom
# @leetup=code

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  rotation = b_search(nums) { |item| item <= nums.last }

  target_idx = if rotation >= nums.size || rotation <= 0
    b_search(nums) { |item| item >= target }
  elsif nums[rotation] <= target && target <= nums.last
    b_search(nums, from: rotation) { |item| item >= target }
  elsif nums.first <= target && target <= nums[rotation - 1]
    b_search(nums, to: rotation) { |item| item >= target }
  else
    return -1
  end

  nums[target_idx] == target ? target_idx : -1
end

# Finds first index of item which predicate is true
# [false, false, true, true, true]
#                ^ returns index 2
# @param {T[]} array
# @param {T -> bool} predicate - must be monotonous on the array
def b_search(arr, from: 0, to: arr.size, &predicate)
  lo = from
  hi = to
  
  while lo < hi
    mi = (lo + hi) / 2

    if predicate.call(arr[mi])
      hi = mi
    else
      lo = mi + 1
    end
  end

  lo
end
# @leetup=code

search([4,5,6,7,0,1,2], 0) => 4
search([4,5,6,7,0,1,2], 3) => -1
search([1], 0) => -1
search([1], 1) => 0
search([3, 1], 1) => 1
search([3, 1], 3) => 0
