defmodule Solution do
  @spec longest_palindrome(s :: String.t) :: String.t
  def longest_palindrome(str), do: String.graphemes(str) |> recur([], [], 0) |> List.to_string

  defp recur([], _, longest, _), do: longest
  defp recur([char | rest] = str, reverse, longest, max_length) do
    even_half = longest_prefix(str, reverse, 0)
    even_palindrome = 2 * even_half
    odd_half = longest_prefix(rest, reverse, 0)
    odd_palindrome = 2 * odd_half + 1

    cond do
      even_palindrome > odd_palindrome and even_palindrome > max_length -> recur(rest, [char | reverse], make_even_palindrome(reverse, even_half), even_palindrome)
      odd_palindrome > even_palindrome and odd_palindrome > max_length -> recur(rest, [char | reverse], make_odd_palindrome(char, reverse, odd_half), odd_palindrome)
      true -> recur(rest, [char | reverse], longest, max_length)
    end
  end

  defp longest_prefix([h1 | t1], [h2 | t2], acc) when h1 == h2, do: longest_prefix(t1, t2, 1 + acc)
  defp longest_prefix(_, _, acc), do: acc

  defp make_even_palindrome(list, prefix) do
    half = Enum.take(list, prefix)
    Enum.reverse(half) ++ half
  end

  defp make_odd_palindrome(center, list, prefix) do
    half = Enum.take(list, prefix)
    Enum.reverse(half) ++ [center | half]
  end
end
