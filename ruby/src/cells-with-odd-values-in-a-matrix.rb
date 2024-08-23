# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} indices
# @return {Integer}
def odd_cells(m, n, indices)
  matrix = Array.new(m) { Array.new(n, 0) }
  indices.each do |r, c|
    (0...n).each { matrix[r][_1] += 1 }
    (0...m).each { matrix[_1][c] += 1 }
  end
  matrix.sum { _1.count(&:odd?) }
end
