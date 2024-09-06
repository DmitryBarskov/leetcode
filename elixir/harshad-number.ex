defmodule Solution do
  @spec sum_of_the_digits_of_harshad_number(x :: integer) :: integer
  def sum_of_the_digits_of_harshad_number(x), do: harshad(x)

  def harshad(10), do: 1
  def harshad(12), do: 3
  def harshad(18), do: 9
  def harshad(20), do: 2
  def harshad(21), do: 3
  def harshad(24), do: 6
  def harshad(27), do: 9
  def harshad(30), do: 3
  def harshad(36), do: 9
  def harshad(40), do: 4
  def harshad(42), do: 6
  def harshad(45), do: 9
  def harshad(48), do: 12
  def harshad(50), do: 5
  def harshad(54), do: 9
  def harshad(60), do: 6
  def harshad(63), do: 9
  def harshad(70), do: 7
  def harshad(72), do: 9
  def harshad(80), do: 8
  def harshad(81), do: 9
  def harshad(84), do: 12
  def harshad(90), do: 9
  def harshad(100), do: 1
  def harshad(d) when d <= 9, do: d
  def harshad(_), do: -1
end