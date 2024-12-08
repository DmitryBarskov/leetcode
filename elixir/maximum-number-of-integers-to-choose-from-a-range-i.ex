defmodule Solution do
  @spec max_count(banned :: [integer], n :: integer, max_sum :: integer) :: integer
  def max_count(banned, n, max_sum) do
    banned_set = MapSet.new(banned)
    1..n
    |> Enum.reduce(
      {0, 0},
      fn number, {count, sum} ->
        if number + sum > max_sum or MapSet.member?(banned_set, number) do
          {count, sum}
        else
          {count + 1, number + sum}
        end
      end
    ) |> elem(0)
  end
end
