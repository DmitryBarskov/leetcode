# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
  should_nullify_first_row = false
  should_nullify_first_column = false
  matrix.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      next unless cell.zero?

      should_nullify_first_row = true if i.zero?
      should_nullify_first_column = true if j.zero?
      matrix[0][j] = 0
      matrix[i][0] = 0
    end
  end
  (1...matrix.size).each do |i|
    (1...matrix[i].size).each do |j|
      matrix[i][j] = 0 if matrix[i][0].zero? || matrix[0][j].zero?
    end
  end
  matrix[0].fill(0) if should_nullify_first_row
  matrix.each { |row| row[0] = 0 } if should_nullify_first_column
end
