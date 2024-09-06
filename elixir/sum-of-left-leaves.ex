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
  @spec sum_of_left_leaves(root :: TreeNode.t | nil) :: integer
  def sum_of_left_leaves(nil), do: 0
  def sum_of_left_leaves(%{val: _, left: %{val: val, left: nil, right: nil}, right: right}), do:
    val + sum_of_left_leaves(right)
  def sum_of_left_leaves(%{val: _, left: left, right: right}), do:
    sum_of_left_leaves(left) + sum_of_left_leaves(right)
end
