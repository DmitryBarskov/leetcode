defmodule Solution do
  @spec my_pow(x :: float, n :: integer) :: float
  def my_pow(_, 0), do: 1.0
  def my_pow(0.0, _), do: 0.0
  def my_pow(x, 1), do: x
  def my_pow(1.0, _), do: 1.0
  def my_pow(x, n) when n < 0, do: my_pow(1 / x, -n)
  def my_pow(x, n) when rem(n, 2) == 0, do: my_pow(x * x, div(n, 2))
  def my_pow(x, n), do: x * my_pow(x, n - 1)
end
