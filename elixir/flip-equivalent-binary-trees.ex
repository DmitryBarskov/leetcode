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
  @spec flip_equiv(root1 :: TreeNode.t | nil, root2 :: TreeNode.t | nil) :: boolean
  def flip_equiv(nil, nil), do: true
  def flip_equiv(%{val: v1}, %{val: v2}) when v1 != v2, do: false
  def flip_equiv(%{left: l1, right: r1}, %{left: l2, right: r2}) do
    flip_equiv(l1, l2) and flip_equiv(r1, r2) or flip_equiv(l1, r2) and flip_equiv(r1, l2)
  end
  def flip_equiv(_, _), do: false
end
