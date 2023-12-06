# @leetup=custom
# @leetup=info id=606 lang=ruby slug=construct-string-from-binary-tree


# Given the `root` of a binary tree, construct a string consisting of parenthesis
# and integers from a binary tree with the preorder traversal way, and return it.
#
# Omit all the empty parenthesis pairs that do not affect the one-to-one mapping
# relationship between the string and the original binary tree.
#
#
# Example 1:
#
# Input: root = [1,2,3,4]
# Output: "1(2(4))(3)"
# Explanation: Originally, it needs to be "1(2(4)())(3()())", but you need to
# omit all the unnecessary empty parenthesis pairs. And it will be "1(2(4))(3)"
#
# Example 2:
#
# Input: root = [1,2,3,null,4]
# Output: "1(2()(4))(3)"
# Explanation: Almost the same as the first example, except we cannot omit the
#  first parenthesis pair to break the one-to-one mapping relationship between the
#  input and the output.
#
#
# Constraints:
#
# * The number of nodes in the tree is in the range `[1, 104]`.
# * `-1000 <= Node.val <= 1000`
#
require_relative 'lib/tree_node.rb'
# @leetup=custom
# @leetup=code

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} node
# @return {String}
def tree2str(node)
  "".tap do |str|
    next if node.nil?

    str << node&.val.to_s
    next if node.right.nil? && node.left.nil?

    str << "(#{tree2str(node.left)})"
    next if node.right.nil?

    str << "(#{tree2str(node.right)})"
  end
end

# @leetup=code
# @leetup=custom
tree2str(TreeNode[1,2,3,4]) => "1(2(4))(3)"
tree2str(TreeNode[1,2,3,nil,4]) => "1(2()(4))(3)"
# @leetup=custom
