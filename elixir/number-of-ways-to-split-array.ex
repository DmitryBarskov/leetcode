defmodule Solution do
  @spec ways_to_split_array(nums :: [integer]) :: integer
  def ways_to_split_array([n | rest]), do: recur(n, Enum.sum(rest), rest, 0)

  defp recur(_, _, [], acc), do: acc
  defp recur(left, right, [n | rest], acc),
    do: recur(left + n, right - n, rest, acc + (if left >= right, do: 1, else: 0))
end
