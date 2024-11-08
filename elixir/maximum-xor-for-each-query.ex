defmodule Solution do
  import Bitwise, only: [bxor: 2, band: 2, bsl: 2]

  @spec get_maximum_xor(nums :: [integer], maximum_bit :: integer) :: [integer]
  def get_maximum_xor(nums, maximum_bit) do
    {result, _} = recur(bsl(1, maximum_bit) - 1, nums, 0)
    Enum.reverse(result)
  end

  defp recur(_, [], xor_sum), do: {[], xor_sum}
  defp recur(mask, [n | nums], xor_sum) do
    {result, new_xor_sum} = recur(mask, nums, bxor(n, xor_sum))

    {[bxor(band(new_xor_sum, mask), mask) | result], bxor(new_xor_sum, n)}
  end
end
