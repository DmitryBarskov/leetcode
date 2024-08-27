defmodule Solution do
  @spec contains_duplicate(nums :: [integer]) :: boolean
  def contains_duplicate(nums, set \\ MapSet.new())
  def contains_duplicate([], _), do: false
  def contains_duplicate([n | rest], set) do
    cond do
      MapSet.member?(set, n) -> true
      true -> contains_duplicate(rest, MapSet.put(set, n))
    end
  end
end