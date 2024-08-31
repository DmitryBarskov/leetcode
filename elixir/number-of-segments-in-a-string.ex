defmodule Solution do
  @spec count_segments(s :: String.t) :: integer
  def count_segments(s), do: s
  |> String.splitter(" ", trim: true)
  |> Enum.count()
end
