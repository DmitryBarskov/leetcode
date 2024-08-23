defmodule Solution do
  @spec dominant_index(nums :: [integer]) :: integer
  def dominant_index(nums), do: recur(nums, 0, -1, -1, -1)

  defp recur([], _, first_index, first, second) when first >= 2 * second, do: first_index
  defp recur([], _, _, _, _), do: -1
  defp recur([n | nums], i, first_index, first, second) when n > first do
    recur(nums, i + 1, i, n, first)
  end
  defp recur([n | nums], i, first_index, first, second) when n > second do
    recur(nums, i + 1, first_index, first, n)
  end
  defp recur([_ | nums], i, first_index, first, second) do
    recur(nums, i + 1, first_index, first, second)
  end
end
