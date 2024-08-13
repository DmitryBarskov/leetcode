defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target), do: recur(nums, target, 0, %{})

  defp recur([n | nums], target, i, map) do
    if Map.has_key?(map, target - n) do
      [Map.get(map, target - n), i]
    else
      recur(nums, target, i + 1, Map.put(map, n, i))
    end
  end
end