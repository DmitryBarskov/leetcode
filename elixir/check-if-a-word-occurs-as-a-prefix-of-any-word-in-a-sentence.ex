defmodule Solution do
  @spec is_prefix_of_word(sentence :: String.t, search_word :: String.t) :: integer
  def is_prefix_of_word(sentence, search_word), do:
    sentence
      |> String.split(" ")
      |> Enum.find_index(&String.starts_with?(&1, search_word))
      |> then(&((&1 || -2) + 1))
end
