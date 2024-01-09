# @leetup=custom
# @leetup=info id=84 lang=ruby slug=largest-rectangle-in-histogram

# Given an array of integers `heights` representing the histogram's bar height
# where the width of each bar is `1`, return *the area of the largest rectangle in
# the histogram*.
#
# Example 1:
# Input: heights = [2,1,5,6,2,3]
# Output: 10
# Explanation: The above is a histogram where width of each bar is 1.
# The largest rectangle is shown in the red area, which has an area = 10 units.
#
# Example 2:
# Input: heights = [2,4]
# Output: 4
#
# Constraints:
# * `1 <= heights.length <= 105`
# * `0 <= heights[i] <= 104`

def ref(heights)
  largest_area = 0

  (0...heights.size).each do |i|
    min_height = heights[i]
    (i...heights.size).each do |j|
      min_height = [min_height, heights[j]].min
      area = (j - i + 1) * min_height
      largest_area = [area, largest_area].max
    end
  end

  largest_area
end

ref([2, 1, 5, 6, 2, 3]) => 10
ref([2, 4]) => 4

def test(input)
  actual = largest_rectangle_area(input)
  expected = ref(input)
  if actual != expected
    puts "Expected #{actual.inspect} to be #{expected.inspect}"
  else
    print "."
  end
end
# @leetup=custom
# @leetup=code

# TODO:
# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
end

# @leetup=code
# @leetup=custom
test [2, 1, 5, 6, 2, 3]
test [2, 5, 6]
test [2, 1, 1, 1, 1, 1]
# @leetup=custom
