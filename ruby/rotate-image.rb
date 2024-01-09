# @leetup=custom
# @leetup=info id=48 lang=ruby slug=rotate-image

# You are given an `n x n` 2D `matrix` representing an image, rotate the image by
# 90 degrees (clockwise).
#
# You have to rotate the image [in-place][1], which means you have to modify
# the input 2D matrix directly. DO NOT allocate another 2D matrix and do the
# rotation.
#
# Example 1:
# Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
# Output: [[7,4,1],[8,5,2],[9,6,3]]
#
# Example 2:
# Input: matrix = [[5,1,9,11],[2,4,8,10],[13,3,6,7],[15,14,12,16]]
# Output: [[15,13,2,5],[14,3,4,1],[12,6,8,9],[16,7,10,11]]
#
# Constraints:
# * `n == matrix.length == matrix[i].length`
# * `1 <= n <= 20`
# * `-1000 <= matrix[i][j] <= 1000`
#
# [1]: https://en.wikipedia.org/wiki/In-place_algorithm

# @leetup=custom
# @leetup=code

# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix( in-place instead.
def rotate(matrix)
  (0...matrix.size / 2).each { |i| rotate_square!(matrix, i) }
end

def rotate_square!(m, i)
  (0...(m.size - 2 * i - 1)).each do |j|
    top = [i, i + j]
    right = [i + j, m.size - 1 - i]
    bottom = [m.size - 1 - i, m.size - 1 - i - j]
    left = [m.length - 1 - i - j, i]

    m[top[0]][top[1]], m[right[0]][right[1]], m[bottom[0]][bottom[1]], m[left[0]][left[1]] = [
      m.dig(*left),
      m.dig(*top),
      m.dig(*right),
      m.dig(*bottom)
    ]
  end
end
# @leetup=code
# @leetup=custom
matrix = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
rotate(matrix)
matrix => [[15, 13, 2, 5], [14, 3, 4, 1], [12, 6, 8, 9], [16, 7, 10, 11]]
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
rotate(matrix)
matrix => [[7, 4, 1], [8, 5, 2], [9, 6, 3]]
# @leetup=custom
