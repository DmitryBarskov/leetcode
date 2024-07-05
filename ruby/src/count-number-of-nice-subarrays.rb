# frozen_string_literal: true

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def number_of_subarrays(nums, k)
  odd_numbers = 0
  s = 0
  f = 0
  nice = 0
  while f < nums.size
    while f < nums.size && odd_numbers < k
      odd_numbers += 1 if nums[f].odd?
      f += 1
    end

    after = 1
    while f < nums.size && nums[f].even?
      f += 1
      after += 1
    end

    before = 0
    while s <= f && odd_numbers >= k
      before += 1
      odd_numbers -= 1 if nums[s].odd?
      s += 1
    end

    nice += before * after
  end
  nice
end

number_of_subarrays([1,1,2,1,1], 3) => 2
number_of_subarrays([2, 4, 6], 1) => 0
number_of_subarrays([2, 4, 5], 1, true) => 3
number_of_subarrays([2,2,2,1,2,2,1,2,2,2], 2) => 16
