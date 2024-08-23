defmodule Solution do
  @spec maximum_value(strs :: [String.t]) :: integer
  def maximum_value(strs), do:
    strs
    |> Enum.map(&(to_i(&1)))
    |> Enum.max()

  defp to_i(str) do
    case Integer.parse(str) do
      {value, ""} -> value
      _ -> String.length(str)
    end
  end
end
