# Definition for a binary tree node.
#
# defmodule TreeNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           left: TreeNode.t() | nil,
#           right: TreeNode.t() | nil
#         }
#   defstruct val: 0, left: nil, right: nil
# end

defmodule Solution do
  @spec reverse_odd_levels(root :: TreeNode.t | nil) :: TreeNode.t | nil
  def reverse_odd_levels(root) do
    {l, r} = dfs_odd(root.left, root.right)
    node(root.val, l, r)
  end

  def dfs_odd(nil, nil), do: {nil, nil}
  def dfs_odd(node1, node2) do
    {l1, r2} = dfs_even(node1.left, node2.right)
    {r1, l2} = dfs_even(node1.right, node2.left)
    {node(node2.val, l1, r1), node(node1.val, l2, r2)}
  end

  def dfs_even(nil, nil), do: {nil, nil}
  def dfs_even(node1, node2) do
    {l1, r2} = dfs_odd(node1.left, node2.right)
    {r1, l2} = dfs_odd(node1.right, node2.left)
    {node(node1.val, l1, r1), node(node2.val, l2, r2)}
  end

  def node(val, left, right), do: %TreeNode{val: val, left: left, right: right}
end
