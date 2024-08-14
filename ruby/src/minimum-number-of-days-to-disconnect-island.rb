# @param {Integer[][]} grid
# @return {Integer}
def min_days(grid)
  visited = Array.new(grid.size) { Array.new(grid[_1].size, false) }
  islands = 0
  cells = 0
  can_disconnect_in_one = false
  grid.each_index do |i|
    grid[i].each_index do |j|
      next if grid[i][j].zero?
      next if visited[i][j]

      islands += 1

      dfs(grid, i, j, visited:) do |i, j, value|
        can_disconnect_in_one ||= can_disconnect?(grid, i, j)

        cells += 1
      end
    end
  end

  return 0 if islands != 1
  return 1 if cells == 1 || cells == 3
  return 1 if can_disconnect_in_one
  2
end

def dfs(grid, i, j, visited:, &block)
  return if i < 0 || i >= grid.size
  return if j < 0 || j >= grid[i].size
  return if grid[i][j].zero?
  return if visited[i][j]

  block.call(i, j, grid[i][j])
  visited[i][j] = true

  [[i - 1, j], [i + 1, j], [i, j - 1], [i, j + 1]].each do |y, x|
    dfs(grid, y, x, visited:, &block)
  end
end

def can_disconnect?(grid, y, x)
  f = ->(i, j) {
    return 0 if i < 0 || i >= grid.size
    return 0 if j < 0 || j >= grid[i].size
    grid[i][j]
  }
  grid[y][x] = 0
  visited = Array.new(grid.size) { Array.new(grid[_1].size, false) }
  reachable = [[y - 1, x], [y + 1, x], [y, x - 1], [y, x + 1]]
    .select { |i, j| f[i, j] == 1 }
    .to_h { |i, j| [[i, j], false] }

  return true if reachable.none?

  dfs(grid, *reachable.keys.first, visited:) do |i, j|
    if reachable.key?([i, j])
      reachable[[i, j]] = true
    end
  end
  grid[y][x] = 1
  reachable.any? { !_2 }
end
