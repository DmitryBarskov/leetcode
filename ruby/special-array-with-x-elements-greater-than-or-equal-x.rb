# @param {Integer[]} nums
# @return {Integer}
def special_array(nums)
  nums.sort!
  (1..nums.size).find do |x|
    nums.size - (nums.bsearch_index { |n| n >= x } || -1) == x
  end || -1
end

special_array([3, 5]) => 2
special_array([0, 0]) => -1
special_array([0, 4, 3, 0, 4]) => 3
