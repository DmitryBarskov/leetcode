# frozen_string_literal: true

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
  count1 = nums1.tally
  count2 = nums2.tally
  count = count1.to_h { |k, v| [k, [v, count2[k] || 0].min] }
  count.each_with_object([]) do |(k, v), arr|
    v.times { arr.push(k) }
  end
end
