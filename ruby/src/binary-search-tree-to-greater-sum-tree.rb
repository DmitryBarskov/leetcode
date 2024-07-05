# frozen_string_literal: true

require_relative '../lib/tree_node'

# @param {TreeNode} root
# @return {TreeNode}
def bst_to_gst(root)
  sum = 0
  right_to_left(root) do |node|
    new_sum = sum + node.val
    node.val = new_sum
    sum = new_sum
  end
  root
end

def right_to_left(root, &)
  return if root.nil?

  right_to_left(root.right, &)
  yield(root)
  right_to_left(root.left, &)
end

bst_to_gst(TreeNode.from_array([4,1,6,0,2,5,7,nil,nil,nil,3,nil,nil,nil,
                                8])).to_a => [30,36,21,36,35,26,15,nil,nil,nil,33,nil,nil,nil,8]
