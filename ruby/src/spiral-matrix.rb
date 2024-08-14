# @param {Integer[][]} matrix
# @return {Integer[]}
def spiral_order(matrix)
  spiral = []

  top = 0
  left = 0
  bottom = matrix.size - 1
  right = matrix[0].size - 1

  while top <= bottom && left <= right
    (left..right).each { |i| spiral.append(matrix[top][i]) }
    top += 1
    (top..bottom).each { |i| spiral.append(matrix[i][right]) }
    right -= 1
    break if top > bottom || left > right
    right.downto(left) { |i| spiral.append(matrix[bottom][i]) }
    bottom -= 1
    bottom.downto(top) { |i| spiral.append(matrix[i][left]) }
    left += 1
  end

  spiral
end
