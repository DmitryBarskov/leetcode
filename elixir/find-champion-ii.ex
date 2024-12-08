defmodule Solution do
  @spec find_champion(n :: integer, edges :: [[integer]]) :: integer
  def find_champion(1, _), do: 0
  def find_champion(_, []), do: -1
  def find_champion(n, edges) do
    stronger_than = Map.new(Enum.map(edges, fn [stronger, weaker] -> {weaker, stronger} end))
    if map_size(stronger_than) == n - 1 do
      find_strongest(stronger_than, edges |> hd |> hd)
    else
      -1
    end
  end

  defp find_strongest(map, start) do
    if Map.has_key?(map, start) do
      find_strongest(map, Map.get(map, start))
    else
      start
    end
  end
end
