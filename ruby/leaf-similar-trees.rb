# @leetup=custom
# @leetup=info id=872 lang=ruby slug=leaf-similar-trees

# Consider all the leaves of a binary tree, from left to right order, the values
# of those leaves form a leaf value sequence*.*
#
# For example, in the given tree above, the leaf value sequence is `(6, 7, 4, 9,
# 8)`.
#
# Two binary trees are considered *leaf-similar* if their leaf value sequence is
# the same.
#
# Return `true` if and only if the two given trees with head nodes `root1` and
# `root2` are leaf-similar.
#
# Example 1:
# Input: root1 = [3,5,1,6,2,9,8,null,null,7,4], root2 = [3,5,1,6,7,4,2,null,nu
# ll,null,null,null,null,9,8]
# Output: true
#
# Example 2:
# Input: root1 = [1,2,3], root2 = [1,3,2]
# Output: false
#
# Constraints:
# * The number of nodes in each tree will be in the range `[1, 200]`.
# * Both of the given trees will have values in the range `[0, 200]`.
require_relative "lib/tree_node"
# @leetup=custom
# @leetup=code

def leaves(tree)
  Enumerator.new do |e|
    stack = [tree]

    while stack.any?
      current_node = stack.pop

      stack.push(current_node.right) if current_node.right
      stack.push(current_node.left) if current_node.left

      e.yield(current_node) if current_node.left.nil? && current_node.right.nil?
    end
  end
end

def zip_on_longest(seq1, seq2)
  iter1 = seq1.each
  iter2 = seq2.each

  Enumerator.new do |e|
    loop do
      v1 = iter1&.next rescue iter1 = nil
      v2 = iter2&.next rescue iter2 = nil
      break if iter1.nil? && iter2.nil?
      e.yield([v1, v2])
    end
  end
end

def leaf_similar(root1, root2)
  zip_on_longest(leaves(root1), leaves(root2)).each do |l1, l2|
    return false if l1&.val != l2&.val
  end
  true
end
# @leetup=code
# @leetup=custom
null = nil
leaf_similar(
  TreeNode.from_array([3, 5, 1, 6, 2, 9, 8, null, null, 7, 4]),
  TreeNode.from_array([3, 5, 1, 6, 7, 4, 2, null, null, null, null, null, null, 9, 8])
) => true
leaf_similar(TreeNode.from_array([1, 2, 3]), TreeNode.from_array([1, 3, 2])) => false
# Output: false
# @leetup=custom
