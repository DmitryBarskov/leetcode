# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer}
def number_of_pairs(nums1, nums2, k)
  count = 0
  nums1.each do |dividend|
    next if dividend % k != 0

    nums2.each do |divisor|
      count += 1 if dividend % (divisor * k) == 0
    end
  end
  count
end
