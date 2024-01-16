# @leetup=custom
# @leetup=info id=2385 lang=ruby slug=amount-of-time-for-binary-tree-to-be-infected

# You are given the `root` of a binary tree with unique values, and an integer
# `start`. At minute `0`, an infection starts from the node with value
# `start`.
#
# Each minute, a node becomes infected if:
#
# * The node is currently uninfected.
# * The node is adjacent to an infected node.
#
# Return *the number of minutes needed for the entire tree to be infected.*
#
# Example 1:
# Input: root = [1,5,3,null,4,10,6,9,2], start = 3
# Output: 4
# Explanation: The following nodes are infected during:
# - Minute 0: Node 3
# - Minute 1: Nodes 1, 10 and 6
# - Minute 2: Node 5
# - Minute 3: Node 4
# - Minute 4: Nodes 9 and 2
# It takes 4 minutes for the whole tree to be infected so we return 4.
#
# Example 2:
# Input: root = [1], start = 1
# Output: 0
# Explanation: At minute 0, the only node in the tree is infected so we return
#  0.
#
# Constraints:
# * The number of nodes in the tree is in the range `[1, 105]`.
# * `1 <= Node.val <= 105`
# * Each node has a unique value.
# * A node with a value of `start` exists in the tree.

require_relative "lib/tree_node"
# @leetup=custom
# @leetup=code

# @param {TreeNode} root
# @param {Integer} start
# @return {Integer}
def amount_of_time(root, start)
  # returns [tree height, depth of the start node, max distance to the start]
  recur = ->(current) {
    return [0, nil, nil] if current.nil?

    if current.val == start
      l_height, * = recur.call(current.left)
      r_height, * = recur.call(current.right)
      height = [l_height, r_height].max
      return [height + 1, 0, height]
    end

    l_height, l_start_depth, l_max_dist = recur.call(current.left)
    r_height, r_start_depth, r_max_dist = recur.call(current.right)

    if l_start_depth
      [
        [l_height, r_height].max + 1,
        l_start_depth + 1,
        [r_height + l_start_depth + 1, l_max_dist].max
      ]
    elsif r_start_depth
      [
        [l_height, r_height].max + 1,
        r_start_depth + 1,
        [l_height + r_start_depth + 1, r_max_dist].max
      ]
    else
      [
        [l_height, r_height].max + 1,
        nil,
        nil
      ]
    end
  }

  recur.call(root).last
end
# @leetup=code
# @leetup=custom
null = nil
amount_of_time(TreeNode.from_array([1, 2, null, 3, null, 4, null, 5]), 2) => 3
amount_of_time(TreeNode.from_array([1]), 1) => 0
amount_of_time(TreeNode.from_array([2, 1]), 1) => 1
amount_of_time(TreeNode.from_array([2, null, 1]), 1) => 1
amount_of_time(TreeNode.from_array([2, 3, 1]), 1) => 2
amount_of_time(TreeNode.from_array([3, 10, 6]), 3) => 1
amount_of_time(TreeNode.from_array([1, null, 3, 10, 6]), 3) => 1
amount_of_time(TreeNode.from_array([1, 5, null, null, 3, 10, 6]), 3) => 2
amount_of_time(TreeNode.from_array([1, 5, 3, null, 4, 10, 6, 9, 2]), 3) => 4
amount_of_time(TreeNode.from_array([59175]), 59175) => 0
amount_of_time(TreeNode.from_array([59175, null, 59176]), 59175) => 1
amount_of_time(TreeNode.from_array([17247, null, 17248, null, 17249, null, 17250, null, 17251, null, 17252, null, 17253, null, 17254, null, 17255, null, 17256, null, 17257, null, 17258, null, 17259, null, 17260, null, 17261, null, 17262, null, 17263, null, 17264, null, 17265, null, 17266]), 17247) => 19
# @leetup=custom
