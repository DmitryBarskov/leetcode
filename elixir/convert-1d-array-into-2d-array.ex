defmodule Solution do
  @spec construct2_d_array(original :: [integer], m :: integer, n :: integer) :: [[integer]]
  def construct2_d_array(original, m, n, i \\ 0, acc1 \\ [], j \\ 0, acc2 \\ [])

  def construct2_d_array(original, m, n, i, acc1, j, acc2) when i == n, do:
    construct2_d_array(original, m, n, 0, [], j + 1, [Enum.reverse(acc1) | acc2])

  def construct2_d_array([], m, _, 0, [], j, acc2) when j == m, do:
    Enum.reverse(acc2)

  def construct2_d_array([x | rest], m, n, i, acc1, j, acc2), do:
    construct2_d_array(rest, m, n, i + 1, [x | acc1], j, acc2)

  def construct2_d_array([], _, _, _, _, _, _), do: []
end
