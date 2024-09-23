defmodule Solution do
  @spec running_sum(nums :: [integer]) :: [integer]
  def running_sum(nums, sum \\ 0, acc \\ [])
  def running_sum([], _, acc), do: Enum.reverse(acc)
  def running_sum([n | nums], sum, acc), do: running_sum(nums, n + sum, [n + sum | acc])
end
