# @leetup=custom
# @leetup=info id=105 lang=ruby slug=construct-binary-tree-from-preorder-and-inorder-traversal

# Given two integer arrays `preorder` and `inorder` where `preorder` is the
# preorder traversal of a binary tree and `inorder` is the inorder traversal of
# the same tree, construct and return *the binary tree*.
#
#
# Example 1:
#
# Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
# Output: [3,9,20,null,null,15,7]
#
# Example 2:
#
# Input: preorder = [-1], inorder = [-1]
# Output: [-1]
#
#
# Constraints:
#
# * `1 <= preorder.length <= 3000`
# * `inorder.length == preorder.length`
# * `-3000 <= preorder[i], inorder[i] <= 3000`
# * `preorder` and `inorder` consist of unique values.
# * Each value of `inorder` also appears in `preorder`.
# * `preorder` is guaranteed to be the preorder traversal of the tree.
# * `inorder` is guaranteed to be the inorder traversal of the tree.
#
require_relative "lib/tree_node"
# @leetup=custom
# @leetup=code

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  return nil if preorder.empty?
  return TreeNode.new(preorder[0]) if inorder.one?

  i = inorder.index(preorder[0])

  TreeNode.new(
    preorder[0],
    build_tree(preorder[1..i], inorder[...i]),
    build_tree(preorder[i + 1..], inorder[i + 1..])
  )
end

# @leetup=code
# @leetup=code
build_tree([3, 9], [9, 3]) => [3, 9]
build_tree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7]) => [3, 9, 20, nil, nil, 15, 7]
build_tree([-1], [-1]) => [-1]
build_tree([1, 2, 5, 6, 3], [5, 2, 6, 1, 3]) => [1, 2, 3, 5, 6]
build_tree([8, 3, 1, 6, 4, 7, 10, 14, 13], [1, 3, 4, 6, 7, 8, 10, 13, 14]) => [8, 3, 10, 1, 6, nil, 14, nil, nil, 4, 7, 13]
# @leetup=code
