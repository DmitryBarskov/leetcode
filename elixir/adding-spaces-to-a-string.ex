defmodule Solution do
  @spec add_spaces(s :: String.t, spaces :: [integer]) :: String.t
  def add_spaces(s, spaces), do: s |> String.to_charlist |> recur(0, spaces) |> List.to_string

  defp recur(chars, _, []), do: chars
  defp recur(chars, i, [pos | ps]) when i == pos, do: [' ' | recur(chars, i, ps)]
  defp recur([c | chars], i, ps), do: [c | recur(chars, i + 1, ps)]
end
