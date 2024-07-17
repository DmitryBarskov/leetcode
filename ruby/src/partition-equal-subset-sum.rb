# @param {Integer[]} nums
# @return {Boolean}
def can_partition(nums)
  sum = nums.sum
  return false if sum.odd?

  target = sum / 2
  can_get = Array.new(target + 1, false)
  can_get[0] = true

  nums.each do |num|
    can_get = can_get.each_with_index.map do |achievable, sum|
      next true if achievable
      next false if sum - num < 0

      can_get[sum - num]
    end
  end

  can_get[target]
end
