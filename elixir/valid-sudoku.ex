defmodule Solution do
  @spec is_valid_sudoku(board :: [[char]]) :: boolean
  def is_valid_sudoku(board), do: valid?(board) and valid?(columns(board)) and valid?(squares(board))

  def valid?(board), do: Enum.all?(board, fn row -> valid_row?(row) end)

  def valid_row?(row, set \\ MapSet.new)
  def valid_row?([], _), do: true
  def valid_row?(["." | rest], set), do: valid_row?(rest, set)
  def valid_row?([46 | rest], set), do: valid_row?(rest, set)
  def valid_row?([num | rest], set), do:
    (not MapSet.member?(set, num)) and valid_row?(rest, MapSet.put(set, num))

  def columns(board), do: board
  |> Enum.reduce(
      Map.new(),
      fn row, map -> row
        |> Enum.zip(0..8)
        |> Enum.reduce(
          map,
          fn {cell, index}, m ->
            Map.put(m, index, [cell | Map.get(m, index, [])])
          end
        )
      end
    )
  |> Map.values()

  def squares(board), do: board
  |> Enum.zip(0..8)
  |> Enum.reduce(
      Map.new(),
      fn {row, i}, map -> row
        |> Enum.zip(0..8)
        |> Enum.reduce(
          map,
          fn {cell, j}, m ->
            key = {div(i, 3), div(j, 3)}
            Map.put(m, key, [cell | Map.get(m, key, [])])
          end
        )
      end
    )
  |> Map.values()
end