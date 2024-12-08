defmodule Solution do
  @spec find_special_integer(arr :: [integer]) :: integer
  def find_special_integer(arr), do: recur(arr, 0, 0, 0, 0)

  defp recur([], _, mode_count, current, current_count) when current_count > mode_count, do: current
  defp recur([], mode, _, _, _), do: mode
  defp recur([x | rest], mode, mode_count, current, current_count) when x == current,
    do: recur(rest, mode, mode_count, x, current_count + 1)
  defp recur([x | rest], mode, mode_count, current, current_count),
    do: recur(rest, if current_count > mode_count do current else mode end, max(current_count, mode_count), x, 1)
end
