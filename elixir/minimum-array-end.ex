defmodule Solution do
  import Bitwise, only: [band: 2, bor: 2, bsr: 2, bsl: 2]

  @spec min_end(n :: integer, x :: integer) :: integer
  def min_end(n, x), do: combine(x, n - 1)
  
  defp combine(mask, 0), do: mask
  defp combine(mask, number) do
    if band(mask, 1) == 1 do
      mask |> bsr(1) |> combine(number) |> bsl(1) |> bor(1)
    else
      combine(bsr(mask, 1), bsr(number, 1)) |> bsl(1) |> bor(band(number, 1))
    end
  end
end
