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
  @spec postorder_traversal(root :: TreeNode.t | nil) :: [integer]
  def postorder_traversal(root), do: reduce([], root, &([&2 | &1])) |> Enum.reverse

  def reduce(acc, nil, _), do: acc
  def reduce(acc, root, f), do: acc |> reduce(root.left, f) |> reduce(root.right, f) |> f.(root.val)
end
