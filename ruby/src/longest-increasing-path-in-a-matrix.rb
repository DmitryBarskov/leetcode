# @param {Integer[][]} matrix
# @return {Integer}
def longest_increasing_path(matrix)
  ans = Array.new(matrix.size) { |i| Array.new(matrix[i].size) }
  in_matrix = ->(i, j) { 0 <= i && i < matrix.size && 0 <= j && j < matrix[i].size }
  recur = ->(i, j) {
    return 0 unless in_matrix[i, j]

    ans[i][j] ||= begin
      adjacent = [[i + 1, j], [i - 1, j], [i, j + 1], [i, j - 1]]
      adjacent
        .filter { |y, x| in_matrix[y, x] }
        .filter { |y, x| matrix[y][x] > matrix[i][j] }
        .map { |y, x| recur.(y, x) }
        .max&.+(1) || 1
    end
  }
  longest = 0
  (0...matrix.size).each do |i|
    (0...matrix[i].size).each do |j|
      longest = [longest, recur.(i, j)].max
    end
  end
  longest
end
