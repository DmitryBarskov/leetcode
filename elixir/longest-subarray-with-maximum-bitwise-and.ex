defmodule Solution do
  @spec longest_subarray(nums :: [integer]) :: integer
  def longest_subarray(nums, max_length \\ 0, current_length \\ 0, max \\ 0)

  def longest_subarray([], max_length, current_length, _), do:
    max(max_length, current_length)
  def longest_subarray([num | rest], max_length, current_length, max) when num > max, do:
    longest_subarray(rest, 1, 1, num)
  def longest_subarray([num | rest], max_length, current_length, max) when num == max, do:
    longest_subarray(rest, max_length, current_length + 1, max)
  def longest_subarray([_ | rest], max_length, current_length, max), do:
    longest_subarray(rest, max(max_length, current_length), 0, max)
end
