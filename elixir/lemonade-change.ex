defmodule Solution do
  @spec lemonade_change(bills :: [integer]) :: boolean
  def lemonade_change(bills, fives \\ 0, tens \\ 0)

  def lemonade_change(_, fives, tens) when fives < 0 or tens < 0, do: false
  def lemonade_change([], _, _), do: true
  def lemonade_change([ 5 | rest], fives, tens), do: lemonade_change(rest, fives + 1, tens)
  def lemonade_change([10 | rest], fives, tens), do: lemonade_change(rest, fives - 1, tens + 1)
  def lemonade_change([20 | rest], fives,    0), do: lemonade_change(rest, fives - 3, 0)
  def lemonade_change([20 | rest], fives, tens), do: lemonade_change(rest, fives - 1, tens - 1)
end
