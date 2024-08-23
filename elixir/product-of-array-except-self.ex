defmodule Solution do
  @spec product_except_self(nums :: [integer]) :: [integer]
  def product_except_self(nums), do: zip(1, nums, tl(products(nums)))

  def zip(prev, _, []), do: [prev]
  def zip(prev, [n | nums], [p | ps]) do
    [p * prev | zip(prev * n, nums, ps)]
  end

  def products([n]), do: [n]
  def products([n | nums]) do
    [pred | rest] = products(nums)
    [n * pred, pred | rest]
  end
end
