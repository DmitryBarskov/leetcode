defmodule Solution do
  @spec can_change(start :: String.t, target :: String.t) :: boolean
  def can_change(start, target), do: recur(start, 0, target, 0)

  def recur("", _, "", _), do: true
  def recur("_" <> start, i, target, j), do: recur(start, i + 1, target, j)
  def recur(start, i, "_" <> target, j), do: recur(start, i, target, j + 1)
  def recur("L" <> start, i, "L" <> target, j), do: i >= j and recur(start, i + 1, target, j + 1)
  def recur("R" <> start, i, "R" <> target, j), do: i <= j and recur(start, i + 1, target, j + 1)
  def recur(_, _, _, _), do: false
end
