defmodule Solution do
  require Integer

  @spec can_partition(nums :: [integer]) :: boolean
  def can_partition(nums) do
    sum = Enum.sum(nums)
    target = div(sum, 2)
    Integer.is_even(sum) and recur(target, nums, 0, %{}) |> Map.get({nums, 0})
  end

  defp recur(target, nums, sum, memo) when sum > target,
    do: Map.put(memo, {nums, sum}, false)
  defp recur(target, [], sum, memo),
    do: Map.put(memo, {[], sum}, target == sum)
  defp recur(target, nums, sum, memo) do
    if Map.has_key?(memo, {nums, sum}) do
      memo
    else
      memo = recur(target, tl(nums), sum + hd(nums), memo)
      memo = Map.put(memo, {nums, sum}, memo[{tl(nums), sum + hd(nums)}])
      if memo[{nums, sum}] do
        memo
      else
        memo = recur(target, tl(nums), sum, memo)
        Map.put(memo, {nums, sum}, memo[{tl(nums), sum}])
      end
    end
  end
end
