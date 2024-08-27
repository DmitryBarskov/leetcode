defmodule Solution do
  @spec triangle_type(nums :: [integer]) :: String.t
  def triangle_type(nums) do
    [a, b, c] = Enum.sort(nums)
    cond do
      a + b <= c -> "none"
      a == b and b == c -> "equilateral"
      a == b or b == c -> "isosceles"
      true -> "scalene"
    end
  end
end
