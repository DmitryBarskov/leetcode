class BitSet
  def initialize
    @size = 0
    @set = 0
  end

  attr_reader :size

  def add(num)
    return false if (@set & (1 << num)) != 0

    @size +=  1
    @set |= (1 << num)
    true
  end
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def min_operations(nums, k)
  set = BitSet.new
  nums.reverse_each.with_index(1) do |num, operations|
    next if num > k

    set.add(num)
    return operations if set.size >= k
  end
end
