# frozen_string_literal: true

require_relative '../lib/tree_node'

# @param {TreeNode} root
# @return {TreeNode}
def balance_bst(root) = tree_from_array(array_from_tree(root))

def tree_from_array(array, from: 0, to: array.size)
  return nil if from >= to
  return TreeNode.new(array[from]) if from + 1 == to

  middle = from + ((to - from) / 2)
  TreeNode.new(
    array[middle],
    tree_from_array(array, from:, to: middle),
    tree_from_array(array, from: middle + 1, to:)
  )
end

def array_from_tree(root)
  array = []
  dfs(root) { |node| array << node.val }
  array
end

def dfs(root, &)
  return if root.nil?

  dfs(root.left, &)
  yield(root)
  dfs(root.right, &)
end

balance_bst(TreeNode.from_array([14,9,16,2,13])) => [14,9,16,2,13]
