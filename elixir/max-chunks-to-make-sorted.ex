defmodule Solution do
  @spec max_chunks_to_sorted(arr :: [integer]) :: integer
  def max_chunks_to_sorted(arr), do: recur(arr, Enum.sort(arr), %{}, 0)

  def recur([], _, _, acc), do: acc
  def recur([n | nums], [s | sorted], count, acc) do
    if map_size(count) == 0 do
      recur(nums, sorted, count |> inc(n) |> dec(s), acc + 1)
    else
      recur(nums, sorted, count |> inc(n) |> dec(s), acc)
    end
  end

  def inc(map, key), do: Map.update(map, key, 1, &(&1 + 1)) |> remove_zero(key)
  def dec(map, key), do: Map.update(map, key, -1, &(&1 - 1)) |> remove_zero(key)

  def remove_zero(map, key) do
    if Map.has_key?(map, key) && map[key] == 0 do
      Map.delete(map, key)
    else
      map
    end
  end
end
