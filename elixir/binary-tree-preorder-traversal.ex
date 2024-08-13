defmodule Solution do
  @spec preorder_traversal(root :: TreeNode.t | nil) :: [integer]
  def preorder_traversal(root), do: Enum.reverse(recur([], root))

  defp recur(acc, nil), do: acc
  defp recur(acc, node), do: [node.val | acc] |> recur(node.left) |> recur(node.right)
end
