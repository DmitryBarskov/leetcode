# frozen_string_literal: true

# https://leetcode.com/problems/course-schedule/

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
  rec = lambda { |path, current_node, not_in_loop, visited|
    visited.add(current_node)

    return false if not_in_loop.include?(current_node)
    return true if path.include?(current_node)

    graph[current_node].any? do |adjacent|
      rec.call(path + [current_node], adjacent, not_in_loop, visited)
    end
  }

  unvisited_nodes = Set.new(0...graph.size)
  not_in_loop = Set.new

  until unvisited_nodes.empty?
    unvisited_node = unvisited_nodes.first

    visited_nodes = Set.new
    cycle_found = rec.call([], unvisited_node, not_in_loop, visited_nodes)

    return true if cycle_found

    visited_nodes.each do |visited_node|
      unvisited_nodes.delete(visited_node)
      not_in_loop.add(visited_node)
    end
  end
  false
end
