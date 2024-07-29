require 'algorithms'

# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} time
# @param {Integer} change
# @return {Integer}
def second_minimum(n, edges, time, change)
  graph = (1..n).to_h { [_1, []] }
  edges.each do |from, to|
    graph[from].push(to)
    graph[to].push(from)
  end

  q = Containers::Queue.new([1])
  current_time = 0
  minimum_times = Set.new
  visit_times = (1..n).to_h { [_1, []] }

  until q.empty?
    q.size.times do
      node = q.pop
      if node == n
        minimum_times.add(current_time)
        return minimum_times.max if minimum_times.size >= 2
      end
      graph[node].each do |neighbor|
        if visit_times[neighbor].empty? || (visit_times[neighbor].size == 1 && !visit_times[neighbor].include?(current_time))
          q.push(neighbor)
          visit_times[neighbor].push(current_time)
        end
      end
    end
    green_light = current_time % (2 * change) < change
    unless green_light
      current_time += change - (current_time % change)
    end
    current_time += time
  end
end

second_minimum(5, [[1,2],[1,3],[1,4],[3,4],[4,5]], 3, 5) => 13
second_minimum(2, [[1,2]], 3, 2) => 11
edges = (1..10000).each_cons(2).to_a + [[100,102],[102,110]]
second_minimum(10000, edges, 1000, 1000) => 19983000
