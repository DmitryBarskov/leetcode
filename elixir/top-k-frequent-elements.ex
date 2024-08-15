defmodule Solution do
  @spec top_k_frequent(nums :: [integer], k :: integer) :: [integer]
  def top_k_frequent(nums, k), do: nums
  |> Enum.frequencies()
  |> Map.to_list()
  |> Enum.sort_by(&(elem(&1, 1)), :desc)
  |> Enum.map(&(elem(&1, 0)))
  |> Enum.take(k)
end
