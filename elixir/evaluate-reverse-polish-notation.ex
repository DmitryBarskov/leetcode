defmodule Solution do
  @spec eval_rpn(tokens :: [String.t]) :: integer
  def eval_rpn(tokens, stack \\ [])
  def eval_rpn([], [result]), do: result
  def eval_rpn(["+" | tokens], [a, b | stack]), do: eval_rpn(tokens, [a + b | stack])
  def eval_rpn(["*" | tokens], [a, b | stack]), do: eval_rpn(tokens, [a * b | stack])
  def eval_rpn(["-" | tokens], [a, b | stack]), do: eval_rpn(tokens, [b - a | stack])
  def eval_rpn(["/" | tokens], [a, b | stack]), do: eval_rpn(tokens, [div(b, a) | stack])
  def eval_rpn([num | tokens], stack), do: eval_rpn(tokens, [num |> Integer.parse() |> elem(0) | stack])
end
