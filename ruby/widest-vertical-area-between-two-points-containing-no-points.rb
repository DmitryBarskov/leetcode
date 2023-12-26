# @leetup=custom
# @leetup=info id=1637 lang=ruby slug=widest-vertical-area-between-two-points-containing-no-points

# Given `n` `points` on a 2D plane where `points[i] = [xi, yi]`, Return* the
# widest vertical area between two points such that no points are inside the
# area.*
#
# A vertical area is an area of fixed-width extending infinitely along the
# y-axis (i.e., infinite height). The widest vertical area is the one with the
# maximum width.
#
# Note that points on the edge of a vertical area are not considered
# included in the area.
#
#
# Example 1:
#
#
# Input: points = [[8,7],[9,9],[7,4],[9,7]]
# Output: 1
# Explanation: Both the red and the blue area are optimal.
#
# Example 2:
#
# Input: points = [[3,1],[9,0],[1,0],[1,4],[5,3],[8,8]]
# Output: 3
#
#
# Constraints:
#
# * `n == points.length`
# * `2 <= n <= 105`
# * `points[i].length == 2`
# * `0 <= xi, yi <= 109`
#

# @leetup=custom
# @leetup=code

# @param {Integer[][]} points
# @return {Integer}
def max_width_of_vertical_area(points)
  points.map(&:first).sort.each_cons(2).reduce(0) { |max_diff, pts| [max_diff, pts[1] - pts[0]].max }
end
# @leetup=code
