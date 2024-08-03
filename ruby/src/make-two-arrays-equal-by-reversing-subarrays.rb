# @param {Integer[]} target
# @param {Integer[]} arr
# @return {Boolean}
def can_be_equal(target, arr)
  # If we can reverse as many subarrays as needed,
  # we can implement bubble sort by reversing adjacent elements.
  # So the problem translates to "does arr have same contents as target?"
  count = Array.new(1001, 0)
  target.each do |num|
    count[num] += 1
  end
  arr.each do |num|
    count[num] -= 1
    return false if count[num].negative?
  end
  count.all?(&:zero?)
end
