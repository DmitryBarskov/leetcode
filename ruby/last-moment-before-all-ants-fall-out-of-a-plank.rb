# @leetup=custom
# @leetup=info id=1503 lang=ruby slug=last-moment-before-all-ants-fall-out-of-a-plank

# We have a wooden plank of the length `n` units. Some ants are walking on the
# plank, each ant moves with a speed of 1 unit per second. Some of the ants
# move to the left, the other move to the right.
#
# When two ants moving in two different directions meet at some point, they
# change their directions and continue moving again. Assume changing directions
# does not take any additional time.
#
# When an ant reaches one end of the plank at a time `t`, it falls out of the
# plank immediately.
#
# Given an integer `n` and two integer arrays `left` and `right`, the positions of
# the ants moving to the left and the right, return *the moment when the last
# ant(s) fall out of the plank*.
#
#
# Example 1:
# https://assets.leetcode.com/uploads/2020/06/17/ants.jpg
# Input: n = 4, left = [4,3], right = [0,1]
# Output: 4
# Explanation: In the image above:
# -The ant at index 0 is named A and going to the right.
# -The ant at index 1 is named B and going to the right.
# -The ant at index 3 is named C and going to the left.
# -The ant at index 4 is named D and going to the left.
# The last moment when an ant was on the plank is t = 4 seconds. After that, it fa
# lls immediately out of the plank. (i.e., We can say that at t = 4.0000000001, th
# ere are no ants on the plank).
# -> ->    <- <-
# [A, B, ., C, D]
# Scale x2: n*2 - 1
# 0.0: [A, ., B, ., ., ., C, ., D]
# 0.5: [., A, ., B, ., C, ., D, .]
# 1.0: [., ., A, .,BC, ., D, ., .]
# 1.5: [., ., .,AB, .,CD, ., ., .]
# 2.0: [., ., A, .,BC, ., D, ., .]
# 2.5: [., A, ., B, ., C, ., D, .]
# 3.0: [A, ., B, ., ., ., C, ., D]
# 3.5: [., B, ., ., ., ., ., C, .]
# 4.0: [B, ., ., ., ., ., ., ., C]
# 4.5: [., ., ., ., ., ., ., ., .]
#
# Example 2:
# https://assets.leetcode.com/uploads/2020/06/17/ants2.jpg
# Input: n = 7, left = [], right = [0,1,2,3,4,5,6,7]
# Output: 7
# Explanation: All ants are going to the right, the ant at index 0 needs 7 sec
# onds to fall.
#
# Example 3:
# https://assets.leetcode.com/uploads/2020/06/17/ants3.jpg
# Input: n = 7, left = [0,1,2,3,4,5,6,7], right = []
# Output: 7
# Explanation: All ants are going to the left, the ant at index 7 needs 7 seco
# nds to fall.
#
# My example:
# -> <-    <-
# [A, B, ., C]
# Scale x2:
# 0.0: [A, ., B, ., ., ., C]
# 0.5: [.,AB, ., ., ., C, .]
# 1.0: [A, ., B, ., C, ., .]
# 1.5: [., ., .,BC, ., ., .]
# 2.0: [., ., B, ., C, ., .]
# 2.5: [., B, ., ., ., C, .]
# 3.0: [B, ., ., ., ., ., C]
# 3.5: [., ., ., ., ., ., .]
#
# Constraints:
#
# * `1 <= n <= 10^4`
# * `0 <= left.length <= n + 1`
# * `0 <= left[i] <= n`
# * `0 <= right.length <= n + 1`
# * `0 <= right[i] <= n`
# * `1 <= left.length + right.length <= n + 1`
# * All values of `left` and `right` are unique, and each value can appear only
#   in one of the two arrays.
#

# @leetup=custom
# @leetup=code

# @param {Integer} n
# @param {Integer[]} left
# @param {Integer[]} right
# @return {Integer}
def get_last_moment(n, left, right)
  [
    left.reduce { |farthest, ant| [farthest, ant].max },
    right.reduce { |closest, ant| [closest, ant].min }&.-(n)&.-@
  ].compact.max
end
# @leetup=code

get_last_moment(4, [4, 3], [0, 1]) => 4
get_last_moment(7, [], [0, 1, 2, 3, 4, 5, 6, 7]) => 7
get_last_moment(7, [0, 1, 2, 3, 4, 5, 6, 7], []) => 7
