# @param {Integer} n
# @param {Integer[][]} edges
# @param {Float[]} succ_prob
# @param {Integer} start_node
# @param {Integer} end_node
# @return {Float}
def max_probability(n, edges, succ_prob, start_node, end_node)
  graph = Array.new(n) { [] }
  (0...edges.size).each do |i|
    prob = succ_prob[i]
    from, to = edges[i]
    graph[from].append([to, prob])
    graph[to].append([from, prob])
  end
  reachable = Containers::MaxHeap.new
  reachable.push([1.0, start_node])
  reached = Set.new
  while reachable.size > 0
    prob, node = reachable.pop
    return prob if node == end_node
    next if reached.include?(node)
    reached.add(node)

    graph[node].each do |adj, pr|
      reachable.push([prob * pr, adj])
    end
  end
  0.0
end
