defmodule Solution do
  @spec merge_trees(root1 :: TreeNode.t | nil, root2 :: TreeNode.t | nil) :: TreeNode.t | nil
  def merge_trees(nil, nil), do: nil
  def merge_trees(root1, nil), do: root1
  def merge_trees(nil, root2), do: root2
  def merge_trees(root1, root2) do
    %TreeNode{
      val: root1.val + root2.val,
      left: merge_trees(root1.left, root2.left),
      right: merge_trees(root1.right, root2.right)
    }
  end
end