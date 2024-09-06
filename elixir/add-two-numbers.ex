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
  def add_two_numbers(l1, l2, carry \\ 0)
  def add_two_numbers(nil, nil, 0), do: nil
  def add_two_numbers(nil, nil, carry), do:
    %ListNode{val: carry, next: add_two_numbers(nil, nil, 0)}
  def add_two_numbers(nil, l2, carry), do: add_two_numbers(l2, nil, carry)
  def add_two_numbers(%{val: d1, next: l1}, nil, carry), do:
    %ListNode{val: rem(carry + d1, 10), next: add_two_numbers(l1, nil, div(carry + d1, 10))}
  def add_two_numbers(%{val: d1, next: l1}, %{val: d2, next: l2}, carry), do:
    %ListNode{val: rem(d1 + d2 + carry, 10), next: add_two_numbers(l1, l2, div(d1 + d2 + carry, 10))}
end
