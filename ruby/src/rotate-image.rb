# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def rotate(matrix)
  (0...matrix.size / 2).each do |i|
    (i...matrix.size - i - 1).each do |j|
      matrix[i][j], matrix[j][-1-i], matrix[-1-i][-1-j], matrix[-1-j][i] =
        matrix[-1-j][i], matrix[i][j], matrix[j][-1-i], matrix[-1-i][-1-j]
    end
  end
end
