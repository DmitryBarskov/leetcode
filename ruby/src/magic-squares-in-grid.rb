# @param {Integer[][]} grid
# @return {Integer}
def num_magic_squares_inside(grid)
  count = 0
  (1..grid.size - 2).each do |i|
    (1..grid[i].size - 2).each do |j|
      count += 1 if magic?(grid, i, j)
    end
  end
  count
end

def magic?(grid, cr, cc)
  presence = Array.new(9, false)
  col_sum = [0, 0, 0]
  (cr - 1..cr + 1).each do |i|
    row_sum = 0
    (cc - 1..cc + 1).each do |j|
      return false unless grid[i][j].between?(1, 9)
      return false if presence[grid[i][j] - 1]

      presence[grid[i][j] - 1] = true
      row_sum += grid[i][j]
      col_sum[j - cc + 1] += grid[i][j]
    end
    return false if row_sum != 15
  end
  return false if col_sum[0] != 15 || col_sum[1] != 15

  grid[cr - 1][cc - 1] + grid[cr + 1][cc + 1] == grid[cr + 1][cc - 1] + grid[cr - 1][cc + 1]
end
