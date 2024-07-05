# frozen_string_literal: true

# @param {Integer} n
# @param {Integer[][]} roads
# @return {Integer}
def maximum_importance(n, roads)
  roads_count = Array.new(n, 0)
  roads.each do |road|
    road.each do |city|
      roads_count[city] += 1
    end
  end
  roads_count.lazy.sort.zip(1..n).sum { _1 * _2 }
end

maximum_importance(5, [[0,1],[1,2],[2,3],[0,2],[1,3],[2,4]]) => 43
maximum_importance(5, [[0,3],[2,4],[1,3]]) => 20
