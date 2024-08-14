# @param {String[]} grid
# @return {Integer}
def regions_by_slashes(grid)
  scaled = ->(y, x) {
    case grid[y / 3][x / 3]
    when "/" then (y % 3) + (x % 3) == 2 ? 1 : 0
    when "\\" then (y % 3) - (x % 3) == 0 ? 1 : 0
    when " " then 0
    end
  }
  regions = 0
  visited = Array.new(grid.size * 3) { Array.new(grid[_1 / 3].size * 3, false) }
  count_regions = ->(i, j) {
    return if i < 0 || i >= grid.size * 3
    return if j < 0 || j >= grid[i / 3].size * 3
    return if scaled[i, j] == 1
    return if visited[i][j]

    visited[i][j] = true
    count_regions[i - 1, j]
    count_regions[i + 1, j]
    count_regions[i, j - 1]
    count_regions[i, j + 1]
  }
  (0...grid.size * 3).each do |i|
    (0...grid[i / 3].size * 3).each do |j|
      if scaled[i, j] == 0 && !visited[i][j]
        regions += 1
        count_regions[i, j]
      end
    end
  end
  regions
end
