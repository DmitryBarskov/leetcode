defmodule Solution do
  @spec largest_odd_number(num :: String.t) :: String.t
  def largest_odd_number(num), do: num |> String.graphemes |> recur |> List.to_string

  def recur([]), do: []
  def recur([d | num]) do
    rest = recur(num)
    case {rest, odd?(d)} do
      {[], true} -> [d]
      {[], false} -> []
      _ -> [d | rest]
    end
  end

  def odd?(num) do
    case Integer.parse(num) do
      {digit, ""} -> rem(digit, 2) == 1
      _ -> false
    end
  end
end
