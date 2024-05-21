# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
  index = 0
  left_root_right = lambda do |node|
    return if node.nil?

    l = left_root_right.(node.left)
    return l if l

    index += 1
    return node if index >= k

    left_root_right.(node.right)
  end

  left_root_right.(root).val
end
