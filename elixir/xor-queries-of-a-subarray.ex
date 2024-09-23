defmodule Solution do
  import Bitwise, only: [bxor: 2]

  @spec xor_queries(arr :: [integer], queries :: [[integer]]) :: [integer]
  def xor_queries(arr, queries) do
    pre = prefix(arr)
    Enum.map(queries, fn [a, b] -> bxor(Map.get(pre, a - 1, 0), Map.get(pre, b)) end)
  end

  @spec prefix(numbers :: [integer], sum :: integer, index :: integer, acc :: %{integer => integer}) :: %{integer => integer}
  def prefix(numbers, sum \\ 0, index \\ 0, acc \\ %{})
  def prefix([], _, _, acc), do: acc
  def prefix([num | rest], sum, index, acc), do:
    prefix(rest, bxor(sum, num), index + 1, Map.put(acc, index, bxor(sum, num)))
end
