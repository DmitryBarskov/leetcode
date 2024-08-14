# @param {Integer} rows
# @param {Integer} cols
# @param {Integer} r_start
# @param {Integer} c_start
# @return {Integer[][]}
def spiral_matrix_iii(rows, cols, r_start, c_start)
  spiral = [[r_start, c_start]]

  append = ->(r, c) {
    return if r < 0 || r >= rows
    return if c < 0 || c >= cols

    spiral.append([r, c])
  }

  r = r_start
  c = c_start
  step = 1
  [c_start + 1, cols - c_start, r_start + 1, rows - r_start].max.times do
    step.times do
      c += 1
      append[r, c]
    end
    step.times do
      r += 1
      append[r, c]
    end
    step += 1
    step.times do
      c -= 1
      append[r, c]
    end
    step.times do
      r -= 1
      append[r, c]
    end
    step += 1
  end

  spiral
end
