defmodule Solution do
  @spec minimum_size(nums :: [integer], max_operations :: integer) :: integer
  def minimum_size(nums, max_operations) do
    max_bags = length(nums) + max_operations
    binary_search(
      1, Enum.sum(nums),
      fn max_balls ->
        Enum.reduce(
          nums,
          0,
          fn num, total_bags ->
            total_bags + ceil(num / max_balls)
          end
        ) <= max_bags
      end
    )
  end

  def binary_search(from, to, _) when from >= to, do: from
  def binary_search(from, to, predicate) do
    mi = div(from + to, 2)
    if predicate.(mi) do
      binary_search(from, mi, predicate)
    else
      binary_search(mi + 1, to, predicate)
    end
  end
end