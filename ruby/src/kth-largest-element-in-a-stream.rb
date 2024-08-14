require 'algorithms'

class KthLargest
  # :type k: Integer
  # :type nums: Integer[]
  def initialize(k, nums)
    @k = k
    @heap = Containers::MinHeap.new(nums)
    @heap.pop while @heap.size > k
  end

  # :type val: Integer
  # :rtype: Integer
  def add(val)
    return @heap.min if val <= @heap.min

    @heap.push(val)
    @heap.pop while @heap.size > @k
    @heap.min
  end
end
