defmodule Solution do
  import Bitwise, only: [bsr: 2, bxor: 2, band: 2]

  @spec min_bit_flips(start :: integer, goal :: integer) :: integer
  def min_bit_flips(start, goal, total \\ 0)
  def min_bit_flips(0, 0, total), do: total
  def min_bit_flips(start, goal, total), do:
    min_bit_flips(bsr(start, 1), bsr(goal, 1), total + bxor(band(start, 1), band(goal, 1)))
end
