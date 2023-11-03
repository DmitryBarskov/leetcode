# frozen_string_literal: true

# https://leetcode.com/problems/count-nodes-equal-to-average-of-subtree/

# @param {TreeNode} root
# @return {Integer}
def average_of_subtree(root)
  iter(root).last
end

# @param {TreeNode} node - subtree
# @return {[Integer, Integer, Integer]} -
#          [nodes count, sum of nodes' values, count of roots values = average]
def iter(node)
  return [0, 0, 0] if node.nil?

  left_count, left_sum, left_eql_count = iter(node.left)
  right_count, right_sum, right_eql_count = iter(node.right)

  sum = left_sum + right_sum + node.val
  count = left_count + right_count + 1

  [
    count, sum,
    left_eql_count + right_eql_count + (((sum / count) == node.val) ? 1 : 0)
  ]
end
