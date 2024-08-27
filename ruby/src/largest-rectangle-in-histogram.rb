# @param {Integer[]} heights
# @return {Integer}
def largest_rectangle_area(heights)
  stack = [[-1, 0]]
  max_area = 0
  (0..heights.size).each do |i|
    start = i
    while heights.fetch(i, 0) < stack.last[1]
      start, height = stack.pop
      area = height * (i - start)
      max_area = area if area > max_area
    end
    stack.push([start, heights[i]])
  end
  max_area
end
