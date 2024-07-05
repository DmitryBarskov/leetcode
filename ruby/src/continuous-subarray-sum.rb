# frozen_string_literal: true

require 'byebug'
# Returns true if any sub-array meets the conditions:
# its length is at least two, and
# the sum of the elements of the subarray is a multiple of k.
# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def check_subarray_sum(nums, k, debug = false)
  mod_index = { 0 => -1 }
  last_mod = 0
  nums.each_with_index do |num, i|
    last_mod = (last_mod + num) % k
    byebug if debug
    return true if mod_index[last_mod] && i - mod_index[last_mod] >= 2

    mod_index[last_mod] ||= i
  end
  false
end

check_subarray_sum([23,2,4,6,7], 6) => true
# array:   23,  2,  4,  6,  7
# pref: 0, 23, 25, 29, 35, 42
# % 6:  0,  5,  1,  5,  5,  0
# mod_index: { 0: 0, 1: 1, 5: 0, }
# all the subarrays: [2, 4], [2, 4, 6], [6], [23, 2, 4, 6, 7]
check_subarray_sum([23,2,6,4,7], 6) => true
check_subarray_sum([23,2,6,4,7], 13) => false

check_subarray_sum([23,2,4,6,6], 7) => true
# sum: 0, 23, 25, 29, 35, 41
# % 7: 0,  2,  4,  1,  0,  6
check_subarray_sum([5,0,0,0], 3) => true
check_subarray_sum([23,2,4,6,6], 7) => true
check_subarray_sum([50_000_000,50_000_000], 100_000_000) => true
check_subarray_sum(
  [422,224,184,178,189,290,196,236,281,464,351,193,49,76,0,298,193,176,158,514,312,143,475,322,206,67,524,424,76,99,473,
   256,364,292,141,186,190,69,433,205,93,72,476,393,512,468,160,201,226,394,47,140,389,51,142,135,349,244,16,356,440,188,16,133,58,394,7,517,56,480,400,146,169,439,102,374,370,242,4,264,120,218,196,173,215,411,501,321,319,147,369,458,319,174,379,46,129,353,330,101], 479
) => true
check_subarray_sum([6], 6) => false
check_subarray_sum([6, 6], 6) => true
check_subarray_sum([23, 6], 6) => false
# sum: 0, 23, 29
# % 6: 0,  5,  5
check_subarray_sum([23, 6, 9], 6) => false
check_subarray_sum([1, 2, 3], 6) => true
check_subarray_sum([1, 2, 3], 5) => true
check_subarray_sum([23, 12, 9], 6) => false
