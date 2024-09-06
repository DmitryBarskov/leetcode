defmodule Solution do
  @spec smaller_numbers_than_current(nums :: [integer]) :: [integer]
  def smaller_numbers_than_current(nums) do
    Enum.map(nums, fn num -> Enum.count(nums, &(&1 < num)) end)
  end
end
