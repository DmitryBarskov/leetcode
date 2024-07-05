# frozen_string_literal: true

def heap_push(array, item)
  array.push(item)

  from = array.size - 1
  while from.positive?
    parent = (from - 1) / 2
    break if yield(array[parent], array[from]) >= 0

    array[parent], array[from] = array[from], array[parent]
    from = parent
  end
end

def heap_pop(array)
  array[0] = array.last
  array.pop

  from = 0
  while from < array.size
    i = (2 * from) + 1
    break if i >= array.size || yield(array[from], array[i]) >= 0

    j = (2 * from) + 2

    child = i
    child = j if j < array.size && yield(array[i], array[j]).negative?
    array[from], array[child] = array[child], array[from]
    from = child
  end
end

# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
def k_closest(points, k)
  compare = proc { |p1, p2| (p1[0] * p1[0]) + (p1[1] * p1[1]) <=> (p2[0] * p2[0]) + (p2[1] * p2[1]) }
  result = []
  points.each do |p|
    next if result.size >= k && compare[result.first, p] <= 0

    heap_push(result, p, &compare)
    heap_pop(result, &compare) if result.size > k
  end
  result
end

k_closest([[1,3],[-2,2]], 1).sort => [[-2, 2]]
k_closest([[3,3],[5,-1],[-2,4]], 2).sort => [[-2, 4], [3, 3]]
k_closest(
  [[32,-20],[34,-34],[34,-31],[-53,52],[-98,-70],[-15,73],[-41,-94],[95,-78],[-42,-7],[-11,-37],[-94,26],[-74,-53],
   [68,72],[2,-80],[-58,-94],[48,-80],[-57,-35]], 10
).sort => [[-74, -53], [-57, -35], [-53, 52], [-42, -7], [-15, 73], [-11, -37], [2, -80], [32, -20], [34, -34], [34, -31]]
