defmodule Solution do
  require Integer

  @spec max_matrix_sum(matrix :: [[integer]]) :: integer
  def max_matrix_sum(matrix) do
    {abs_sum, abs_min, negatives} = stats(matrix)
    cond do
      Integer.is_even(negatives) -> abs_sum
      true -> abs_sum - 2 * abs_min
    end
  end

  def stats(matrix),
    do: matrix |> Enum.map(&row_stats(&1)) |> Enum.reduce(&(merge_stats(&1, &2)))

  def row_stats(row, abs_sum \\ 0, abs_min \\ 100001, negatives \\ 0)
  def row_stats([], abs_sum, abs_min, negatives),
    do: {abs_sum, abs_min, negatives}
  def row_stats([item | rest], abs_sum, abs_min, negatives),
    do: row_stats(
        rest,
        abs_sum + abs(item),
        min(abs(item), abs_min),
        (if item < 0, do: negatives + 1, else: negatives)
    )

  def merge_stats(s1, s2) do
    {abs_sum_1, abs_min_1, negatives_1} = s1
    {abs_sum_2, abs_min_2, negatives_2} = s2
    {abs_sum_1 + abs_sum_2, min(abs_min_1, abs_min_2), negatives_1 + negatives_2}
  end
end