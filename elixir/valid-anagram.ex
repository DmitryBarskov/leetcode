defmodule Solution do
  @spec is_anagram(s :: String.t, t :: String.t) :: boolean
  def is_anagram(s, t), do: [s, t]
  |> Enum.map(&(String.graphemes(&1)))
  |> Enum.map(&(Enum.frequencies(&1)))
  |> Enum.reduce(&(&1 == &2))
end
