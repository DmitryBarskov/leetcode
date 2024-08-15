defmodule Solution do
  @spec lemonade_change(bills :: [integer]) :: boolean
  def lemonade_change(bills), do: recur(bills, 0, 0)

  defp recur(_, fives, tens) when fives < 0 or tens < 0, do: false
  defp recur([], _, _), do: true
  defp recur([5 | customers], fives, tens), do: recur(customers, fives + 1, tens)
  defp recur([10 | customers], fives, tens), do: recur(customers, fives - 1, tens + 1)
  defp recur([20 | customers], fives, 0), do: recur(customers, fives - 3, 0)
  defp recur([20 | customers], fives, tens), do: recur(customers, fives - 1, tens - 1)
end