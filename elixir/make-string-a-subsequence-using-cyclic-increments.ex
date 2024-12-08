defmodule Solution do
  @spec can_make_subsequence(str1 :: String.t, str2 :: String.t) :: boolean
  def can_make_subsequence(str1, str2), do: recur(to_charlist(str1), to_charlist(str2))

  defp recur(_, []), do: true
  defp recur([], _), do: false
  defp recur([c1 | str1], [c2 | str2]) when c1 == c2 or c1 + 1 == c2 or c1 - 25 == c2,
    do: recur(str1, str2)
  defp recur([_ | str1], str2), do: recur(str1, str2)
end
