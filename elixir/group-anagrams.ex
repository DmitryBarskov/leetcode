defmodule Solution do
  @spec group_anagrams(strs :: [String.t]) :: [[String.t]]
  def group_anagrams(strs), do: strs
  |> Enum.group_by(fn str -> str |> String.graphemes() |> Enum.sort() end)
  |> Map.values()
end