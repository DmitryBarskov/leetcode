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
  @spec find_mode(root :: TreeNode.t | nil) :: [integer]
  def find_mode(root),
    do:
      count(root)
      |> IO.inspect
      |> Enum.reduce(
        {[], 0},
        fn
          {val, count}, {_, mode_count} when count > mode_count -> {[val], count}
          {_, count}, {_, mode_count} = acc when count < mode_count -> acc
          {val, count}, {modes, mode_count} when count == mode_count -> {[val | modes], count}
        end
      )
      |> elem(0)

  def count(nil), do: %{}
  def count(%{val: val, left: left, right: right}),
    do:
      Map.merge(count(left), count(right), fn _k, v1, v2 -> v1 + v2 end)
      |> Map.update(val, 1, &(&1 + 1))
end
