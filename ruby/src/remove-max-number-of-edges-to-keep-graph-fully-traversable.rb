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

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def max_num_edges_to_remove(n, edges)
  alice = DisjointSet.new(n + 1)
  bob = DisjointSet.new(n + 1)
  removed = 0
  edges.each do |edge|
    next if edge[0] != 3

    alice.merge!(edge[1], edge[2])
    merged = bob.merge!(edge[1], edge[2])
    removed += 1 unless merged

    merged =
      if edge[0] == 1
        alice.merge!(edge[1], edge[2])
      elsif edge[0] == 2
        bob.merge!(edge[1], edge[2])
      else
        next
      end
    removed += 1 unless merged
  end
  removed
end
