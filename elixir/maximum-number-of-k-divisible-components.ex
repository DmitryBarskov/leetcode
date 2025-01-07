defmodule Solution do
  @spec max_k_divisible_components(n :: integer, edges :: [[integer]], values :: [integer], k :: integer) :: integer
  def max_k_divisible_components(n, edges, values, k) do
    graph = build_adjacency_map(n, edges)
    values = Map.new(Enum.with_index(values) |> Enum.map(fn {v, i} -> {i, v} end))
    dfs(graph, values, k, 0, nil) |> elem(1)
  end

  def dfs(graph, values, k, current, parent) do
    {sum, components} = Enum.reduce(
      graph[current],
      {values[current], 0},
      fn adj, {total, s} ->
        if adj == parent do
          {total, s}
        else
          {rest_total, rest_sum} = dfs(graph, values, k, adj, current)
          {total + rest_total, s + rest_sum}
        end
      end
    )
    if rem(sum, k) == 0 do
      {sum, components + 1}
    else
      {sum, components}
    end
  end

  def build_adjacency_map(nodes, edges) do
    Enum.reduce(
      edges,
      Map.new(Enum.map(0..nodes - 1, fn n -> {n, []} end)),
      fn [a, b], adj ->
        adj
        |> Map.update(a, [b], &([b | &1]))
        |> Map.update(b, [a], &([a | &1]))
      end
    )
  end
end
