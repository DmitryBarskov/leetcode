defmodule Solution do
  @spec has_trailing_zeros(nums :: [integer]) :: boolean
  def has_trailing_zeros(nums, even_numbers \\ 0)
  def has_trailing_zeros(_, even_numbers) when even_numbers >= 2, do: true
  def has_trailing_zeros([], _), do: false
  def has_trailing_zeros([num | nums], even_numbers), do:
    has_trailing_zeros(nums, even_numbers + (1 - (Bitwise.band(num, 1))))
end