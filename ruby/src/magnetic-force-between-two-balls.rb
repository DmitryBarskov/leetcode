# frozen_string_literal: true

# @param {Integer[]} position
# @param {Integer} m
# @return {Integer}
def max_distance(position, m)
  position.sort!
  min = position.first
  max = position.last
  ideal_distance = (max - min) / (m - 1)

  -(-ideal_distance..-1).bsearch do |dist|
    can_place?(position, m, -dist)
  end
end

def can_place?(position, m, dist)
  last_position = position.first
  i = 0
  (m - 1).times do
    i += 1 while i < position.length && position[i] - last_position < dist
    return false if i >= position.length

    last_position = position[i]
  end
  true
end

max_distance([1, 2, 3, 4, 7], 3) => 3
max_distance([1, 2, 3, 4, 1_000_000_000], 2) => 999_999_999
max_distance([5, 4, 3, 2, 1, 1_000_000_000], 2) => 999_999_999
max_distance([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 4) => 3
max_distance([1, 100, 200, 300, 400, 500, 1000], 3) => 499
max_distance([10, 20, 30, 40, 50, 60, 70, 80, 90, 100], 4) => 30
max_distance([1, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100], 5) => 20
