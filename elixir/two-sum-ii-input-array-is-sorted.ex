defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target), do: recur(target, nums, 1, Enum.reverse(nums), Enum.count(nums))

  def recur(target, [n | ns] = nums, i, [r | rs] = reversed, j) do
    cond do
      n + r == target -> [i, j]
      n + r > target -> recur(target, nums, i, rs, j - 1)
      n + r < target -> recur(target, ns, i + 1, reversed, j)
    end
  end
end