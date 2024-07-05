# frozen_string_literal: true

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[][]}
def get_ancestors(n, edges)
  direct_ancestors = Array.new(n) { [] }
  edges.each { |parent, child| direct_ancestors[child].push(parent) }

  all_ancestors = Array.new(n)
  stack = (0...n).to_a
  while stack.any?
    node = stack.last
    next stack.pop if all_ancestors[node]

    solved = true
    direct_ancestors[node].each do |parent|
      next if all_ancestors[parent]

      solved = false
      stack.push(parent)
    end

    next unless solved

    stack.pop
    all_ancestors[node] = direct_ancestors[node].flat_map { all_ancestors[_1] }
    all_ancestors[node].concat(direct_ancestors[node])
    all_ancestors[node].sort!.uniq!
  end
  all_ancestors
end
