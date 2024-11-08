defmodule Solution do
  @spec rotate_string(s :: String.t, goal :: String.t) :: boolean
  def rotate_string(s, goal), do:
    String.length(s) == String.length(goal) and Enum.any?(0..(String.length(s) - 1), &(match?(&1, s, 0, goal)))

  def match?(offset, s, j, goal), do:
    j >= String.length(goal) or (String.at(s, Integer.mod(offset, String.length(s))) == String.at(goal, j) and match?(offset + 1, s, j + 1, goal))
end
