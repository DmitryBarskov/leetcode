defmodule Solution do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) when x < 0, do: false
  def is_palindrome(x), do: Integer.digits(x) == Enum.reverse(Integer.digits(x))
end