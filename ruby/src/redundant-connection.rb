# frozen_string_literal: true

class DisjointSet
  def initialize(size)
    @parent = Array.new(size) { _1 }
    @rank = Array.new(size) { 1 }
  end

  def find_parent(x)
    return x if @parent[x] == x

    @parent[x] = find_parent(@parent[x])
  end

  def merge!(x, y)
    px = find_parent(x)
    py = find_parent(y)

    return false if px == py

    if @rank[px] > @rank[py]
      @parent[py] = px
      @rank[px] += @rank[py]
    else
      @parent[px] = py
      @rank[py] += @rank[px]
    end
    true
  end
end

# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_connection(edges)
  set = DisjointSet.new(edges.size + 1)
  edges.each do |edge|
    return edge unless set.merge!(edge[0], edge[1])
  end
end
