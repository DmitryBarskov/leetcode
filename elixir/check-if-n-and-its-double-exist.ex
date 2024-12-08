defmodule Solution do
  import Integer

  @spec check_if_exist(arr :: [integer]) :: boolean
  def check_if_exist(arr, previous_numbers \\ MapSet.new())
  def check_if_exist([], _), do: false
  def check_if_exist([num | rest], previous_numbers) do
    cond do
      MapSet.member?(previous_numbers, 2 * num) -> true
      is_even(num) and MapSet.member?(previous_numbers, div(num, 2)) -> true
      true -> check_if_exist(rest, MapSet.put(previous_numbers, num))
    end
  end
end
