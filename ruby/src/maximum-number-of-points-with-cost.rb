# @param {Integer[][]} points
# @return {Integer}
def max_points(points)
  prev_row = points[0]
  curr_row = Array.new(points[0].size)
  left = Array.new(points[0].size)
  right = Array.new(points[0].size)
  (1...points.size).each do |r|
    left[0] = prev_row[0]
    (1...prev_row.size).each do |i|
      left[i] = [prev_row[i], left[i - 1] - 1].max
    end
    right[-1] = prev_row[-1]
    (0..prev_row.size - 2).reverse_each do |i|
      right[i] = [prev_row[i], right[i + 1] - 1].max
    end
    (0...curr_row.size).each do |i|
      curr_row[i] = points[r][i] + [left[i], right[i]].max
    end
    prev_row, curr_row = curr_row, prev_row
  end
  prev_row.max
end
