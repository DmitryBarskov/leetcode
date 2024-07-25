# @param {Integer[]} row_sum
# @param {Integer[]} col_sum
# @return {Integer[][]}
def restore_matrix(row_sum, col_sum)
  left_in_col = col_sum.dup
  row_sum.map do |left_in_row|
    Array.new(col_sum.size) do |j|
      val = [left_in_row, left_in_col[j]].min
      left_in_col[j] -= val
      left_in_row -= val
      val
    end
  end
end
