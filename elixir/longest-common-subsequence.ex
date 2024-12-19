defmodule Solution do
  @spec longest_common_subsequence(text1 :: String.t, text2 :: String.t) :: integer
  def longest_common_subsequence(text1, text2) do
    s1 = String.to_charlist(text1)
    s2 = String.to_charlist(text2)
    key = {length(s1) - 1, length(s2) - 1}
    recur(%{}, s1, s2, key) |> Map.get(key)
  end

  def recur(memo, [], _, key), do: Map.put(memo, key, 0)
  def recur(memo, _, [], key), do: Map.put(memo, key, 0)
  def recur(memo, [x | xs] = xss, [y | ys] = yss, {i, j} = key) do
    cond do
      Map.has_key?(memo, key) -> memo
      x == y ->
        memo
        |> recur(xs, ys, {i - 1, j - 1})
        |> then(&Map.put(&1, key, 1 + &1[{i - 1, j - 1}]))
      true ->
        memo
        |> recur(xss, ys, {i, j - 1})
        |> recur(xs, yss, {i - 1, j})
        |> then(&Map.put(&1, key, max(&1[{i, j - 1}], &1[{i - 1, j}])))
    end
  end
end
