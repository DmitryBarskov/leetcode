defmodule Solution do
  @spec is_valid(s :: String.t) :: boolean
  def is_valid(s), do: recur(String.graphemes(s), [])

  defp recur([], []), do: true
  defp recur([], _), do: false
  defp recur(["(" | rest], stack), do: recur(rest, [")" | stack])
  defp recur(["[" | rest], stack), do: recur(rest, ["]" | stack])
  defp recur(["{" | rest], stack), do: recur(rest, ["}" | stack])
  defp recur([p | rest], [cl | stack]) when p == cl, do: recur(rest, stack)
  defp recur(_, _), do: false
end
