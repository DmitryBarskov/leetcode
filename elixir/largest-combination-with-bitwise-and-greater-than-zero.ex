defmodule Solution do
  @spec largest_combination(candidates :: [integer]) :: integer
  def largest_combination(candidates), do: candidates
  |> Enum.reduce(Map.new(0..23, &({&1, 0})), &count_bits/2)
  |> Map.values |> Enum.max

  def count_bits(number, map), do:
    Enum.reduce(
      0..23,
      map,
      fn bit, m ->
        update_bit(bit, m, number)
      end
    )

  def update_bit(bit, map, number), do: 
    Map.update!(
      map,
      bit,
      &(&1 + Bitwise.band(Bitwise.bsr(number, bit), 1))
    )
end
