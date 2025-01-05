defmodule Solution do
  @spec find_target_sum_ways(nums :: [integer], target :: integer) :: integer
  def find_target_sum_ways(nums, target) do
    recur(nums, target, %{}) |> Map.get({nums, target})
  end

  def recur([], 0, memo), do: Map.put(memo, {[], 0}, 1)
  def recur([], acc, memo), do: Map.put(memo, {[], acc}, 0)
  def recur([x | xs] = nums, acc, memo) do
    if Map.has_key?(memo, {nums, acc}) do
      memo
    else
      memo = recur(xs, acc + x, memo)
      memo = recur(xs, acc - x, memo)
      Map.put(memo, {nums, acc}, memo[{xs, acc + x}] + memo[{xs, acc - x}])
    end
  end
end
