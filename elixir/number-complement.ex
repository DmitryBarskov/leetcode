defmodule Solution do
  @spec find_complement(num :: integer) :: integer
  def find_complement(num, complement \\ 0, i \\ 0)
  def find_complement(0, complement, _), do: complement
  def find_complement(num, complement, i) do
    bit_complement = num |> rem(2) |> Bitwise.bxor(1) |> Bitwise.bsl(i)
    find_complement(div(num, 2), Bitwise.bor(complement, bit_complement), i + 1)
  end
end