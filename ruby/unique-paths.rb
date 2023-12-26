# @leetup=custom
# @leetup=info id=62 lang=ruby slug=unique-paths

# There is a robot on an `m x n` grid. The robot is initially located at the
# top-left corner (i.e., `grid[0][0]`). The robot tries to move to the
# bottom-right corner (i.e., `grid[m - 1][n - 1]`). The robot can only move
# either down or right at any point in time.
#
# Given the two integers `m` and `n`, return *the number of possible unique paths
# that the robot can take to reach the bottom-right corner*.
#
# The test cases are generated so that the answer will be less than or equal to `2
# * 109`.
#
#
# Example 1:
#
# Input: m = 3, n = 7
# Output: 28
#
# Example 2:
#
# Input: m = 3, n = 2
# Output: 3
# Explanation: From the top-left corner, there are a total of 3 ways to reach
# the bottom-right corner:
# 1. Right -> Down -> Down
# 2. Down -> Down -> Right
# 3. Down -> Right -> Down
#
#
# Constraints:
#
# * `1 <= m, n <= 100`
#

# @leetup=custom
# @leetup=code

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  dp = Array.new(n) { 1 }
  m.pred.times do
    dp = dp.each_with_object(Array.new(n)).with_index do |its, idx|
      its => [item, new_dp]
      new_dp[idx] = if idx.zero?
        1
      else
        new_dp[idx - 1] + dp[idx]
      end
    end
  end
  dp.last
end
# @leetup=code
# @leetup=custom
unique_paths(3, 7) => 28
unique_paths(3, 2) => 3
# @leetup=custom
