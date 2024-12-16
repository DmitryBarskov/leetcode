defmodule Solution do
  @spec unique_paths(m :: integer, n :: integer) :: integer
  def unique_paths(m, n), do: c(m + n - 2, m - 1)

  def c(n, k), do: round(fact(n) / fact(k) / fact(n - k))

  def fact(n, acc \\ 1)
  def fact(n, _) when n < 0, do: 1
  def fact(0, acc), do: acc
  def fact(n, acc), do: fact(n - 1, n * acc)
end
