defmodule Solution do
  @spec string_matching(words :: [String.t]) :: [String.t]
  def string_matching(words), do:
      words
      |> Enum.filter(fn word -> Enum.any?(words, &(&1 != word and String.contains?(&1, word))) end)
end
