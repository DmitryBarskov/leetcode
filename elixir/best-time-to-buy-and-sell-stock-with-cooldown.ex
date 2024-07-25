defmodule Solution do
  @spec max_profit(prices :: [integer]) :: integer
  def max_profit(prices), do: recur(%{}, prices, 1)

  @spec recur(cache :: %{[integer] => %{ integer => integer }}, prices :: [integer], can_buy :: integer) :: integer
  def recur(cache, [], _), do: 0
  def recur(cache, prices, can_buy) when cache[prices][can_buy], do: cache[prices][can_buy]
  def recur(cache, prices, 1), do: Map.put(cache, prices, max(recur(cache, tl(prices), 0) - hd(prices), recur(cache, tl(prices), 1)))
  def recur(cache, prices, 0), do: Map.put(cache, prices, max(recur(cache, tl(tl(prices)), 1) + hd(prices), recur(cache, tl(prices), 0)))
end
