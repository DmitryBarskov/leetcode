defmodule Solution do
  @spec sum_subarray_mins(arr :: [integer]) :: integer
  def sum_subarray_mins(arr) do
    rec(arr, 0)
  end

  defp rec([], acc) do
    acc
  end

  defp rec([head | tail], acc) do
    sum = Enum.reduce(
      tail,
      %{s: 0, min: head},
      fn val, acc ->
        %{ s: acc[:s] + acc[:min], min: min(acc[:min], val) }
      end
    )
    rec(tail, rem(acc + sum[:s] + sum[:min], 1_000_000_007))
  end
end
IO.puts(Solution.sum_subarray_mins([3, 1, 2, 4]))
