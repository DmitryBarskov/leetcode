# Definition for singly-linked list.
#
# defmodule ListNode do
#   @type t :: %__MODULE__{
#           val: integer,
#           next: ListNode.t() | nil
#         }
#   defstruct val: 0, next: nil
# end

defmodule Solution do
  @spec modified_list(nums :: [integer], head :: ListNode.t | nil) :: ListNode.t | nil
  def modified_list(nums, head), do: recur(MapSet.new(nums), head)

  def recur(_, nil), do: nil
  def recur(to_delete, %{val: val, next: next}) do
    if MapSet.member?(to_delete, val) do
      recur(to_delete, next)
    else
      %ListNode{val: val, next: recur(to_delete, next)}
    end
  end
end
