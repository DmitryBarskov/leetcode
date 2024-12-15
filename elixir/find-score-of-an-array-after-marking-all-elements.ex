defmodule Solution do
  @spec find_score(nums :: [integer]) :: integer
  def find_score(nums),
    do:
      nums
      |> Enum.with_index
      |> Enum.sort
      |> Enum.reduce_while(
        {0, MapSet.new(0..length(nums) - 1)},
        fn {value_to_remove, index}, {score, unmarked} ->
          cond do
            MapSet.size(unmarked) == 0 -> {:halt, {score, unmarked}}
            MapSet.member?(unmarked, index) -> {
              :cont,
              {
                score + value_to_remove,
                unmarked |> MapSet.delete(index - 1) |> MapSet.delete(index) |> MapSet.delete(index + 1)
              }
            }
            true -> {:cont, {score, unmarked}}
          end
        end
      )
      |> elem(0)
end
