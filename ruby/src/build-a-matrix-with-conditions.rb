# @param {Integer} k
# @param {Integer[][]} row_conditions
# @param {Integer[][]} col_conditions
# @return {Integer[][]}
def build_matrix(k, row_conditions, col_conditions)
  row_order = top_sort(row_conditions, k)
  return [] unless row_order

  col_order = top_sort(col_conditions, k)&.each_with_index&.to_h
  return [] unless col_order

  Array.new(k) do |i|
    row = Array.new(k, 0)
    item = row_order[i]
    j = col_order[item]
    row[j] = item
    row
  end
end

def build_graph(k, conditions)
  graph = (1..k).to_h { [_1, Set.new] }
  conditions.each { |before, after| graph[after].add(before) }
  graph
end

def top_sort(conditions, k)
  graph = build_graph(k, conditions)

  order = []
  added = Set.new
  graph.each do |node, _preds|
    next if added.include?(node)

    has_cycle = dfs(graph, node, order: order, visited: added)

    return nil if has_cycle
  end
  order
end

def dfs(graph, node, order:, visited:, path: Set.new)
  return true if path.include?(node)
  return false if visited.include?(node)
  
  visited.add(node)
  path.add(node)
  graph.fetch(node, []).each do |pred|
    has_cycle = dfs(graph, pred, order:, visited:, path:)
    return true if has_cycle
  end
  path.delete(node)
  order.push(node)
  false
end
