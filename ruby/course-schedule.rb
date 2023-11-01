# frozen_string_literal: true

# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  !cycled?(build_graph(num_courses, prerequisites))
end

def build_graph(number_of_nodes, edges)
  Array.new(number_of_nodes) { [] }.tap do |graph|
    edges.each do |from, to|
      graph[from] << to
    end
  end
end

def cycled?(graph)
  visited = Array.new(graph.size) { false }

  rec = lambda { |path, current_node|
    visited[current_node] = true

    return true if path.include?(current_node)

    graph[current_node].any? do |adjacent|
      rec.call(path + [current_node], adjacent)
    end
  }

  graph.size.times do |starting_node|
    next if visited[starting_node]

    cycle_found = rec.call([], starting_node)

    return true if cycle_found
  end
  false
end
