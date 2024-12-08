defmodule Solution do
  @spec rob(nums :: [integer]) :: integer
  def rob([x]), do: x
  def rob([n | rest] = nums) do
    max(recur(rest, 0, 0), recur(Enum.reverse(nums) |> tl, 0, 0))
  end

  def recur([], must_skip, can_rob), do: max(must_skip, can_rob)
  def recur([n | nums], must_skip, can_rob), do: recur(nums, max(must_skip, can_rob + n), must_skip)
end
