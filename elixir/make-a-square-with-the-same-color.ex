defmodule Solution do
  @spec can_make_square(grid :: [[char]]) :: boolean
  def can_make_square([[c1, c2, c3], [c4, c5, c6],[c7, c8, c9]]),
    do:
      [[c1, c2, c4, c5], [c2, c3, c5, c6], [c4, c5, c7, c8], [c5, c6, c8, c9]]
      |> Enum.map(fn two_by_two -> Enum.count(two_by_two, &(&1 == ?W)) end)
      |> Enum.any?(&(&1 != 2))
end
