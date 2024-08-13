defmodule Solution do
  @spec plus_one(digits :: [integer]) :: [integer]
  def plus_one(digits) do
    case recur(digits) do
      {0, res} -> res
      {1, res} -> [1 | res]
    end
  end

  def recur([9]), do: {1, [0]}
  def recur([d]), do: {0, [d + 1]}
  def recur([d | rest]) do
    case recur(rest) do
      {carry, incremented} -> {div(d + carry, 10), [rem(d + carry, 10) | incremented]}
    end
  end
end
