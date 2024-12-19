defmodule Solution do
  @spec similar_pairs(words :: [String.t]) :: integer
  def similar_pairs(words),
    do:
      Enum.group_by(words, &characters/1)
      |> Enum.reduce(
        0,
        fn {_, l}, acc -> acc + div(length(l) * (length(l) - 1), 2) end
      )

  defp characters(str),
    do:
      String.to_charlist(str)
      |> Enum.reduce(
        0,
        fn char_code, acc ->
          Bitwise.bor(acc, Bitwise.bsl(1, char_code - (~c"a" |> hd)))
        end
      )
end
