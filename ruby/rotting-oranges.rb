# @leetup=custom
# @leetup=info id=994 lang=ruby slug=rotting-oranges


# You are given an `m x n` `grid` where each cell can have one of three values:
#
# * `0` representing an empty cell,
# * `1` representing a fresh orange, or
# * `2` representing a rotten orange.
#
# Every minute, any fresh orange that is 4-directionally adjacent to a rotten
# orange becomes rotten.
#
# Return *the minimum number of minutes that must elapse until no cell has a fresh
# orange*. If *this is impossible, return* `-1`.
#
#
# Example 1:
#
# https://assets.leetcode.com/uploads/2019/02/16/oranges.png
# Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
# Output: 4
#
# Example 2:
#
# Input: grid = [[2,1,1],[0,1,1],[1,0,1]]
# 2 1 1
# 0 1 1
# 1 0 1
# Output: -1
# Explanation: The orange in the bottom left corner (row 2, column 0) is never
#  rotten, because rotting only happens 4-directionally.
#
# Example 3:
#
# Input: grid = [[0,2]]
# Output: 0
# Explanation: Since there are already no fresh oranges at minute 0, the answe
# r is just 0.
#
#
# Constraints:
#
# * `m == grid.length`
# * `n == grid[i].length`
# * `1 <= m, n <= 10`
# * `grid[i][j]` is `0`, `1`, or `2`.
#

# @leetup=custom
# @leetup=code

# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)
  distance_to_rotten = Hash.new
  rotten = []
  fresh = []
  grid.size.times do |i|
    grid[i].size.times do |j|
      orange_id = i * grid[i].size + j
      case grid[i][j]
      when 1
        fresh.push(orange_id)
        distance_to_rotten[orange_id] = Float::INFINITY
      when 2
        rotten.push([i, j])
        distance_to_rotten[orange_id] = Float::INFINITY
      end
    end
  end

  rotten.each do |i, j|
    rot!(grid, distance_to_rotten, i, j, dist: 0)
  end

  return 0 if fresh.empty?
  return -1 if fresh.any? { distance_to_rotten[_1].infinite? }

  distance_to_rotten.values.max
end

def rot!(grid, distance_to_rotten, x, y, dist:)
  return if x.negative? || x >= grid.size
  return if y.negative? || y >= grid[x].size
  return if grid[x][y].zero?

  orange_id = x * grid[x].size + y
  return if distance_to_rotten[orange_id] <= dist

  distance_to_rotten[orange_id] = dist

  [
    rot!(grid, distance_to_rotten, x + 1, y, dist: dist + 1),
    rot!(grid, distance_to_rotten, x - 1, y, dist: dist + 1),
    rot!(grid, distance_to_rotten, x, y + 1, dist: dist + 1),
    rot!(grid, distance_to_rotten, x, y - 1, dist: dist + 1),
    dist,
  ].compact.max
end
# @leetup=code

oranges_rotting([[2,1,1],[1,1,0],[0,1,1]]) => 4
oranges_rotting([[2,1,1],[0,1,1],[1,0,1]]) => -1
oranges_rotting([[0,2]]) => 0
oranges_rotting([[0,2,2]]) => 0
oranges_rotting([[0]]) => 0
oranges_rotting([[1]]) => -1
