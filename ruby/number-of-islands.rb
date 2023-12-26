# @leetup=custom
# @leetup=info id=200 lang=ruby slug=number-of-islands

# Given an `m x n` 2D binary grid `grid` which represents a map of `'1'`s (land)
# and `'0'`s (water), return *the number of islands*.
#
# An island is surrounded by water and is formed by connecting adjacent lands
# horizontally or vertically. You may assume all four edges of the grid are all
# surrounded by water.
#
#
# Example 1:
#
# Input: grid = [
#   ["1","1","1","1","0"],
#   ["1","1","0","1","0"],
#   ["1","1","0","0","0"],
#   ["0","0","0","0","0"]
# ]
# Output: 1
#
# Example 2:
#
# Input: grid = [
#   ["1","1","0","0","0"],
#   ["1","1","0","0","0"],
#   ["0","0","1","0","0"],
#   ["0","0","0","1","1"]
# ]
# Output: 3
#
#
# Constraints:
#
# * `m == grid.length`
# * `n == grid[i].length`
# * `1 <= m, n <= 300`
# * `grid[i][j]` is `'0'` or `'1'`.
#

# @leetup=custom
# @leetup=code

# @param {Character[][]} grid
# @return {Integer}
def num_islands(grid)
  visited = Array.new(grid.size) { |i| Array.new(grid[i].size) { false } }

  no_islands = 0

  grid.size.times do |i|
    grid[i].size.times do |j|
      next if visited[i][j]

      if grid[i][j] == "1"
        no_islands += 1
        find_island_recursively!(grid, visited, i:, j:)
      else
        visited[i][j] = true
      end
    end
  end
  no_islands
end

def find_island_recursively!(grid, visited, i:, j:)
  return if i.negative? || i >= grid.size
  return if j.negative? || j >= grid[i].size
  return if visited[i][j]

  visited[i][j] = true

  return if grid[i][j] == "0"

  find_island_recursively!(grid, visited, i: i + 1, j:)
  find_island_recursively!(grid, visited, i: i - 1, j:)
  find_island_recursively!(grid, visited, i:, j: j + 1)
  find_island_recursively!(grid, visited, i:, j: j - 1)
end
# @leetup=code

num_islands([
  ["1", "1", "1", "1", "0"],
  ["1", "1", "0", "1", "0"],
  ["1", "1", "0", "0", "0"],
  ["0", "0", "0", "0", "0"]
]) => 1

num_islands([
  ["1", "1", "0", "0", "0"],
  ["1", "1", "0", "0", "0"],
  ["0", "0", "1", "0", "0"],
  ["0", "0", "0", "1", "1"]
]) => 3
