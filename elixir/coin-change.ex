defmodule Solution do
  @spec coin_change(coins :: [integer], amount :: integer) :: integer
  def coin_change(coins, amount) do
    recur(coins, amount, Map.new())
    |> Map.get({coins, amount})
  end

  def recur(coins, 0, memo), do: Map.put(memo, {coins, 0}, 0)
  def recur(coins, amount, memo) when amount < 0, do: Map.put(memo, {coins, amount}, -1)
  def recur([], amount, memo), do: Map.put(memo, {[], amount}, -1)
  def recur([c | coins], amount, memo) do
    if Map.has_key?(memo, {[c | coins], amount}) do
      memo
    else
      included = recur([c | coins], amount - c, memo)
      excluded = recur(coins, amount, included)
      Map.put(
        excluded,
        {[c | coins], amount},
        minimum(
          inc(excluded[{[c | coins], amount - c}]),
          excluded[{coins, amount}]
        )
      )
    end
  end

  def inc(-1), do: -1
  def inc(num), do: num + 1

  def minimum(-1, second), do: second
  def minimum(first, -1), do: first
  def minimum(first, second) when first < second, do: first
  def minimum(_, second), do: second
end
