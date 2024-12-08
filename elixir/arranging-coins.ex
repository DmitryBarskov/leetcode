defmodule Solution do
  @spec arrange_coins(n :: integer) :: integer
  def arrange_coins(n), do: floor((:math.sqrt(1 + 8 * n) - 1) / 2)
end
