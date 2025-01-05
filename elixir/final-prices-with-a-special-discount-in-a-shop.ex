defmodule Solution do
  @spec final_prices(prices :: [integer]) :: [integer]
  def final_prices(prices), do: recur(prices) |> elem(0)

  def recur([]), do: {[], [0]}
  def recur([p | prices]) do
    {result, stack} = recur(prices)
    stack = Enum.drop_while(stack, fn item -> item > p end)
    {[p - hd(stack) | result], [p | stack]}
  end
end
