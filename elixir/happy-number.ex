defmodule Solution do
  @spec is_happy(n :: integer) :: boolean
  def is_happy(1), do: true
  def is_happy(7), do: true
  def is_happy(n) when n <= 9, do: false
  def is_happy(n), do: n
    |> Integer.digits()
    |> Enum.map(&(&1 * &1))
    |> Enum.sum()
    |> is_happy()
end