defmodule Solution do
  defguard alpha?(c) when "a" <= c and c <= "z" or "0" <= c and c <= "9"

  @spec is_palindrome(s :: String.t) :: boolean
  def is_palindrome(s), do: recur(String.downcase(s), 0, String.length(s) - 1)

  def recur(_, l, r) when l >= r, do: true
  def recur(s, l, r) do
    cond do
      not alpha?(at(s, l)) -> recur(s, l + 1, r)
      not alpha?(at(s, r)) -> recur(s, l, r - 1)
      at(s, l) != at(s, r) -> false
      true -> recur(s, l + 1, r - 1)
    end
  end

  def at(s, i), do: binary_slice(s, i, 1)
end