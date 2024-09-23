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
  @spec insert_greatest_common_divisors(head :: ListNode.t | nil) :: ListNode.t | nil
  def insert_greatest_common_divisors(nil), do: nil
  def insert_greatest_common_divisors(%{next: nil} = single), do: single
  def insert_greatest_common_divisors(%{val: a, next: %{val: b} = rest}), do:
    cons(a, cons(Integer.gcd(a, b), insert_greatest_common_divisors(rest)))

  def cons(val, next), do: %ListNode{val: val, next: next}
end
