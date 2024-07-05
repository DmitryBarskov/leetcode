# frozen_string_literal: true

rqeuire_relative '../lib/tree_node'

# @param {TreeNode} root
# @return {TreeNode}
def convert_bst(root)
  sum = 0
  dfs(root) do |node|
    new_sum = sum + node.val
    node.val = new_sum
    sum = node.val
  end
  root
end

def dfs(root, &)
  return if root.nil?

  dfs(root.right, &)
  yield root
  dfs(root.left, &)
end
