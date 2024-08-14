# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
  fetch = ->(coords) {
    y, x = coords
    return 0 if y < 0 || y >= grid.size || x < 0 || x >= grid[y].size
    grid[y][x]
  }
  perimeter = 0
  grid.each_index do |i|
    grid[i].each_index do |j|
      next if fetch[[i, j]].zero?

      perimeter +=
        4 - [[i - 1, j], [i, j + 1], [i + 1, j], [i, j - 1]].sum(&fetch)
    end
  end
  perimeter
end
