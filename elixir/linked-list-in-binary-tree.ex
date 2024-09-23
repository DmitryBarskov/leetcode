# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

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
  @spec is_sub_path(head :: ListNode.t | nil, root :: TreeNode.t | nil) :: boolean
  def is_sub_path(nil, _), do: true
  def is_sub_path(_, nil), do: false
  def is_sub_path(sub_path, tree), do: is_prefix(sub_path, tree) or is_sub_path(sub_path, tree.left) or is_sub_path(sub_path, tree.right)

  def is_prefix(nil, _), do: true
  def is_prefix(_, nil), do: false
  def is_prefix(prefix, tree), do: prefix.val == tree.val and (is_prefix(prefix.next, tree.left) or is_prefix(prefix.next, tree.right))
end
